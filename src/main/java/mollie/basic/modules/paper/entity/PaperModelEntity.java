package mollie.basic.modules.paper.entity;

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
 * @date 2023-03-13 04:54:22
 */
@Data
@TableName("paper_model")
public class PaperModelEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
    /**
     * 标题
     */
    private String paperTitle;
	/**
	 * 总分
	 */
	private Integer totalScore;
	/**
	 * 试卷模型描述
	 */
	private String paperDesc;
	/**
	 * 试题模型难度等级
	 */
	private Integer paperLevel;
	/**
	 * 1：删除，0：未删除
	 */
	private Integer isDelete;

}
