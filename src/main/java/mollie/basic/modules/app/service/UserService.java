

package mollie.basic.modules.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import mollie.basic.modules.app.entity.UserEntity;
import mollie.basic.modules.app.form.LoginForm;

/**
 * 用户
 *
 * @author mollie
 */
public interface UserService extends IService<UserEntity> {

	UserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param form    登录表单
	 * @return        返回用户ID
	 */
	long login(LoginForm form);
}
