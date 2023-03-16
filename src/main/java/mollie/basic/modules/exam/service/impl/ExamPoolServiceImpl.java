package mollie.basic.modules.exam.service.impl;

import mollie.basic.modules.exam.entity.ExamPoolModelVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;

import mollie.basic.modules.exam.dao.ExamPoolDao;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import mollie.basic.modules.exam.service.ExamPoolService;


@Service("examPoolService")
public class ExamPoolServiceImpl extends ServiceImpl<ExamPoolDao, ExamPoolEntity> implements ExamPoolService {
    
    @Autowired
    ExamPoolDao examPoolDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ExamPoolEntity> page = this.page(
                new Query<ExamPoolEntity>().getPage(params),
                new QueryWrapper<ExamPoolEntity>()
        );
        
        return new PageUtils(page);
    }
    
    @Override
    public PageUtils practiceList(Map<String, Object> params, Integer id) {
        IPage<ExamPoolEntity> page = this.page(
                new Query<ExamPoolEntity>().getPage(params),
                new QueryWrapper<ExamPoolEntity>()
                        .eq("isPractice", id)
        );
        
        return new PageUtils(page);
    }
    
    @Override
    public List<ExamPoolModelVo> queryAllExamPoolModel() {
        return this.baseMapper.queryAllExamPoolModel();
    }
    
    @Override
    public void saveExamPool(ExamPoolEntity examPool) {
        examPoolDao.saveExamPool(examPool);
    }
    
    @Override
    public boolean addPractice(Long id) {
        ExamPoolEntity examPoolEntity = new ExamPoolEntity();
        examPoolEntity.setId(id);
        examPoolEntity.setIsPractice(1);
        int i = this.baseMapper.updateById(examPoolEntity);
        return i == 1;
    }
    
    @Override
    public boolean isPractice(Long id) {
        
        ExamPoolEntity examPoolEntity = this.baseMapper.selectById(id);
        if (examPoolEntity.getIsPractice() == 1) {
            return true;
        }
        return false;
    }
    
    
    
}