package mollie.basic.common.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
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

    public static final String SAVE_PATH = "D:/mollie-file";

    public static String uploadImg(MultipartFile multipartFile)throws Exception{
        String filename = "";
        //生成uuid作为文件名
        String uuid = UUID.randomUUID().toString().replace("-","");
        //获取文件类型
        String contentType = multipartFile.getContentType();
        //获取文件后缀名
        String suffixName = contentType.substring(contentType.indexOf("/")+1);
        //生成新的文件名
        filename = uuid+"."+suffixName;

        File dest = new File(SAVE_PATH,filename);
        //保存文件到路径
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        multipartFile.transferTo(dest);
        return filename;
    }

}
