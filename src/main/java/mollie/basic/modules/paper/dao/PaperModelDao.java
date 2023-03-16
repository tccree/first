package mollie.basic.modules.paper.dao;

import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.paper.entity.PaperModelEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 
 * 
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 04:54:22
 */
@Mapper
public interface PaperModelDao extends BaseMapper<PaperModelEntity> {
    
    /**
     * 获取已经添加到试卷模型中的试题
     * @param id
     * @return
     */
    List<ExamPoolEntity> paperExam(Long id);
    
    /**
     * 获取没有添加到试卷模型中的试题
     * @param id
     * @return
     */
    List<ExamPoolEntity> paperNoExam(Long id);
    
    /**
     * 删除试卷中的试题
     * @param paperId
     * @param examId
     * @return
     */
    int delExamPaper(Long paperId, Long examId);
    
    /**
     * 保存试题进试卷
     * @param paperId
     * @param examId
     * @return
     */
    int savePaper(Long paperId, Long examId);
    
    /**
     * 设置总分，等级
     * @param id
     * @param totalScore
     * @param totalLevel
     */
    void setScoreLevel(Long id, Integer totalScore, Integer totalLevel);
}
