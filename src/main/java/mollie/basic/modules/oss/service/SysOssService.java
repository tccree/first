/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.basic.io
 *
 * 版权所有，侵权必究！
 */

package mollie.basic.modules.oss.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.oss.entity.SysOssEntity;

import java.util.Map;

/**
 * 文件上传
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface SysOssService extends IService<SysOssEntity> {

	PageUtils queryPage(Map<String, Object> params);
}
