/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.basic.io
 *
 * 版权所有，侵权必究！
 */

package mollie.basic.modules.oss.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.oss.entity.SysOssEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文件上传
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysOssDao extends BaseMapper<SysOssEntity> {

}
