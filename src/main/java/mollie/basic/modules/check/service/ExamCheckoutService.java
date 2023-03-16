package mollie.basic.modules.check.service;

import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;
import mollie.basic.modules.check.entity.CheckExamVoDTO;
import mollie.basic.modules.check.entity.DelCheckDTO;
import mollie.basic.modules.check.entity.ExamCheckoutEntity;
import mollie.basic.modules.check.entity.UserInfoResponseVo;
import mollie.basic.modules.exam.entity.ExamPoolEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author jkluv
 * @email dsadsa@gmail.com
 * @date 2023-03-13 16:44:12
 */
public interface ExamCheckoutService extends IService<ExamCheckoutEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    /**
     * 获取已经添加到考卷中的试题
     * @param id
     * @return
     */
    List<ExamPoolEntity> checkExam(Long id);
    
    /**
     * 将试卷模型中的试题保存到试卷中
     * @param checkExamVoDTO
     * @return
     */
    int saveCheck(CheckExamVoDTO checkExamVoDTO);
    
    /**
     * 删除试题
     * @param delCheckDTO
     */
    void delCheck(DelCheckDTO delCheckDTO);
    
    /**
     * 没在考卷中的
     * @param id
     * @return
     */
    List<ExamPoolEntity> noCheckExam(Long id);
    
    /**
     * 添加单独的试题
     * @param delCheckDTO
     * @return
     */
    int saveExam(DelCheckDTO delCheckDTO);
    
    /**
     * 查询某个试卷用户信息
     * @param checkId
     * @return
     */
    List<UserInfoResponseVo> userInfo(Long checkId);
    
    R getllScope(Long checkId);
    
}

