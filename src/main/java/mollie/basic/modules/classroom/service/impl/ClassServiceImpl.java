package mollie.basic.modules.classroom.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.mchange.lang.LongUtils;
import mollie.basic.modules.classroom.entity.ClassVo;
import mollie.basic.modules.sys.entity.SysUserEntity;
import mollie.basic.modules.sys.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;

import mollie.basic.modules.classroom.dao.ClassDao;
import mollie.basic.modules.classroom.entity.ClassEntity;
import mollie.basic.modules.classroom.service.ClassService;


@Service("classService")
public class ClassServiceImpl extends ServiceImpl<ClassDao, ClassEntity> implements ClassService {
    
    @Autowired
    SysUserService sysUserService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ClassEntity> page = this.page(
                new Query<ClassEntity>().getPage(params),
                new QueryWrapper<ClassEntity>()
        );
        List<ClassEntity> classEntities = page.getRecords();
        classEntities.forEach(classEntity -> {
            //根据教师ID查询教师姓名
            classEntity.setTeacherName(sysUserService.queryTeacherName(classEntity.getUserId()));
            //班级对应的学生
            classEntity.setStudentsName(this.baseMapper.queryStudentsName(classEntity.getClassId()));
        });
        return new PageUtils(page);
    }
    
    @Override
    public void saveClass(ClassEntity clazz) {
        this.baseMapper.insert(clazz);
    }
    
    @Override
    public List<ClassVo> clazzName() {
        return this.baseMapper.queryAllClassName();
    }
    
    @Override
    public void saveClassUser(SysUserEntity user) {
    
        if (user.getRoleIdList().get(0) != 2) return;
        Long userId = user.getUserId();
        Long classId = user.getClassId();
        this.baseMapper.saveClassUser(userId, classId);
    
    }
    
    @Override
    public Long queryClassIdByUserId(SysUserEntity user) {
        if (user.getRoleIdList().get(0) != 2) return null;
        return this.baseMapper.queryClassIdByUserId(user.getUserId());
    }
    
    @Override
    public void updateClassUser(SysUserEntity user) {
        if (user.getRoleIdList().get(0) != 2) return;
        Long userId = user.getUserId();
        Long classId = user.getClassId();
        this.baseMapper.updateClassUser(userId, classId);
    }
    
    @Override
    public void deleteClassUser(Long userId) {
        this.baseMapper.deleteClassUser(userId);
    }
    
    @Override
    public void updateClass(ClassEntity clazz) {
        this.baseMapper.update(clazz,
                new LambdaQueryWrapper<ClassEntity>()
                        .eq(ClassEntity::getClassId, clazz.getClassId()));
    }
    
}