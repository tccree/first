package mollie.basic.modules.sys.controller;

import mollie.basic.common.utils.PageUtils;
import mollie.basic.common.utils.R;
import mollie.basic.modules.sys.entity.SysUserEntity;
import mollie.basic.modules.sys.entity.VAnnouncementEntity;
import mollie.basic.modules.sys.service.VAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 公告管理
 *
 * @author mollie
 * @email mollie_x@163.com
 * @date 2022-04-29 22:21:33
 */
@RestController
@RequestMapping("sys/vannouncement")
public class VAnnouncementController extends AbstractController {
    @Autowired
    private VAnnouncementService vAnnouncementService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = vAnnouncementService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{announcementId}")
    public R info(@PathVariable("announcementId") Integer announcementId){
		VAnnouncementEntity vAnnouncement = vAnnouncementService.getById(announcementId);

        return R.ok().put("vAnnouncement", vAnnouncement);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody VAnnouncementEntity vAnnouncement){

        //保存时将登录信息取出
        SysUserEntity loginUser = this.getUser();
        vAnnouncement.setUserId(loginUser.getUserId());
        vAnnouncement.setUserName(loginUser.getUsername());
		vAnnouncementService.save(vAnnouncement);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody VAnnouncementEntity vAnnouncement){
		vAnnouncementService.updateById(vAnnouncement);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] announcementIds){
		vAnnouncementService.removeByIds(Arrays.asList(announcementIds));

        return R.ok();
    }


    /**
     * 列表
     */
    @RequestMapping("/get_all_list")
    public R getAllList(){
        return R.ok().put("list", vAnnouncementService.list());
    }

}
