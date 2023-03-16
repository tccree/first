package mollie.basic.modules.paper.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.paper.entity.PaperModelEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 04:54:22
 */
public interface PaperModelService extends IService<PaperModelEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    /**
     * 获取已经添加到试卷的试题
     * @param id
     * @return
     */
    List<ExamPoolEntity> paperExam(Long id);
    
    /**
     * 获取没有添加到试卷的试题
     * @param id
     * @return
     */
    List<ExamPoolEntity> paperNoExam(Long id);
    
    /**
     * 删除试卷中的试题
     * @param paperId
     * @param examId
     */
    void delExamPaper(Long paperId, Long examId);
    
    /**
     * 将试题保存进试卷
     * @param paperId
     * @param examId
     * @return
     */
    int savePaper(Long paperId, Long examId);
    
}

