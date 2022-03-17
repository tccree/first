

package mollie.basic.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.sys.entity.SysUserTokenEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统用户Token
 *
 * @author mollie
 */
@Mapper
public interface SysUserTokenDao extends BaseMapper<SysUserTokenEntity> {

    SysUserTokenEntity queryByToken(String token);
	
}
