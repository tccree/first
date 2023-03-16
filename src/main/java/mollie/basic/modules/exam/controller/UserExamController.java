package mollie.basic.modules.exam.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import mollie.basic.modules.exam.entity.SaveExamDTO;
import mollie.basic.modules.exam.entity.UserExamResponseVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mollie.basic.modules.exam.entity.UserExamEntity;
import mollie.basic.modules.exam.service.UserExamService;
import mollie.basic.common.utils.R;



/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-15 14:37:19
 */
@RestController
@RequestMapping("exam/userexam")
public class UserExamController {
    @Autowired
    private UserExamService userExamService;
    
    @RequestMapping("/all/{userId}/{checkId}")
    public R userAllExam(@PathVariable("userId") Long userId, @PathVariable("checkId") Long checkId) {
        
        List<UserExamEntity> userExamEntities = userExamService.allExam(userId, checkId);
        
        return R.ok().put("userExams", userExamEntities);
    }
    
    /**
     * 学生上传做完的试卷
     * @param saveExamDTO
     * @return
     */
    @RequestMapping("/save/exmas")
    public R saveExams(@RequestBody SaveExamDTO saveExamDTO) {
        boolean result = userExamService.saveExams(saveExamDTO);
        if (result) return R.ok("上传成功");
        return R.error("上传失败");
    }
    
    /**
     * 获取答题页相关数据
     * @return
     */
    @RequestMapping("/user/exam")
    public R userExamInfo(@RequestParam Map<String, Object> params) {
        List<UserExamResponseVO> response = userExamService.userExamInfo(params);
        
        return R.ok().put("userExams", response);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody UserExamEntity userExam){
		userExamService.save(userExam);

        return R.ok();
    }



}
