package mollie.basic.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.modules.exam.entity.SaveExamDTO;
import mollie.basic.modules.exam.entity.UserExamEntity;
import mollie.basic.modules.exam.entity.UserExamResponseVO;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-15 14:37:19
 */
public interface UserExamService extends IService<UserExamEntity> {
    
    /**
     * 获取答题页相关数据
     * @param params
     * @return
     */
    List<UserExamResponseVO> userExamInfo(Map<String, Object> params);
    
    /**
     * 上传的试卷
     * @param saveExamDTO
     * @return
     */
    boolean saveExams(SaveExamDTO saveExamDTO);
    
    /**
     * 查询试卷
     * @param userId
     * @param checkId
     * @return
     */
    List<UserExamEntity> allExam(Long userId, Long checkId);
}

