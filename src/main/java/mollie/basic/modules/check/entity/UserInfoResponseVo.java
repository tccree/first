package mollie.basic.modules.check.entity;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName: UserInfoResponseVo
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-16 03:56
 * @Version: 1.0
 */
@Data
public class UserInfoResponseVo {
    
    private String userName;
    
    private Date signTime;
    
    private Date submitTime;
    
    private Integer isDone;
    
    private Integer userScore;
    
    private Integer totalScore;
}
