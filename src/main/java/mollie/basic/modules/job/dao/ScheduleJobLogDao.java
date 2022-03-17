

package mollie.basic.modules.job.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.job.entity.ScheduleJobLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 定时任务日志
 *
 * @author mollie
 */
@Mapper
public interface ScheduleJobLogDao extends BaseMapper<ScheduleJobLogEntity> {
	
}
