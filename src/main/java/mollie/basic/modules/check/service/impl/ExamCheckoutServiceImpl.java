package mollie.basic.modules.check.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import mollie.basic.common.utils.R;
import mollie.basic.modules.check.entity.CheckExamVoDTO;
import mollie.basic.modules.check.entity.DelCheckDTO;
import mollie.basic.modules.check.entity.UserInfoResponseVo;
import mollie.basic.modules.exam.dao.ExamPoolDao;
import mollie.basic.modules.exam.dao.UserExamDao;
import mollie.basic.modules.exam.dao.UserSignDao;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.exam.entity.UserExamEntity;
import mollie.basic.modules.exam.entity.UserSignEntity;
import mollie.basic.modules.paper.dao.PaperModelDao;
import mollie.basic.modules.sys.dao.SysUserDao;
import mollie.basic.modules.sys.entity.SysUserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;

import mollie.basic.modules.check.dao.ExamCheckoutDao;
import mollie.basic.modules.check.entity.ExamCheckoutEntity;
import mollie.basic.modules.check.service.ExamCheckoutService;
import org.springframework.util.CollectionUtils;


@Service("examCheckoutService")
public class ExamCheckoutServiceImpl extends ServiceImpl<ExamCheckoutDao, ExamCheckoutEntity> implements ExamCheckoutService {
    
