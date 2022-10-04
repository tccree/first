/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.basic.io
 *
 * 版权所有，侵权必究！
 */

package mollie.basic.modules.oss.cloud;


import mollie.basic.common.utils.ConfigConstant;
import mollie.basic.common.utils.Constant;
import mollie.basic.common.utils.SpringContextUtils;
import mollie.basic.modules.sys.service.SysConfigService;

/**
 * 文件上传Factory
 *
 * @author Mark sunlightcs@gmail.com
 */
public final class OSSFactory {
    private static SysConfigService sysConfigService;

    static {
        OSSFactory.sysConfigService = (SysConfigService) SpringContextUtils.getBean("sysConfigService");
    }

    public static CloudStorageService build(){
        //获取云存储配置信息
        CloudStorageConfig config = sysConfigService.getConfigObject(ConfigConstant.CLOUD_STORAGE_CONFIG_KEY, CloudStorageConfig.class);

        if(config.getType() == Constant.CloudService.QINIU.getValue()){
            return new QiniuCloudStorageService(config);
        }else if(config.getType() == Constant.CloudService.QCLOUD.getValue()){
            return new QcloudCloudStorageService(config);
        }

        return null;
    }

}
