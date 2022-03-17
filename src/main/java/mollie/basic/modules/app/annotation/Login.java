

package mollie.basic.modules.app.annotation;

import java.lang.annotation.*;

/**
 * app登录效验
 *
 * @author mollie
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
}
