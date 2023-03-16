package mollie.basic.modules.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import mollie.basic.modules.exam.dao.ExamPoolDao;
import mollie.basic.modules.exam.entity.ExamPoolEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.Query;

import mollie.basic.modules.paper.dao.PaperModelDao;
import mollie.basic.modules.paper.entity.PaperModelEntity;
import mollie.basic.modules.paper.service.PaperModelService;


@Service("paperModelService")
public class PaperModelServiceImpl extends ServiceImpl<PaperModelDao, PaperModelEntity> implements PaperModelService {
    
    @Autowired
    private PaperModelDao paperModelDao;
    @Autowired
    private ExamPoolDao examPoolDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PaperModelEntity> page = this.page(
                new Query<PaperModelEntity>().getPage(params),
                new QueryWrapper<PaperModelEntity>()
        );
        List<PaperModelEntity> paperModelEntities = page.getRecords();
        paperModelEntities.forEach(paperModelEntity -> {
            //paperId，通过id查询有分数
            Long id = paperModelEntity.getId();
            List<ExamPoolEntity> examPoolEntities = paperModelDao.paperExam(id);
            Integer totalScore = examPoolEntities.stream().map(ExamPoolEntity::getScore).reduce(0, Integer::sum);
            Integer totalLevel = examPoolEntities.stream().map(ExamPoolEntity::getExamLevel).reduce(0, Integer::sum);
            if (examPoolEntities.size() != 0) {
                totalLevel = (Integer) (totalLevel / examPoolEntities.size());
                paperModelDao.setScoreLevel(id, totalScore, totalLevel);
            } else {
                paperModelDao.setScoreLevel(id, 0, 1);
            }
        });
        

        return new PageUtils(page);
    }
    
    @Override
    public List<ExamPoolEntity> paperExam(Long id) {
        return paperModelDao.paperExam(id);
    }
    
    @Override
    public List<ExamPoolEntity> paperNoExam(Long id) {
        return paperModelDao.paperNoExam(id);
    }
    
    @Override
    public void delExamPaper(Long paperId, Long examId) {
        int result = paperModelDao.delExamPaper(paperId, examId);
        //减分数
        if (result != 0) {
            PaperModelEntity paperModelEntity = paperModelDao.selectById(paperId);
            //获取要减的分数
            Integer score = examPoolDao.selectById(examId).getScore();
            paperModelEntity.setTotalScore(paperModelEntity.getTotalScore() - score);
            //更新
            paperModelDao.updateById(paperModelEntity);
        }
    }
    
    @Override
    public int savePaper(Long paperId, Long examId) {
        int result = paperModelDao.savePaper(paperId, examId);
        //添加分数
        if (result != 0) {
            PaperModelEntity paperModelEntity = new PaperModelEntity();
            //查找examId对应的分数
            Integer score = examPoolDao.selectById(examId).getScore();
            Integer totalScore = paperModelDao.selectById(paperId).getTotalScore();
            //进行更新分数
            paperModelEntity.setTotalScore(score + totalScore);
            paperModelEntity.setId(paperId);
            paperModelDao.updateById(paperModelEntity);
        }
        return result;
    }
    
}