    @Autowired
    private ExamCheckoutDao examCheckoutDao;
    @Autowired
    private PaperModelDao paperModelDao;
    @Autowired
    private ExamPoolDao examPoolDao;
    @Autowired
    private UserSignDao userSignDao;
    @Autowired
    private SysUserDao sysUserDao;
    @Autowired
    private UserExamDao userExamDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ExamCheckoutEntity> page = this.page(
                new Query<ExamCheckoutEntity>().getPage(params),
                new QueryWrapper<ExamCheckoutEntity>()
        );
        List<ExamCheckoutEntity> examCheckoutEntities = page.getRecords();
        examCheckoutEntities.forEach(examCheckoutEntity -> {
            //checkId
            Long id = examCheckoutEntity.getId();
            // 获取对应的试题
            List<ExamPoolEntity> examPoolEntities = examCheckoutDao.checkExam(id);
            Integer totalScore = examPoolEntities.stream().map(ExamPoolEntity::getScore).reduce(0, Integer::sum);
            Integer totalLevel = examPoolEntities.stream().map(ExamPoolEntity::getExamLevel).reduce(0, Integer::sum);
            if (examPoolEntities.size() != 0) {
                totalLevel = (Integer) (totalLevel / examPoolEntities.size());
                examCheckoutDao.setScoreLevel(id, totalScore, totalLevel);
            } else {
                examCheckoutDao.setScoreLevel(id, 0, 1);
            }
        });
        return new PageUtils(page);
    }
    
    @Override
    public List<ExamPoolEntity> checkExam(Long id) {
        return examCheckoutDao.checkExam(id);
    }
    
    @Override
    public int saveCheck(CheckExamVoDTO checkExamVoDTO) {
        int result = 0;
        Long checkId = checkExamVoDTO.getCheckId();
        //试卷模型id
        Long paperId = checkExamVoDTO.getPaperId();
        //利用试卷模型id查找该模型下的试题
        List<ExamPoolEntity> examPoolEntities = paperModelDao.paperExam(paperId);
        for (int i = 0; i < examPoolEntities.size(); i++) {
            Long examId = examPoolEntities.get(i).getId();
            result = examCheckoutDao.saveCheck(checkId, examId);
            // 更新分数
            if (result != 0) {
                Integer score = examPoolDao.selectById(examId).getScore();
                ExamCheckoutEntity examCheckoutEntity = examCheckoutDao.selectById(checkId);
                examCheckoutEntity.setTotalScore(examCheckoutEntity.getTotalScore() + score);
                examCheckoutDao.updateById(examCheckoutEntity);
            }
        }
        return result;
    }
    
    @Override
    public void delCheck(DelCheckDTO delCheckDTO) {
        Long checkId = delCheckDTO.getCheckId();
        Long examId = delCheckDTO.getExamId();
        int result = examCheckoutDao.delCheck(checkId, examId);
        //减掉分数
        if (result != 0) {
            ExamCheckoutEntity examCheckoutEntity = new ExamCheckoutEntity();
            examCheckoutEntity.setId(checkId);
            //总分数
            Integer totalScore = examCheckoutDao.selectById(checkId).getTotalScore();
            Integer score = examPoolDao.selectById(examId).getScore();
            examCheckoutEntity.setTotalScore(totalScore - score);
            examCheckoutDao.updateById(examCheckoutEntity);
        }
    }
    
    @Override
    public List<ExamPoolEntity> noCheckExam(Long id) {
        return examCheckoutDao.noCheckExam(id);
    }
    
    @Override
    public int saveExam(DelCheckDTO delCheckDTO) {
    
        Long checkId = delCheckDTO.getCheckId();
        Long examId = delCheckDTO.getExamId();
        int result = examCheckoutDao.saveCheck(checkId, examId);
        if (result != 0) {
            Integer score = examPoolDao.selectById(examId).getScore();
            Integer totalScore = examCheckoutDao.selectById(checkId).getTotalScore();
            ExamCheckoutEntity examCheckoutEntity = new ExamCheckoutEntity();
            examCheckoutEntity.setId(checkId);
            examCheckoutEntity.setTotalScore(totalScore + score);
            examCheckoutDao.updateById(examCheckoutEntity);
        }
        return result;
    }
    
    @Override
    public List<UserInfoResponseVo> userInfo(Long checkId) {
        
        List<UserInfoResponseVo> userInfoResponseVos = new ArrayList<>();
        
        List<UserSignEntity> userSignEntities = userSignDao.selectList(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getCheckId, checkId));
        
        userSignEntities.forEach(userSignEntity -> {
            UserInfoResponseVo userInfoResponseVo = new UserInfoResponseVo();
            userInfoResponseVo.setIsDone(userSignEntity.getIsDone());
            userInfoResponseVo.setSignTime(userSignEntity.getSignTime());
            SysUserEntity sysUserEntity = sysUserDao.selectById(userSignEntity.getUserId());
            userInfoResponseVo.setUserName(sysUserEntity.getUsername());
    
            List<UserExamEntity> userExamEntities1 = userExamDao.selectList(new LambdaQueryWrapper<UserExamEntity>()
                    .eq(UserExamEntity::getCheckId, checkId)
                    .eq(UserExamEntity::getUserId, userSignEntity.getUserId()));
    
    
            userInfoResponseVo.setSubmitTime(userExamEntities1.get(0).getCreateTime());
    
            List<UserExamEntity> userExamEntities = userExamDao.selectList(new LambdaQueryWrapper<UserExamEntity>()
                    .eq(UserExamEntity::getCheckId, checkId)
                    .eq(UserExamEntity::getUserId, userSignEntity.getUserId()));
            Integer userScore = userExamEntities.stream().map(UserExamEntity::getUserScore).reduce(0, Integer::sum);
            userInfoResponseVo.setUserScore(userScore);
    
            Integer totalScore = examCheckoutDao.selectById(checkId).getTotalScore();
            userInfoResponseVo.setTotalScore(totalScore);
    
            userInfoResponseVos.add(userInfoResponseVo);
        });
        
        return userInfoResponseVos;
    }
    // 获取考核人数、及格率、平均分、最高分、及格人数、未及格人数
    @Override
    public R getllScope(Long checkId) {
    
        // 考核人数
        Integer userNums = userSignDao.selectCount(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getCheckId, checkId)
                .eq(UserSignEntity::getIsDone, 2));
        List<UserSignEntity> userSignEntities = userSignDao.selectList(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getCheckId, checkId));
        List<Integer> userScores = new ArrayList<>();
        // 分数 人数
        Map<Integer, Integer> map = new HashMap<>();
        userSignEntities.forEach(userSignEntity -> {
            Long userId = userSignEntity.getUserId();
            List<UserExamEntity> userExamEntities = userExamDao.selectList(new LambdaQueryWrapper<UserExamEntity>()
                    .eq(UserExamEntity::getCheckId, checkId)
                    .eq(UserExamEntity::getUserId, userId));
            
            //用户分数
            Integer userScore = userExamEntities.stream().map(UserExamEntity::getUserScore).reduce(0, Integer::sum);
            userScores.add(userScore);
            ExamCheckoutEntity examCheckoutEntity = examCheckoutDao.selectById(checkId);
            //卷面总分值
            Integer totalScore = examCheckoutEntity.getTotalScore();
        });
        
        //计算平均分
        int averageScore;
        //计算最高分
        int maxScore;
        if (!CollectionUtils.isEmpty(userScores)) {
            averageScore = userScores.stream().reduce(0, Integer::sum) / userScores.size();
            maxScore = userScores.stream().max(Integer::compareTo).get();
        } else {
            averageScore = 0;
            maxScore = 0;
        }
        long scope90 = 0;
        long scope70 = 0;
        long scope50 = 0;
        long scope30 = 0;
        long scope10 = 0;
        long scope0 = 0;
        if (!CollectionUtils.isEmpty(userScores)) {
            scope90 = userScores.stream().filter(userScore -> userScore > 90).count();
            scope70 = userScores.stream().filter((userScore -> userScore <= 90 && userScore > 70)).count();
            scope50 = userScores.stream().filter((userScore -> userScore <= 70 && userScore > 50)).count();
            scope30 = userScores.stream().filter((userScore -> userScore <= 50 && userScore > 30)).count();
            scope10 = userScores.stream().filter((userScore -> userScore <= 30  && userScore >10)).count();
            scope0 = userScores.stream().filter((userScore -> userScore <10 && userScore > 0)).count();
            
        }
        
        
        return R.ok()
                .put("userToTals", userNums)
                .put("avgScore", averageScore)
                .put("maxScore", maxScore)
                .put("scope90", scope90)
                .put("scope70", scope70)
                .put("scope50", scope50)
                .put("scope30", scope30)
                .put("scope10", scope10)
                .put("scope0", scope0);
                
    }
}