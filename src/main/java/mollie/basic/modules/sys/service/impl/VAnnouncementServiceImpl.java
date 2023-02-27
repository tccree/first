package mollie.basic.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;
import mollie.basic.modules.sys.dao.VAnnouncementDao;
import mollie.basic.modules.sys.entity.VAnnouncementEntity;
import mollie.basic.modules.sys.service.VAnnouncementService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("vAnnouncementService")
public class VAnnouncementServiceImpl extends ServiceImpl<VAnnouncementDao, VAnnouncementEntity> implements VAnnouncementService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        String key = (String)params.get("key");

        IPage<VAnnouncementEntity> page = this.page(
                new Query<VAnnouncementEntity>().getPage(params),
                new QueryWrapper<VAnnouncementEntity>()
                .lambda().like(StringUtils.isNotBlank(key),VAnnouncementEntity::getAnnouncementTitle,key)
        );

        return new PageUtils(page);
    }

}
