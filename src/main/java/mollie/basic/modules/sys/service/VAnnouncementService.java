package mollie.basic.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.sys.entity.VAnnouncementEntity;

import java.util.Map;

/**
 * 公告管理
 *
 * @author mollie
 * @email mollie_x@163.com
 * @date 2022-04-29 22:21:33
 */
public interface VAnnouncementService extends IService<VAnnouncementEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

