package mollie.basic.modules.exam.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName: ExamPoolModel
 * @Description: 试题模板
 * @Author: jkluv
 * @Date: 2023-03-11 07:54
 * @Version: 1.0
 */
@Data
public class ExamPoolModelVo implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /**
     * id
     */
    private Long id;
    
    /**
     * 试题类型
     */
    private String type;
    
    /**
     * 模板
     */
    private String model;
}
