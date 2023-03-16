package mollie.basic.modules.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import mollie.basic.common.utils.RunCodeUtils;
import mollie.basic.modules.check.dao.ExamCheckoutDao;
import mollie.basic.modules.check.service.ExamCheckoutService;
import mollie.basic.modules.exam.dao.ExamPoolDao;
import mollie.basic.modules.exam.dao.UserSignDao;
import mollie.basic.modules.exam.entity.*;
import mollie.basic.modules.exam.service.UserSignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.reactive.function.client.WebClientAutoConfiguration;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;

import mollie.basic.modules.exam.dao.UserExamDao;
import mollie.basic.modules.exam.service.UserExamService;
import org.springframework.util.CollectionUtils;


@Service("userExamService")
public class UserExamServiceImpl extends ServiceImpl<UserExamDao, UserExamEntity> implements UserExamService {
    
    @Autowired
    private ExamCheckoutService examCheckoutService;
    @Autowired
    private UserSignDao userSignDao;
    @Autowired
    private UserExamDao userExamDao;
    @Autowired
    private ExamPoolDao examPoolDao;
    
    @Override
    public List<UserExamResponseVO> userExamInfo(Map<String, Object> params) {
        if (!CollectionUtils.isEmpty(params)) {
            Long userId = Long.parseLong((String) params.get("userId"));
            Long checkId = Long.parseLong((String) params.get("checkId"));
            //获取答题页数据
            List<ExamPoolEntity> examPoolEntities = examCheckoutService.checkExam(checkId);
            List<UserExamResponseVO> userExamResponseVOS = new ArrayList<>();
            examPoolEntities.forEach(examPoolEntity -> {
                UserExamResponseVO userExamResponseVO = new UserExamResponseVO();
                userExamResponseVO.setExamId(examPoolEntity.getId());
                userExamResponseVO.setTitle(examPoolEntity.getTitle());
                userExamResponseVO.setExamType(examPoolEntity.getExamType());
                userExamResponseVO.setScore(examPoolEntity.getScore());
                userExamResponseVO.setAnswer(examPoolEntity.getAnswer());
                userExamResponseVO.setExamSource(examPoolEntity.getExamSource());
                userExamResponseVOS.add(userExamResponseVO);
            });
            // 设置签到状态
            UserSignEntity userSignEntity = userSignDao.selectOne(new LambdaQueryWrapper<UserSignEntity>()
                    .eq(UserSignEntity::getUserId, userId)
                    .eq(UserSignEntity::getCheckId, checkId));
            userSignEntity.setIsDone(1);
            userSignDao.updateById(userSignEntity);
            return userExamResponseVOS;
        }
        return null;
    }
    
    @Override
    public boolean saveExams(SaveExamDTO saveExamDTO) {
        Long userId = saveExamDTO.getUserId();
        Long checkId = saveExamDTO.getCheckId();
    
        // 拿出试卷
        List<UserExamResponseVO> userExams = saveExamDTO.getUserExams();
        userExams.forEach(userExamResponseVO -> {
            UserExamEntity userExamEntity = new UserExamEntity();
            //执行Java代码
            if ("JAVA".equals(userExamResponseVO.getExamType())) {
                RunCodeUtils.saveJavaCode(userExamResponseVO.getExamSource());
                // 返回结果
                String userAnswer = RunCodeUtils.runJavaCode();
                saveUserExams(userId, checkId, userExamResponseVO, userExamEntity, userAnswer);
            }
            if ("PYTHON".equals(userExamResponseVO.getExamType())) {
                RunCodeUtils.savePythonCode(userExamResponseVO.getExamSource());
                String userAnswer = RunCodeUtils.runPythonCode();
                saveUserExams(userId, checkId, userExamResponseVO, userExamEntity, userAnswer);
            }
        });
    
        // 设置签到状态
        UserSignEntity userSignEntity = userSignDao.selectOne(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getUserId, userId)
                .eq(UserSignEntity::getCheckId, checkId));
        userSignEntity.setIsDone(2);
        return userSignDao.updateById(userSignEntity) == 1;
    }
    
    @Override
    public List<UserExamEntity> allExam(Long userId, Long checkId) {
        List<UserExamEntity> userExamEntities = userExamDao.selectList(new LambdaQueryWrapper<UserExamEntity>()
                .eq(UserExamEntity::getUserId, userId)
                .eq(UserExamEntity::getCheckId, checkId));
        userExamEntities.forEach(userExamEntity -> {
            Long examId = userExamEntity.getExamId();
            ExamPoolEntity examPoolEntity = examPoolDao.selectById(examId);
            UserExamResponseVO userExamResponseVO = new UserExamResponseVO();
            userExamResponseVO.setExamId(examId);
            userExamResponseVO.setExamType(examPoolEntity.getExamType());
            userExamResponseVO.setTitle(examPoolEntity.getTitle());
            userExamResponseVO.setScore(examPoolEntity.getScore());
            userExamResponseVO.setAnswer(examPoolEntity.getAnswer());
            userExamEntity.setUserExamResponseVO(userExamResponseVO);
        });
        
        return userExamEntities;
    }
    
    private void saveUserExams(Long userId, Long checkId, UserExamResponseVO userExamResponseVO, UserExamEntity userExamEntity, String userAnswer) {
        Integer score = Objects.equals(userAnswer, userExamResponseVO.getAnswer()) ? userExamResponseVO.getScore() : 0;
        
        userExamEntity.setUserId(userId);
        userExamEntity.setExamId(userExamResponseVO.getExamId());
        userExamEntity.setExamAnswer(userExamResponseVO.getAnswer());
        userExamEntity.setExamSource(userExamResponseVO.getExamSource());
        userExamEntity.setUserScore(score);
        userExamEntity.setUserAnswer(userAnswer);
        userExamEntity.setCheckId(checkId);
        
        userExamDao.insert(userExamEntity);
    }
}