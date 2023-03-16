package mollie.basic.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 
 * 
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-11 07:27:30
 */
@Data
@TableName("exam_pool")
public class ExamPoolEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 题库主键
	 */
	@TableId
	private Long id;
	/**
	 * 题库类型
	 */
	private String examType;
	/**
	 * 题库标题
	 */
	private String title;
    /**
     * 试题
     */
    private String examSource;
	/**
	 * 分值
	 */
	private Integer score;
	/**
	 * 答案
	 */
	private String answer;
	/**
	 * 解析
	 */
	private String examAnalyze;
	/**
	 * 难度等级
	 */
	private Integer examLevel;
	/**
	 * 创建时间
	 */
	private Date createTime;
    
    /**
     * 是否以已经加入练习库中
     */
    @TableField("isPractice")
    private Integer isPractice;
    
    /**
     * 试题模板
     */
    @TableField(exist = false)
    List<ExamPoolModelVo> examPoolModelVos;

}
