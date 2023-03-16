

package mollie.basic.modules.sys.controller;

import mollie.basic.common.annotation.SysLog;
import mollie.basic.common.utils.Constant;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;
import mollie.basic.common.validator.Assert;
import mollie.basic.common.validator.ValidatorUtils;
import mollie.basic.common.validator.group.AddGroup;
import mollie.basic.common.validator.group.UpdateGroup;
import mollie.basic.modules.classroom.entity.ClassVo;
import mollie.basic.modules.classroom.service.ClassService;
import mollie.basic.modules.sys.entity.SysUserEntity;
import mollie.basic.modules.sys.entity.TeachersVo;
import mollie.basic.modules.sys.form.PasswordForm;
import mollie.basic.modules.sys.service.SysUserRoleService;
import mollie.basic.modules.sys.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 系统用户
 *
 * @author mollie
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
    @Autowired
    private ClassService classService;


	/**
	 * 所有用户列表
	 */
	@GetMapping("/list")
	@RequiresPermissions("sys:user:list")
	public R list(@RequestParam Map<String, Object> params){
		//只有超级管理员，才能查看所有管理员列表
		if(getUserId() != Constant.SUPER_ADMIN){
			params.put("createUserId", getUserId());
		}
		PageUtils page = sysUserService.queryPage(params);

		return R.ok().put("page", page);
	}
    
    @GetMapping("/teachers")
    public R teachers() {
        
        List<TeachersVo> teachersVos = sysUserService.queryAllTeacher();
        
        return R.ok().put("teachers", teachersVos);
    }
    
    @RequestMapping("/permission/{id}")
    public R userPermission(@PathVariable("id") Long id) {
        Long permission = sysUserRoleService.getUserPermission(id);
        
        return R.ok().put("permission", permission);
    }
	
	/**
	 * 获取登录的用户信息
	 */
	@GetMapping("/info")
	public R info(){
		return R.ok().put("user", getUser());
	}
	
	/**
	 * 修改登录用户密码
	 */
	@SysLog("修改密码")
	@PostMapping("/password")
	public R password(@RequestBody PasswordForm form){
		Assert.isBlank(form.getNewPassword(), "新密码不为能空");
		
		//sha256加密
		String password = new Sha256Hash(form.getPassword(), getUser().getSalt()).toHex();
		//sha256加密
		String newPassword = new Sha256Hash(form.getNewPassword(), getUser().getSalt()).toHex();
				
		//更新密码
		boolean flag = sysUserService.updatePassword(getUserId(), password, newPassword);
		if(!flag){
			return R.error("原密码不正确");
		}
		
		return R.ok();
	}
	
	/**
	 * 用户信息
	 */
	@GetMapping("/info/{userId}")
	//@RequiresPermissions("sys:user:info")
	public R info(@PathVariable("userId") Long userId){
		SysUserEntity user = sysUserService.getById(userId);
		
		//获取用户所属的角色列表
		List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
		user.setRoleIdList(roleIdList);
        //获取全部班级信息
        List<ClassVo> clazzName = classService.clazzName();
        user.setClassName(clazzName);
        //如果为学生，查找学生的班级id
        Long classId = classService.queryClassIdByUserId(user);
        user.setClassId(classId);
        
        return R.ok().put("user", user);
	}
	
	/**
	 * 保存用户
	 */
	@SysLog("保存用户")
	@PostMapping("/save")
	@RequiresPermissions("sys:user:save")
	public R save(@RequestBody SysUserEntity user){
		ValidatorUtils.validateEntity(user, AddGroup.class);
		
		user.setCreateUserId(getUserId());
		sysUserService.saveUser(user);
		
        //保存班级用户表
        classService.saveClassUser(user);
  
		return R.ok();
	}
	
	/**
	 * 修改用户
	 */
	@SysLog("修改用户")
	@PostMapping("/update")
	@RequiresPermissions("sys:user:update")
	public R update(@RequestBody SysUserEntity user){
		ValidatorUtils.validateEntity(user, UpdateGroup.class);

		user.setCreateUserId(getUserId());
		sysUserService.update(user);
        //更新班级用户表
        classService.updateClassUser(user);
		
		return R.ok();
	}
	
	/**
	 * 删除用户
	 */
	@SysLog("删除用户")
	@PostMapping("/delete")
	@RequiresPermissions("sys:user:delete")
	public R delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return R.error("系统管理员不能删除");
		}
		
		if(ArrayUtils.contains(userIds, getUserId())){
			return R.error("当前用户不能删除");
		}
		
		sysUserService.deleteBatch(userIds);
		
		return R.ok();
	}
}
