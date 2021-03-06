package com.core.base.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.core.base.constants.enums.YN;

/**
 * 登录验证注解
 * 在action中的method上加上该注解，client访问该method时，将不进行session校验。
 * @author yeshujun
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target( {ElementType.METHOD})
public @interface LoginValidation {

	/**
	 * 是否进行登录验证，Y:是，N：否
	 * @return
	 */
	YN validate() default YN.Y;
}
