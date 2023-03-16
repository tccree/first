package mollie.basic.modules.exam.entity;

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
 * @date 2023-03-15 14:37:19
 */
@Data
@TableName("user_exam")
public class UserExamEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 用户主键
	 */
	private Long userId;
	/**
	 * 试卷主键
	 */
	private Long checkId;
	/**
	 * 试题主键
	 */
	private Long examId;
	/**
	 * 代码
	 */
	private String examSource;
	/**
	 * 正确答案
	 */
	private String examAnswer;
	/**
	 * 自己的答案
	 */
	private String userAnswer;
	/**
	 * 得分
	 */
	private Integer userScore;
	/**
	 * 提交时间
	 */
	private Date createTime;
    
    @TableField(exist = false)
    private UserExamResponseVO userExamResponseVO;
 
 

}
