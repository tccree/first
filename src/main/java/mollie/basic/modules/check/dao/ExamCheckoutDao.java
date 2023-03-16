package mollie.basic.modules.check.dao;

import mollie.basic.modules.check.entity.ExamCheckoutEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 
 * 
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 16:44:12
 */
@Mapper
public interface ExamCheckoutDao extends BaseMapper<ExamCheckoutEntity> {
    
    /**
     * 获取已经添加到试卷中的试题
     * @param id
     * @return
     */
    List<ExamPoolEntity> checkExam(Long id);
    
    /**
     * 将试题保存到试卷中
     * @param checkId
     * @param examId
     * @return
     */
    int saveCheck(Long checkId, Long examId);
    
    /**
     * 删除试题
     * @param checkId
     * @param examId
     * @return
     */
    int delCheck(Long checkId, Long examId);
    
    /**
     * 设置总分和难度等级
     * @param id
     * @param totalScore
     * @param totalLevel
     */
    void setScoreLevel(Long id, Integer totalScore, Integer totalLevel);
    
    /**
     * 没在考卷中的
     * @param id
     * @return
     */
    List<ExamPoolEntity> noCheckExam(Long id);
}
