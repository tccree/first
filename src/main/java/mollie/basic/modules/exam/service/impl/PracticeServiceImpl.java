package mollie.basic.modules.exam.service.impl;

import mollie.basic.common.utils.RunCodeUtils;
import mollie.basic.modules.exam.service.PracticeService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @ClassName: PracticeServiceImpl
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-13 01:23
 * @Version: 1.0
 */
@Service("practiceService")
public class PracticeServiceImpl implements PracticeService {
    
    @Override
    public String runCode(Map<String, Object> map) {
        String type = (String) map.get("type");
        if ("JAVA".equals(type)) {
            //执行Java代码
            RunCodeUtils.saveJavaCode((String) map.get("testCode"));
            return RunCodeUtils.runJavaCode();
        } else if ("PYTHON".equals(type)) {
            //执行python代码
            RunCodeUtils.savePythonCode((String) map.get("testCode"));
            return RunCodeUtils.runPythonCode();
        }
        return null;
    }
}
