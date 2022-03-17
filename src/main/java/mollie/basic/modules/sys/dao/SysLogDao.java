

package mollie.basic.modules.sys.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.sys.entity.SysLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统日志
 *
 * @author mollie
 */
@Mapper
public interface SysLogDao extends BaseMapper<SysLogEntity> {
	
}
