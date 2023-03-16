package mollie.basic.modules.classroom.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mollie.basic.modules.classroom.entity.ClassVo;
import mollie.basic.modules.sys.entity.TeachersVo;
import mollie.basic.modules.sys.service.SysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mollie.basic.modules.classroom.entity.ClassEntity;
import mollie.basic.modules.classroom.service.ClassService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;



/**
 * 
 *
 * @author mdksamd
 * @email dsadsa@gmail.com
 * @date 2023-03-08 19:25:44
 */
@RestController
@RequestMapping("classroom/class")
public class ClassController {
    @Autowired
    private ClassService classService;
    
    @Autowired
    private SysUserService sysUserService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("classroom:class:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = classService.queryPage(params);
        

        return R.ok().put("page", page);
    }
    
    @RequestMapping("/className")
    @RequiresPermissions("classroom:class:list")
    public R className() {
        List<ClassVo> className = classService.clazzName();
        return R.ok().put("className", className);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{classId}")
    @RequiresPermissions("classroom:class:info")
    public R info(@PathVariable("classId") Long classId){
		ClassEntity clazz = classService.getById(classId);
        List<TeachersVo> teachersVos = sysUserService.queryAllTeacher();
        clazz.setTeachers(teachersVos);
        return R.ok().put("clazz", clazz);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("classroom:class:save")
    public R save(@RequestBody ClassEntity clazz){
		classService.saveClass(clazz);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("classroom:class:update")
    public R update(@RequestBody ClassEntity clazz){
        System.out.println(clazz);
		classService.updateClass(clazz);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("classroom:class:delete")
    public R delete(@RequestBody Long[] classIds){
		classService.removeByIds(Arrays.asList(classIds));

        return R.ok();
    }

}
