

package mollie.basic.modules.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.sys.entity.SysLogEntity;

import java.util.Map;


/**
 * 系统日志
 *
 * @author mollie
 */
public interface SysLogService extends IService<SysLogEntity> {

    PageUtils queryPage(Map<String, Object> params);

}
