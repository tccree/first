package mollie.basic.modules.paper.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.paper.entity.DelPaperExam;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mollie.basic.modules.paper.entity.PaperModelEntity;
import mollie.basic.modules.paper.service.PaperModelService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;



/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 04:54:22
 */
@RestController
@RequestMapping("paper/papermodel")
public class PaperModelController {
    @Autowired
    private PaperModelService paperModelService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("paper:papermodel:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = paperModelService.queryPage(params);

        return R.ok().put("page", page);
    }
    
    /**
     * 获取已经添加到试卷的试题
     * @param id
     * @return
     */
    @RequestMapping("/exam/{id}")
    @RequiresPermissions("paper:papermodel:info")
    public R paperExam(@PathVariable("id") Long id) {
        List<ExamPoolEntity> examPoolEntities = paperModelService.paperExam(id);
        
        return R.ok().put("paperExams", examPoolEntities);
    }
    
    /**
     * 获取没有添加到试卷的试题
     * @param id
     * @return
     */
    @RequestMapping("/nopaper/{id}")
    @RequiresPermissions("paper:papermodel:info")
    public R paperNoExam(@PathVariable("id") Long id) {
        List<ExamPoolEntity> examPoolEntities = paperModelService.paperNoExam(id);
        
        return R.ok().put("paperNoExams", examPoolEntities);
    }
    
    @RequestMapping("/del")
    @RequiresPermissions("paper:papermodel:delete")
    public R delPaperExam(@RequestBody DelPaperExam delPaperExam) {
        paperModelService.delExamPaper(delPaperExam.getPaperId(), delPaperExam.getExamId());
        return R.ok("移除成功");
    }
    
    /**
     * 保存试题到试卷
     * @param savPaperExam
     * @return
     */
    @RequestMapping("/save/paper")
    @RequiresPermissions("paper:papermodel:save")
    public R savePaper(@RequestBody DelPaperExam savPaperExam) {
        int result = paperModelService.savePaper(savPaperExam.getPaperId(), savPaperExam.getExamId());
        if (result == 1)
            return R.ok("添加成功");
        return R.error("添加失败");
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("paper:papermodel:info")
    public R info(@PathVariable("id") Long id){
		PaperModelEntity paperModel = paperModelService.getById(id);

        return R.ok().put("paperModel", paperModel);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("paper:papermodel:save")
    public R save(@RequestBody PaperModelEntity paperModel){
		paperModelService.save(paperModel);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("paper:papermodel:update")
    public R update(@RequestBody PaperModelEntity paperModel){
		paperModelService.updateById(paperModel);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("paper:papermodel:delete")
    public R delete(@RequestBody Long[] ids){
		paperModelService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
