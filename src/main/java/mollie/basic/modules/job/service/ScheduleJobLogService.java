

package mollie.basic.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.job.entity.ScheduleJobLogEntity;

import java.util.Map;

/**
 * 定时任务日志
 *
 * @author mollie
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);
	
}
