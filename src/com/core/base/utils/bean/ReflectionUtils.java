package com.core.base.utils.bean;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

/**
 * copy from springside
 * 反射工具类
 * 提供调用getter/setter方法, 访问私有变量
 * 调用私有方法, 获取泛型类型Class, 被AOP过的真实类等工具方法
 */
public class ReflectionUtils {
	private static final String SETTER_PREFIX = "set";

	private static final String GETTER_PREFIX = "get";

	private static final String CGLIB_CLASS_SEPARATOR = "$$";

	private static Logger logger = LoggerFactory.getLogger(ReflectionUtils.class);

	/**
	 * 调用Getter方法.
	 */
	public static Object invokeGetter(Object obj, String propertyName) {
		String getterMethodName = GETTER_PREFIX + StringUtils.capitalize(propertyName);
		return invokeMethod(obj, getterMethodName, new Class[] {}, new Object[] {});
	}

	/**
	 * 调用Setter方法, 仅匹配方法名。
	 */
	public static void invokeSetter(Object obj, String propertyName, Object value) {
		String setterMethodName = SETTER_PREFIX + StringUtils.capitalize(propertyName);
		invokeMethodByName(obj, setterMethodName, new Object[] { value });
	}

	/**
	 * 直接读取对象属性值, 无视private/protected修饰符, 不经过getter方法.
	 */
	public static Object getFieldValue(final Object obj, final String fieldName) {
		Field field = getAccessibleField(obj, fieldName);

		if (field == null) {
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + obj + "]");
		}

