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
 * @date 2023-03-15 01:44:33
 */
@Data
@TableName("user_sign")
public class UserSignEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 用户id
	 */
	private Long userId;
	/**
	 * 试卷id
	 */
	private Long checkId;
	/**
	 * 状态：0表示未开始，1表示已开始，2表示已结束
	 */
	private Integer isDone;
	/**
	 * 签到时间
	 */
	private Date signTime;
    /**
     * 试卷标题
     */
    @TableField(exist = false)
    private String examTitle;
    /**
     * 总分
     */
    @TableField(exist = false)
    private Integer totalScore;
    /**
     * 难度
     */
    @TableField(exist = false)
    private Integer examLevel;
}
