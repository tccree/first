package mollie.basic.modules.exam.service;


import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.modules.exam.entity.UserSignEntity;

import java.util.List;

/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-15 01:44:33
 */
public interface UserSignService extends IService<UserSignEntity> {
    
    /**
     * 保存签到信息
     * @param userId
     * @param checkId
     * @return
     */
    boolean saveSign(Long userId, Long checkId);
    
    /**
     * 获取签到信息
     * @param userId
     * @param checkId
     * @return
     */
    boolean getSign(Long userId, Long checkId);
    
    /**
     * 用户签到的试卷
     * @return
     */
    List<UserSignEntity> allSigns(Long userId);
    
    /**
     * 取消签到
     * @param userId
     * @param checkId
     * @return
     */
    boolean delSign(Long userId, Long checkId);
}

