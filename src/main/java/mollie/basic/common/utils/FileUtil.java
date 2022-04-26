package mollie.basic.common.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * 文件工具类
 */
public class FileUtil {

    /**
     * 上传创建文件
     *
     * @param path
     * @return
     */
    public static void createFile(String path, MultipartFile file) throws Exception {
        File dest = new File(path);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        file.transferTo(dest);
    }

}
