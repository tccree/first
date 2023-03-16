package mollie.basic.modules.exam.dao;

import mollie.basic.modules.exam.entity.ExamPoolEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mollie.basic.modules.exam.entity.ExamPoolModelVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 
 * 
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-11 07:27:30
 */
@Mapper
public interface ExamPoolDao extends BaseMapper<ExamPoolEntity> {
    
    /**
     * 查询全部试题模型
     * @return
     */
    List<ExamPoolModelVo> queryAllExamPoolModel();
    
    /**
     * 保存试题
     * @param examPool
     */
    void saveExamPool(ExamPoolEntity examPool);
    
    /**
     * 获取分数
     * @param examId
     * @return
     */
    int qyeryScore(Long examId);
}
