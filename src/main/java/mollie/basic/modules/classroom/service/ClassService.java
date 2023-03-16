package mollie.basic.modules.classroom.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.classroom.entity.ClassEntity;
import mollie.basic.modules.classroom.entity.ClassVo;
import mollie.basic.modules.sys.entity.SysUserEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author mdksamd
 * @email dsadsa@gmail.com
 * @date 2023-03-08 17:31:51
 */
public interface ClassService extends IService<ClassEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    /**
     * 添加班级
     * @param clazz
     */
    void saveClass(ClassEntity clazz);
    
    /**
     * 获取全部班级名称
     * @return
     */
    List<ClassVo> clazzName();
    
    /**
     * 保存学生和班级
     * @param user
     */
    void saveClassUser(SysUserEntity user);
    
    /**
     * 查找学生的班级id
     * @param user
     * @return
     */
    Long queryClassIdByUserId(SysUserEntity user);
    
    /**
     * 更新学生和班级关系
     * @param user
     */
    void updateClassUser(SysUserEntity user);
    
    /**
     * 删除学生与班级
     * @param userId
     */
    void deleteClassUser(Long userId);
    
    /**
     * 更新班级
     * @param clazz
     */
    void updateClass(ClassEntity clazz);
}

