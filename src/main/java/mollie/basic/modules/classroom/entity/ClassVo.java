package mollie.basic.modules.classroom.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName: ClassVo
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-10 19:20
 * @Version: 1.0
 */
@Data
public class ClassVo implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private Long classId;
    
    private String className;
}
