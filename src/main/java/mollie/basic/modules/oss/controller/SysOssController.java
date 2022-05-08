/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package mollie.basic.modules.oss.controller;

import com.google.gson.Gson;
import io.swagger.annotations.ApiOperation;
import mollie.basic.common.exception.RRException;
import mollie.basic.common.utils.*;
import mollie.basic.common.validator.ValidatorUtils;
import mollie.basic.modules.oss.cloud.CloudStorageConfig;
import mollie.basic.modules.oss.entity.SysOssEntity;
import mollie.basic.modules.oss.service.SysOssService;
import mollie.basic.modules.sys.service.SysConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * 文件上传
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("sys/oss")
public class SysOssController {

    @Value("${server.host}")
    private String host;

    @Value("${project.path}")
    private String projectFilePath;

    @Autowired
    private SysOssService sysOssService;
    @Autowired
    private SysConfigService sysConfigService;

    private final static String KEY = ConfigConstant.CLOUD_STORAGE_CONFIG_KEY;

    /**
     * 列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sys:oss:all")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = sysOssService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 云存储配置信息
     */
    @GetMapping("/config")
    @RequiresPermissions("sys:oss:all")
    public R config() {
        CloudStorageConfig config = sysConfigService.getConfigObject(KEY, CloudStorageConfig.class);

        return R.ok().put("config", config);
    }


    /**
     * 保存云存储配置信息
     */
    @PostMapping("/saveConfig")
    @RequiresPermissions("sys:oss:all")
    public R saveConfig(@RequestBody CloudStorageConfig config) {
        //校验类型
        ValidatorUtils.validateEntity(config);
        ValidatorUtils.validateEntity(config, Constant.CloudService.getByValue(config.getType()));

        sysConfigService.updateValueByKey(KEY, new Gson().toJson(config));

        return R.ok();
    }


    /**
     * 上传文件
     */
	@ApiOperation("上传文件")
    @PostMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }

        String filename = "";
        //生成uuid作为文件名
        String uuid = UUID.randomUUID().toString().replace("-","");
        //获取文件类型
        String contentType = file.getContentType();
        //获取文件后缀名
        String suffixName = contentType.substring(contentType.indexOf("/")+1);
        //生成新的文件名
        filename = uuid+"."+suffixName;

        String filePath = FileUtil.getStorePath(projectFilePath, filename);
        //上传文件
        FileUtil.uploadFile(FileUtil.getCmd() + projectFilePath + filePath, file);

        //拼装可以下载文件的接口url
        String url = String.format("http://%s/mollie-basic/sys/oss/download/%s", host, filePath);
        url = url.replaceAll("\\\\","/");
        //保存文件信息
        SysOssEntity ossEntity = new SysOssEntity();
        ossEntity.setUrl(url);
        ossEntity.setCreateDate(new Date());
        sysOssService.save(ossEntity);

        return R.ok().put("url", url);
    }

    @GetMapping("download/{year}/{month}/{path}")
    @ApiOperation("下载文件")
    public ResponseEntity<FileSystemResource> downById(@PathVariable("year") String year , @PathVariable("month") String month , @PathVariable("path") String path) {

        File file = new File(FileUtil.getCmd() + this.projectFilePath + year + "/" + month + "/" + path);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
        headers.add("Content-Disposition", "attachment; filename=" + file.getName());
        headers.add("Pragma", "no-cache");
        headers.add("Expires", "0");
        headers.add("Last-Modified", new Date().toString());
        headers.add("ETag", String.valueOf(System.currentTimeMillis()));
        headers.add("Access-Control-Expose-Headers", "Content-Disposition");
        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(file.length())
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(new FileSystemResource(file));
    }

    @RequestMapping(value = "downPic/{year}/{month}/{path}", method = RequestMethod.GET
            , produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.APPLICATION_PDF_VALUE, MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_PNG_VALUE}
    )
    @ApiOperation("返回图形文件(只支持图片,pdf显示)")
    public void downPic(@PathVariable("year") String year , @PathVariable("month") String month , @PathVariable("path") String path, HttpServletResponse response) {
        String filePath = String.format(FileUtil.getCmd() + this.projectFilePath + year + "/" + month + "/" + path);
        String ext = FileUtil.getFileExt(path).toLowerCase();
        if (ext.equals(".pdf")) {
            response.setContentType("application/pdf");
        }
        // 判断一下后缀名来返回
        String FILETYPES = ".jpg,.bmp,.jpeg,.png,.gif,.pdf,.JPG,.BMP,.JPEG,.PNG,.GIF,.PDF";
        if (FILETYPES.contains(ext)) {
            File file = new File(filePath);
            if (file.exists()) {
                try {
                    FileInputStream in = new FileInputStream(file);
                    OutputStream out = response.getOutputStream();
                    byte[] b = new byte[1024 * 5];
                    int n;
                    while ((n = in.read(b)) != -1) {
                        out.write(b, 0, n);
                    }
                    out.flush();
                    in.close();
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }


    /**
     * 删除
     */
    @PostMapping("/delete")
    @RequiresPermissions("sys:oss:all")
    public R delete(@RequestBody Long[] ids) {
        sysOssService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
