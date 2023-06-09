package mollie.basic.common.utils;

import com.google.common.collect.Lists;

import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName: RunCodeUtils
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-13 01:32
 * @Version: 1.0
 */
public class RunCodeUtils {
    
    /**
     * 先保存Java代码
     * @param code
     * @return
     */
        public static void saveJavaCode(String code) {
        BufferedWriter bufferedWriter = null;
        try {
            File file = new File("D:\\Test.java");
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, false), "UTF-8"));
            bufferedWriter.write(code);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedWriter != null) {
                    bufferedWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    /**
     * 编译运行Java代码
     * @return
     */
    public static String runJavaCode() {
        BufferedReader bufferedReader = null;
        try {
            
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            int result = compiler.run(null, null, null, "D:\\Test.java");
            System.out.println(result == 0 ? "编译成功" : "编译失败");

            Process process = Runtime.getRuntime().exec("java Test",null,new File("D:\\"));

            bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String str;
            StringBuilder sb = new StringBuilder();
            while ((str = bufferedReader.readLine()) != null) {
                System.out.println(str);
                sb.append(str + "\n");
            }
            return sb.subSequence(0, sb.length() - 1).toString();
        } catch (IOException e) {
            e.printStackTrace();
            return e.getMessage();
        }
        finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 保存python代码
     * @param code
     */
    public static void savePythonCode(String code) {
        BufferedWriter bufferedWriter = null;
        try {
            File file = new File("D:\\Test.py");
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, false), "UTF-8"));
            bufferedWriter.write(code);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedWriter != null) {
                    bufferedWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static String runPythonCode() {
        Process proc;
        BufferedReader bufferedReader = null;
        
        try {
            proc = Runtime.getRuntime().exec("python D:\\Test.py");
            bufferedReader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String result = null;
            StringBuilder sb = new StringBuilder();
            while ((result = bufferedReader.readLine()) != null) {
                System.out.println(result);
                sb.append(result + "\n");
            }
            return sb.substring(0, sb.length() - 1).toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
