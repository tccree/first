package mollie.basic.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.exam.entity.ExamPoolModelVo;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-11 07:27:30
 */
public interface ExamPoolService extends IService<ExamPoolEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    /**
     * 查询试题模板
     * @return
     */
    List<ExamPoolModelVo> queryAllExamPoolModel();
    
    /**
     * 保存试题
     * @param examPool
     */
    void saveExamPool(ExamPoolEntity examPool);
    
    /**
     * 添加到在线练习
     * @param id
     * @return
     */
    boolean addPractice(Long id);
    
    /**
     * 是否已经添加过
     * @param id
     * @return
     */
    boolean isPractice(Long id);
    
    /**
     * 查询在线练习试题列表
     * @param params
     * @return
     */
    PageUtils practiceList(Map<String, Object> params, Integer id);
}

