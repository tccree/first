

package mollie.basic.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.exception.RRException;
import mollie.basic.common.utils.Constant;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;
import mollie.basic.modules.classroom.service.ClassService;
import mollie.basic.modules.sys.dao.SysUserDao;
import mollie.basic.modules.sys.entity.SysUserEntity;
import mollie.basic.modules.sys.entity.TeachersVo;
import mollie.basic.modules.sys.service.SysRoleService;
import mollie.basic.modules.sys.service.SysUserRoleService;
import mollie.basic.modules.sys.service.SysUserService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 系统用户
 *
 * @author mollie
 */
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUserEntity> implements SysUserService {
	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private SysRoleService sysRoleService;
    @Autowired
    private ClassService classService;
 

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String username = (String)params.get("username");
		Long createUserId = (Long)params.get("createUserId");

		IPage<SysUserEntity> page = this.page(
			new Query<SysUserEntity>().getPage(params),
			new QueryWrapper<SysUserEntity>()
				.like(StringUtils.isNotBlank(username),"username", username)
				.eq(createUserId != null,"create_user_id", createUserId)
    
		);
        
        List<SysUserEntity> sysUserEntities = page.getRecords();
        sysUserEntities.forEach(sysUserEntity -> {
            String roleName = sysRoleService.queryRoleNameByUserId(sysUserEntity.getUserId());
            sysUserEntity.setRoleName(roleName);
        });
        page.setRecords(sysUserEntities);
        return new PageUtils(page);
	}

	@Override
	public List<String> queryAllPerms(Long userId) {
		return baseMapper.queryAllPerms(userId);
	}

	@Override
	public List<Long> queryAllMenuId(Long userId) {
		return baseMapper.queryAllMenuId(userId);
	}

	@Override
	public SysUserEntity queryByUserName(String username) {
		return baseMapper.queryByUserName(username);
	}

	@Override
	@Transactional
	public boolean saveUser(SysUserEntity user) {
        SysUserEntity sysUserEntity = this.baseMapper.selectOne(new LambdaQueryWrapper<SysUserEntity>()
                .eq(SysUserEntity::getEmail, user.getEmail())
                .or()
                .eq(SysUserEntity::getMobile, user.getMobile())
        );
        if (ObjectUtils.isEmpty(sysUserEntity)) {
            user.setCreateTime(new Date());
            //sha256加密
            String salt = RandomStringUtils.randomAlphanumeric(20);
            user.setPassword(new Sha256Hash(user.getPassword(), salt).toHex());
            user.setSalt(salt);
            this.save(user);
    
            //检查角色是否越权
            checkRole(user);
    
            //保存用户与角色关系
            sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
            return true;
        }
        return false;
    }

	@Override
	@Transactional
	public void update(SysUserEntity user) {
		if(StringUtils.isBlank(user.getPassword())){
			user.setPassword(null);
		}else{
			user.setPassword(new Sha256Hash(user.getPassword(), user.getSalt()).toHex());
		}
		this.updateById(user);
		
		//检查角色是否越权
		checkRole(user);
		
		//保存用户与角色关系
		sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
	}

	@Override
	public void deleteBatch(Long[] userId) {
		this.removeByIds(Arrays.asList(userId));
        Arrays.asList(userId).forEach(v -> {
            classService.deleteClassUser(v);
        });
        
	}

	@Override
	public boolean updatePassword(Long userId, String password, String newPassword) {
		SysUserEntity userEntity = new SysUserEntity();
		userEntity.setPassword(newPassword);
		return this.update(userEntity,
				new QueryWrapper<SysUserEntity>().eq("user_id", userId).eq("password", password));
	}
    
    @Override
    public List<TeachersVo> queryAllTeacher() {
        
        return this.baseMapper.queryAllTeacher();
    }
    
    @Override
    public String queryTeacherName(Long userId) {
        return this.baseMapper.queryTeacherName(userId);
    }
    
    
    /**
	 * 检查角色是否越权
	 */
	private void checkRole(SysUserEntity user){
		if(user.getRoleIdList() == null || user.getRoleIdList().size() == 0){
			return;
		}
		//如果不是超级管理员，则需要判断用户的角色是否自己创建
		if(user.getCreateUserId() == Constant.SUPER_ADMIN){
			return ;
		}
		
		//查询用户创建的角色列表
		List<Long> roleIdList = sysRoleService.queryRoleIdList(user.getCreateUserId());

		//判断是否越权
		if(!roleIdList.containsAll(user.getRoleIdList())){
			throw new RRException("新增用户所选角色，不是本人创建");
		}
	}
}