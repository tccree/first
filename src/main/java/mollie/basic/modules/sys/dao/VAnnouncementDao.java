package mollie.basic.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.sys.entity.VAnnouncementEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 公告管理
 * 
 * @author mollie
 * @email mollie_x@163.com
 * @date 2022-04-29 22:21:33
 */
@Mapper
public interface VAnnouncementDao extends BaseMapper<VAnnouncementEntity> {
	
}
