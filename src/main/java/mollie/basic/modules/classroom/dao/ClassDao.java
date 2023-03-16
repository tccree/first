package mollie.basic.modules.classroom.dao;

import mollie.basic.modules.classroom.entity.ClassEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.classroom.entity.ClassVo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author mdksamd
 * @email dsadsa@gmail.com
 * @date 2023-03-08 17:31:51
 */
@Mapper
public interface ClassDao extends BaseMapper<ClassEntity> {
    
    /**
     * 获取全部班级
     * @return
     */
    List<ClassVo> queryAllClassName();
    
    /**
     * 保存用户和班级之间的关系表
     * @param userId
     * @param classId
     */
    void saveClassUser(Long userId, Long classId);
    
    /**
     * 获取学生所属班级id
     * @param userId
     * @return
     */
    Long queryClassIdByUserId(Long userId);
    
    /**
     * 查询班级里所有的学生姓名
     * @param classId
     * @return
     */
    List<String> queryStudentsName(Long classId);
    
    /**
     * 更新学生班级
     * @param userId
     * @param classId
     */
    void updateClassUser(Long userId, Long classId);
    
    /**
     * 删除学生和班级的关系
     * @param userId
     */
    void deleteClassUser(Long userId);
}
