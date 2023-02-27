package mollie.basic.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告管理
 *
 * @author mollie
 * @email mollie_x@163.com
 * @date 2022-04-29 22:21:33
 */
@Data
@TableName("v_announcement")
public class VAnnouncementEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 公告ID
	 */
	@TableId
	private Integer announcementId;
	/**
	 * 创建人ID
	 */
	private Long userId;
	/**
	 * 创建人名称
	 */
	private String userName;
	/**
	 * 公告标题
	 */
	private String announcementTitle;
	/**
	 * 内容
	 */
	private String announcementText;
	/**
	 * 创建时间
	 */
	private Date announcementTime;

}
