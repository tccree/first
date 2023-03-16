package mollie.basic.modules.exam.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: SaveExamDTO
 * @Description:
 * @Author: jkluv
 * @Date: 2023-03-15 23:45
 * @Version: 1.0
 */
@Data
public class SaveExamDTO implements Serializable {
    
    private Long userId;
    private Long checkId;
    private List<UserExamResponseVO> userExams;
    private static final long serialVersionUID = 1L;
}
