package mollie.basic.modules.classroom.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;
import mollie.basic.modules.sys.entity.TeachersVo;

/**
 * 
 * 
 * @author mdksamd
 * @email dsadsa@gmail.com
 * @date 2023-03-08 17:31:51
 */
@Data
@TableName("class")
public class ClassEntity implements Serializable {
	private static final long serialVersionUID = 1L;
 
	/**
	 * 班级id
	 */
    @TableId
	private Long classId;
	/**
	 * 教师id
	 */
	private Long userId;
	/**
	 * 班级名称
	 */
	private String className;
	/**
	 * 图片
	 */
	private String classPicture;
    
    /**
     * 班级描述
     */
    private String classDesc;
    
    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 教师所有id和姓名
     */
    @TableField(exist = false)
    private List<TeachersVo> teachers;
    
    /**
     * 教师姓名
     */
    @TableField(exist = false)
    private String teacherName;
    
    /**
     * 班级id对应的学生
     */
    @TableField(exist = false)
    private List<String> studentsName;

}
