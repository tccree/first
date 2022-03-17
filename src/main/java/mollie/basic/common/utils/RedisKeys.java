

package mollie.basic.common.utils;

/**
 * Redis所有Keys
 *
 * @author mollie
 */
public class RedisKeys {

    public static String getSysConfigKey(String key){
        return "sys:config:" + key;
    }
}
