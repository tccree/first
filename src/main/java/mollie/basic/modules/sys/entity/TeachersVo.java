package mollie.basic.modules.sys.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName: TeachersVo
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-09 01:21
 * @Version: 1.0
 */
@Data
public class TeachersVo implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 用户id
     */
    private Long userId;
    
    /**
     * 用户名
     */
    private String userName;
}
