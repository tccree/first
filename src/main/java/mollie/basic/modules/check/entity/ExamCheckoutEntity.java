package mollie.basic.modules.check.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 16:44:12
 */
@Data
@TableName("exam_checkout")
public class ExamCheckoutEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id自增主键
	 */
	@TableId
	private Long id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 封面
	 */
	private String picture;
	/**
	 * 备注
	 */
	private String checkoutDec;
	/**
	 * 总分值
	 */
	private Integer totalScore;
	/**
	 * 难度等级
	 */
	private Integer totalLevel;
	/**
	 * 1：正常，0：禁用
	 */
	private Integer isState;
	/**
	 * 班级id
	 */
	private Long classId;
	/**
	 * 班级名称
	 */
	private String className;
	/**
	 * 开考时间
	 */
	private Date checkoutTime;
    
    @TableField(exist = false)
    private Long roleId;

}
