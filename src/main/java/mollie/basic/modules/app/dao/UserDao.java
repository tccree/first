

package mollie.basic.modules.app.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.app.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户
 *
 * @author mollie
 */
@Mapper
public interface UserDao extends BaseMapper<UserEntity> {

}
