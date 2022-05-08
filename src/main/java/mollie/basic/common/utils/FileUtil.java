package mollie.basic.common.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

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

    public static String getCmd() {
        return System.getProperty("user.dir");
    }

    public static String getFileExt(String filename) {
        int index = filename.lastIndexOf('.');
        return filename.substring(index);
    }

    public static String getStorePath(String storeDir, String newFilename) {
        Date now = new Date();
        String format = new SimpleDateFormat("yyyy/MM").format(now);
        Path path = Paths.get(storeDir, format).toAbsolutePath();
        File file = new File(path.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        return Paths.get(format, newFilename).toString();
    }

    public static void uploadFile(String path,MultipartFile multipartFile) throws Exception{

        File dest = new File(path);
        //保存文件到路径
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        multipartFile.transferTo(dest);
    }

}
