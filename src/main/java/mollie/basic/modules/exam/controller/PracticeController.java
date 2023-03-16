package mollie.basic.modules.exam.controller;

import mollie.basic.common.utils.R;
import mollie.basic.modules.exam.service.PracticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @ClassName: PracticeController
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-13 01:06
 * @Version: 1.0
 */
@RestController
@RequestMapping("/exam/practice")
public class PracticeController {
    
    @Autowired
    private PracticeService practiceService;
    
    @RequestMapping("/test")
    public R practice(@RequestBody Map<String, Object> map) {
        
        //运行代码
        String result = practiceService.runCode(map);
        return R.ok(result);
    }
}
