package mollie.basic.modules.exam.controller;

import mollie.basic.common.utils.R;
import mollie.basic.modules.exam.entity.UserSignEntity;
import mollie.basic.modules.exam.service.UserSignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.PublicKey;
import java.util.List;

/**
 * @ClassName: UserSignController
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-15 01:24
 * @Version: 1.0
 */
@RestController
@RequestMapping("/user/sign")
public class UserSignController {
    
    @Autowired
    private UserSignService userSignService;
    
    /**
     * 签到
     * @param userId
     * @param checkId
     * @return
     */
    @RequestMapping("/save/{userId}/{checkId}")
    public R saveSign(@PathVariable("userId") Long userId, @PathVariable("checkId") Long checkId) {
        boolean sign = userSignService.getSign(userId, checkId);
        if (!sign) {
            return R.error(101, "请勿重复添加");
        }
        if (userSignService.saveSign(userId, checkId)) {
            return R.ok("添加成功");
        }
        return R.error("添加失败");
    }
    
    @RequestMapping("/del/{userId}/{checkId}")
    public R delSign(@PathVariable("userId") Long userId, @PathVariable("checkId") Long checkId) {
        boolean result = userSignService.delSign(userId, checkId);
        if (result) return R.ok();
        return R.error();
    }
    
    @RequestMapping("/all/{userId}")
    public R allSigns(@PathVariable("userId") Long userId) {
    
        List<UserSignEntity> userSignEntities = userSignService.allSigns(userId);
        
        return R.ok().put("signs", userSignEntities);
    }
    
    
}
