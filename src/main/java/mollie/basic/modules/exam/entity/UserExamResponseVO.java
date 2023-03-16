package mollie.basic.modules.exam.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: UserExamReponseVO
 * @Description: 答题页相关数据
 * @Author: jkluv
 * @Date: 2023-03-15 14:58
 * @Version: 1.0
 */
@Data
public class UserExamResponseVO implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /**
     * 试题id
     */
    private Long examId;
    /**
     * 题库类型
     */
    private String examType;
    /**
     * 题库标题
     */
    private String title;
    /**
     * 试题
     */
    private String examSource;
    /**
     * 分值
     */
    private Integer score;
    /**
     * 答案
     */
    private String answer;

    
}