		Object result = null;
		try {
			result = field.get(obj);
		} catch (IllegalAccessException e) {
			logger.error("不可能抛出的异常{}", e.getMessage());
		}
		return result;
	}

	/**
	 * 直接设置对象属性值, 无视private/protected修饰符, 不经过setter方法.
	 */
	public static void setFieldValue(final Object obj, final String fieldName, final Object value) {
		Field field = getAccessibleField(obj, fieldName);

		if (field == null) {
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + obj + "]");
		}

		try {
			field.set(obj, value);
		} catch (IllegalAccessException e) {
			logger.error("不可能抛出的异常:{}", e.getMessage());
		}
	}

	/**
	 * 直接调用对象方法, 无视private/protected修饰符.
	 * 用于一次性调用的情况，否则应使用getAccessibleMethod()方法获得Method后反复调用.
	 * 同时匹配方法名+参数类型，
	 */
	public static Object invokeMethod(final Object obj, final String methodName, final Class<?>[] parameterTypes,
			final Object[] args) {
		Method method = getAccessibleMethod(obj, methodName, parameterTypes);
		if (method == null) {
			throw new IllegalArgumentException("Could not find method [" + methodName + "] on target [" + obj + "]");
		}

		try {
			return method.invoke(obj, args);
		} catch (Exception e) {
			throw convertReflectionExceptionToUnchecked(e);
		}
	}

	/**
	 * 直接调用对象方法, 无视private/protected修饰符，
	 * 用于一次性调用的情况，否则应使用getAccessibleMethodByName()方法获得Method后反复调用.
	 * 只匹配方法名，如果有多个同名方法调用第一个。
	 */
	public static Object invokeMethodByName(final Object obj, final String methodName, final Object[] args) {
		Method method = getAccessibleMethodByName(obj, methodName);
		if (method == null) {
			throw new IllegalArgumentException("Could not find method [" + methodName + "] on target [" + obj + "]");
		}

		try {
			return method.invoke(obj, args);
		} catch (Exception e) {
			throw convertReflectionExceptionToUnchecked(e);
		}
	}

	/**
	 * 循环向上转型, 获取对象的DeclaredField, 并强制设置为可访问.
	 * 
	 * 如向上转型到Object仍无法找到, 返回null.
	 */
	public static Field getAccessibleField(final Object obj, final String fieldName) {
		for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass.getSuperclass()) {
			try {
				Field field = superClass.getDeclaredField(fieldName);
				makeAccessible(field);
				return field;
			} catch (NoSuchFieldException e) {//NOSONAR
				// Field不在当前类定义,继续向上转型
			}
		}
		return null;
	}

	/**
	 * 循环向上转型, 获取对象的DeclaredMethod,并强制设置为可访问.
	 * 如向上转型到Object仍无法找到, 返回null.
	 * 匹配方法名+参数类型。
	 * 
	 * 用于方法需要被多次调用的情况. 先使用本方法先取得Method,然后调用Method.invoke(Object obj, Object... args)
	 */
	public static Method getAccessibleMethod(final Object obj, final String methodName,
			final Class<?>... parameterTypes) {
		for (Class<?> searchType = obj.getClass(); searchType != Object.class; searchType = searchType.getSuperclass()) {
			try {
				Method method = searchType.getDeclaredMethod(methodName, parameterTypes);
				makeAccessible(method);
				return method;
			} catch (NoSuchMethodException e) {
				// Method不在当前类定义,继续向上转型
			}
		}
		return null;
	}

	/**
	 * 循环向上转型, 获取对象的DeclaredMethod,并强制设置为可访问.
	 * 如向上转型到Object仍无法找到, 返回null.
	 * 只匹配方法名。
	 * 
	 * 用于方法需要被多次调用的情况. 先使用本方法先取得Method,然后调用Method.invoke(Object obj, Object... args)
	 */
	public static Method getAccessibleMethodByName(final Object obj, final String methodName) {
		for (Class<?> searchType = obj.getClass(); searchType != Object.class; searchType = searchType.getSuperclass()) {
			Method[] methods = searchType.getDeclaredMethods();
			for (Method method : methods) {
				if (method.getName().equals(methodName)) {
					makeAccessible(method);
					return method;
				}
			}
		}
		return null;
	}

	/**
	 * 改变private/protected的方法为public，尽量不调用实际改动的语句，避免JDK的SecurityManager抱怨。
	 */
	public static void makeAccessible(Method method) {
		if ((!Modifier.isPublic(method.getModifiers()) || !Modifier.isPublic(method.getDeclaringClass().getModifiers()))
				&& !method.isAccessible()) {
			method.setAccessible(true);
		}
	}

	/**
	 * 改变private/protected的成员变量为public，尽量不调用实际改动的语句，避免JDK的SecurityManager抱怨。
	 */
	public static void makeAccessible(Field field) {
		if ((!Modifier.isPublic(field.getModifiers()) || !Modifier.isPublic(field.getDeclaringClass().getModifiers()) || Modifier
				.isFinal(field.getModifiers())) && !field.isAccessible()) {
			field.setAccessible(true);
		}
	}

	/**
	 * 通过反射, 获得Class定义中声明的泛型参数的类型, 注意泛型必须定义在父类处
	 * 如无法找到, 返回Object.class.
	 * eg.
	 * public UserDao extends HibernateDao<User>
	 *
	 * @param clazz The class to introspect
	 * @return the first generic declaration, or Object.class if cannot be determined
	 */
	@SuppressWarnings("unchecked")
	public static <T> Class<T> getClassGenricType(final Class clazz) {
		return getClassGenricType(clazz, 0);
	}

	/**
	 * 通过反射, 获得Class定义中声明的父类的泛型参数的类型.
	 * 如无法找到, 返回Object.class.
	 * 
	 * 如public UserDao extends HibernateDao<User,Long>
	 *
	 * @param clazz clazz The class to introspect
	 * @param index the Index of the generic ddeclaration,start from 0.
	 * @return the index generic declaration, or Object.class if cannot be determined
	 */
	public static Class getClassGenricType(final Class clazz, final int index) {

		Type genType = clazz.getGenericSuperclass();

		if (!(genType instanceof ParameterizedType)) {
			logger.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
			return Object.class;
		}

		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

		if (index >= params.length || index < 0) {
			logger.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
					+ params.length);
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			logger.warn(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");
			return Object.class;
		}

		return (Class) params[index];
	}

	public static Class<?> getClass(Object instance) {
		Assert.notNull(instance, "Instance must not be null");
		Class clazz = instance.getClass();
		if (clazz != null && clazz.getName().contains(CGLIB_CLASS_SEPARATOR)) {
			Class<?> superClass = clazz.getSuperclass();
			if (superClass != null && !Object.class.equals(superClass)) {
				return superClass;
			}
		}
		return clazz;

	}

	/**
	 * 将反射时的checked exception转换为unchecked exception.
	 */
	public static RuntimeException convertReflectionExceptionToUnchecked(Exception e) {
		if (e instanceof IllegalAccessException || e instanceof IllegalArgumentException
				|| e instanceof NoSuchMethodException) {
			return new IllegalArgumentException(e);
		} else if (e instanceof InvocationTargetException) {
			return new RuntimeException(((InvocationTargetException) e).getTargetException());
		} else if (e instanceof RuntimeException) {
			return (RuntimeException) e;
		}
		return new RuntimeException("Unexpected Checked Exception.", e);
	}
	
	public static String setObjToHql(Object obj,String id) throws Exception{
        
        String hql = "update "+obj.getClass().getName().toString()+" obj set ";
        Field[] field = obj.getClass().getDeclaredFields();
        for (int i = 0; i < field.length; i++) {
            Field f = field[i];

            f.setAccessible( true ); // 设置些属性是可以访问的
            Object val = f.get(obj);
        
            // 获取属性名
            String name = field[i].getName();
            // 获取属性类型
            String type = field[i].getGenericType().toString();
            String value=null;
            // 从request获取name对应的参数值
            if(type.equals("class java.lang.String") || type.equals("class java.lang.Integer")){
             value =(String) val;
            }
            if (value == null)
                continue;
            if (value.indexOf("'")!=-1){
                value = value.replace("'", "''");
            }
            hql+= "obj."+name+"='"+value+"',";
           
        }
        hql = hql.substring(0, hql.length()-1)+" where obj.id='"+id+"' ";
        System.out.println(hql);
        return hql;
    }

	public static void setModeltoModel(Object newmodel,Object oldmodel) throws Exception{
		System.out.println(newmodel.getClass().getName().toString());
		Field[] field = newmodel.getClass().getDeclaredFields();
		for(int i =0;i<field.length;i++){
			Field f = field[i];

			f.setAccessible( true ); // 设置些属性是可以访问的
			Object val = f.get(newmodel);

			String name = field[i].getName();
			// 获取属性类型
			String type = field[i].getGenericType().toString();
			// 从request获取name对应的参数值
			String value = null;
			// 从request获取name对应的参数值
			if(type.equals("class java.lang.String") || type.equals("class java.lang.Integer")){
				value =(String) val;
			}
			// 如果客户端没有发送此参数，则continue
			if (value == null)
				continue;

			// 获取属性域
			Method[] mod = oldmodel.getClass().getMethods();
			String setMethodName = "set" + name.substring(0, 1).toUpperCase()
					+ name.substring(1);
			Class[] cargs = new Class[1];
			if (type.equals("class java.lang.String")) {
				cargs[0] = String.class;
				Method m = oldmodel.getClass().getMethod(setMethodName, cargs);
				m.invoke(oldmodel, new Object[] { value });
				continue;
			}
			if (type.equals("class java.lang.Integer")) {
				cargs[0] = Integer.class;
				Method m = oldmodel.getClass().getMethod(setMethodName, cargs);
				if (value.equals("")) {
					m.invoke(oldmodel, new Object[] { new Integer(0) });
				} else {
					m.invoke(oldmodel, new Object[] { Integer.parseInt(value) });
				}
				continue;
			}
			if (type.equals("class java.lang.Boolean")) {
				cargs[0] = Boolean.class;
				Method m = oldmodel.getClass().getMethod(setMethodName, cargs);
				if (value.equals("")) {
					m.invoke(oldmodel, new Object[] { new Boolean(false) });
				} else {
					m.invoke(oldmodel,
							new Object[] { Boolean.parseBoolean(value) });
				}
				continue;
			}
			if (type.equals("class java.util.Date")) {
				cargs[0] = Date.class;
				Method m = oldmodel.getClass().getMethod(setMethodName, cargs);
				if (!value.equals("")) {
					m.invoke(oldmodel, new Object[] { getDate(value) });
				}
				continue;
			}
			if (type.equals("class java.lang.Short")) {
				cargs[0] = Short.class;
				Method m = oldmodel.getClass().getMethod(setMethodName, cargs);
				if (value.equals("")) {
					m.invoke(oldmodel, new Object[] { new Short("0") });
				} else {
					m.invoke(oldmodel, new Object[] { Short.parseShort(value) });
				}
				continue;
			}
			if (type.equals("class java.lang.Double")) {
				cargs[0] = Double.class;
				Method m = oldmodel.getClass().getMethod(setMethodName, cargs);
				if (value.equals("")) {
					m.invoke(oldmodel, new Object[] { new Double(0.0) });
				} else {
					m.invoke(oldmodel, new Object[] { Double.parseDouble(value) });
				}
				continue;
			}
		}
	}
	private static Date getDate(String s) throws Exception {
		if (s.indexOf("-") >= 0 && s.indexOf(" ") >= 0) {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			return format.parse(s);
		}
		if (s.indexOf("/") >= 0 && s.indexOf(" ") >= 0) {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy/MM/dd HH:mm:ss");
			return format.parse(s);
		}
		if (s.indexOf("-") >= 0 && s.indexOf(" ") < 0) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			return format.parse(s);
		}
		if (s.indexOf("/") >= 0 && s.indexOf(" ") < 0) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			return format.parse(s);
		}
		return null;
	}

	private static String getDateString(Date date) {
		String s = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(date);
		return s;
	}
}
