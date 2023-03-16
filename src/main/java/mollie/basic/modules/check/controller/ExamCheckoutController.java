package mollie.basic.modules.check.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import mollie.basic.modules.check.entity.CheckExamVoDTO;
import mollie.basic.modules.check.entity.DelCheckDTO;
import mollie.basic.modules.check.entity.UserInfoResponseVo;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mollie.basic.modules.check.entity.ExamCheckoutEntity;
import mollie.basic.modules.check.service.ExamCheckoutService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;



/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 16:44:12
 */
@RestController
@RequestMapping("/check/examcheckout")
public class ExamCheckoutController {
    @Autowired
    private ExamCheckoutService examCheckoutService;
    
    /**
     * 获取开考时间
     * @param checkId
     * @return
     */
    @RequestMapping("/time/{checkId}")
    public R getTime(@PathVariable("checkId") Long checkId) {
        ExamCheckoutEntity checkoutEntity = examCheckoutService.getById(checkId);
        return R.ok().put("checkTime", checkoutEntity.getCheckoutTime());
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("check:examcheckout:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = examCheckoutService.queryPage(params);

        return R.ok().put("page", page);
    }
    
    /**
     * 获取已经添加到考卷中的试题
     * @return
     */
    @RequestMapping("/exam/{id}")
    //@RequiresPermissions("check:examcheckout:list")
    public R checkExam(@PathVariable("id") Long id) {
        List<ExamPoolEntity> examPoolEntities = examCheckoutService.checkExam(id);
        
        return R.ok().put("checkExams", examPoolEntities);
    }
    @RequestMapping("/user/info/{checkId}")
    public R userInfo(@PathVariable("checkId") Long checkId) {
        List<UserInfoResponseVo> responseVos = examCheckoutService.userInfo(checkId);
        
        return R.ok().put("users", responseVos);
    
    }
    
    @RequestMapping("/allscope/{checkId}")
    public R getAllScope(@PathVariable("checkId") Long checkId) {
        R r = examCheckoutService.getllScope(checkId);
    
        return R.ok().put("result", r);
    }
    
    /**
     * 没在考卷中的
     * @return
     */
    @RequestMapping("/noexam/{id}")
    //@RequiresPermissions("check:examcheckout:list")
    public R noCheckExam(@PathVariable("id") Long id) {
        List<ExamPoolEntity> examPoolEntities = examCheckoutService.noCheckExam(id);
        
        return R.ok().put("noExam", examPoolEntities);
    }
    
    /**
     * 将试卷模型中的试题保存到试卷中
     * @param checkExamVoDTO
     * @return
     */
    @RequestMapping("/save/check")
    @RequiresPermissions("check:examcheckout:save")
    public R saveCheck(@RequestBody CheckExamVoDTO checkExamVoDTO) {
        int result = examCheckoutService.saveCheck(checkExamVoDTO);
        if (result == 0) {
            return R.error("添加失败");
        }
        return R.ok("添加成功");
    }
    
    /**
     * 添加单独的试题
     * @param delCheckDTO
     * @return
     */
    @RequestMapping("/save/exam")
    @RequiresPermissions("check:examcheckout:save")
    public R saveExam(@RequestBody DelCheckDTO delCheckDTO) {
        int result = examCheckoutService.saveExam(delCheckDTO);
        if (result == 0) {
            return R.error("添加失败");
        }
        return R.ok("添加成功");
    }
    
    @RequestMapping("/del")
    @RequiresPermissions("check:examcheckout:delete")
    public R delCheck(@RequestBody DelCheckDTO delCheckDTO) {
        examCheckoutService.delCheck(delCheckDTO);
        
        return R.ok("移除成功");
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("check:examcheckout:info")
    public R info(@PathVariable("id") Long id){
		ExamCheckoutEntity examCheckout = examCheckoutService.getById(id);

        return R.ok().put("examCheckout", examCheckout);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("check:examcheckout:save")
    public R save(@RequestBody ExamCheckoutEntity examCheckout){
		examCheckoutService.save(examCheckout);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("check:examcheckout:update")
    public R update(@RequestBody ExamCheckoutEntity examCheckout){
		examCheckoutService.updateById(examCheckout);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("check:examcheckout:delete")
    public R delete(@RequestBody Long[] ids){
		examCheckoutService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
