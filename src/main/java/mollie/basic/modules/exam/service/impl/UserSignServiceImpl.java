package mollie.basic.modules.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import mollie.basic.modules.check.dao.ExamCheckoutDao;
import mollie.basic.modules.check.entity.ExamCheckoutEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import mollie.basic.modules.exam.dao.UserSignDao;
import mollie.basic.modules.exam.entity.UserSignEntity;
import mollie.basic.modules.exam.service.UserSignService;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.List;


@Service("userSignService")
public class UserSignServiceImpl extends ServiceImpl<UserSignDao, UserSignEntity> implements UserSignService {
    @Autowired
    private UserSignDao userSignDao;
    @Autowired
    private ExamCheckoutDao examCheckoutDao;
    
    @Override
    public boolean saveSign(Long userId, Long checkId) {
        UserSignEntity userSignEntity = new UserSignEntity();
        userSignEntity.setUserId(userId);
        userSignEntity.setCheckId(checkId);
        return userSignDao.insert(userSignEntity) == 1;
    }
    
    @Override
    public boolean getSign(Long userId, Long checkId) {
        UserSignEntity userSignEntity = userSignDao.selectOne(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getUserId, userId)
                .eq(UserSignEntity::getCheckId, checkId));
        // 为空，表示可以添加，返回true
        return ObjectUtils.isEmpty(userSignEntity);
    }
    
    @Override
    public List<UserSignEntity> allSigns(Long userId) {
        List<UserSignEntity> userSignEntities = userSignDao.selectList(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getUserId, userId));

        userSignEntities.forEach(userSignEntity -> {
            Long checkId = userSignEntity.getCheckId();
            ExamCheckoutEntity examCheckoutEntity = examCheckoutDao.selectById(checkId);
            userSignEntity.setExamTitle(examCheckoutEntity.getTitle());
            userSignEntity.setTotalScore(examCheckoutEntity.getTotalScore());
            userSignEntity.setExamLevel(examCheckoutEntity.getTotalLevel());
        });
        return userSignEntities;
    }
    
    @Override
    public boolean delSign(Long userId, Long checkId) {
        int result = userSignDao.delete(new LambdaQueryWrapper<UserSignEntity>()
                .eq(UserSignEntity::getUserId, userId)
                .eq(UserSignEntity::getCheckId, checkId));
        return result == 1;
    }
}