package mollie.basic.modules.exam.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import mollie.basic.modules.exam.entity.ExamPoolModelVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.exam.service.ExamPoolService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;

import javax.validation.Path;


/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-11 07:27:30
 */
@RestController
@RequestMapping("exam/exampool")
public class ExamPoolController {
    @Autowired
    private ExamPoolService examPoolService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("exam:exampool:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = examPoolService.queryPage(params);
        
        return R.ok().put("page", page);
    }
    
    /**
     * 在线练习试题列表
     */
    @RequestMapping("/list/{id}")
    //@RequiresPermissions("exam:exampool:list")
    public R practiceList(@RequestParam Map<String, Object> params, @PathVariable("id") Integer id){
        PageUtils page = examPoolService.practiceList(params, id);
        
        return R.ok().put("page", page);
    }
    
    /**
     * 查询试题模板
     * @return
     */
    @RequestMapping("/model")
    @RequiresPermissions("exam:exampool:list")
    public R queryExamModel() {
        List<ExamPoolModelVo> examPoolModelVos = examPoolService.queryAllExamPoolModel();
        return R.ok().put("examModel", examPoolModelVos);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:exampool:info")
    public R info(@PathVariable("id") Long id){
		ExamPoolEntity examPool = examPoolService.getById(id);

        return R.ok().put("examPool", examPool);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("exam:exampool:save")
    public R save(@RequestBody ExamPoolEntity examPool){
		examPoolService.saveExamPool(examPool);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("exam:exampool:update")
    public R update(@RequestBody ExamPoolEntity examPool){
		examPoolService.updateById(examPool);

        return R.ok();
    }
    
    /**
     * 添加题库到在线练习
     * @return
     */
    @RequestMapping("/addPractice/{id}")
    @RequiresPermissions("exam:exampool:update")
    public R addPractice(@PathVariable("id") Long id) {
        //先查找是否添加过
        if (examPoolService.isPractice(id)) {
            return R.error("请勿重复添加");
        }
        boolean result = examPoolService.addPractice(id);
        if (result) {
            return R.ok("添加成功");
        }
        return R.error("添加失败");
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("exam:exampool:delete")
    public R delete(@RequestBody Long[] ids){
		examPoolService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
