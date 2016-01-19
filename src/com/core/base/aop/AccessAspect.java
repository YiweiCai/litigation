 package com.core.base.aop;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.core.base.annotation.AccessLog;
import com.core.base.constants.enums.YN;
import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.entity.IDEntity;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.utils.bean.ReflectionUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.system.entity.SysAccessLog;
import com.core.system.service.AccessLogService;

/**
 * service层用户访问日志记录  aspect
 * @author yeshujun
 */
@Component
@Aspect
public class AccessAspect {
	
	//记录日志文件到${catalina.base}/logs/core/AccessRecordFile.log
	private static Log log = LogFactory.getLog("accessRecordLog");
	
	//private final static ThreadLocal<Integer> accessCounts = new ThreadLocal<Integer>();

	@Autowired
	private AccessLogService accessLogService;
    
	//ProceedingJoinPoint is only supported for around advice
	@SuppressWarnings("unchecked")
	@Around("execution(* com.core..service.impl.*.*(..))")
    public Object around(ProceedingJoinPoint jp) throws Throwable{
    	ServletContext sc = null;
    	try {
    		sc = Servlets.getServletContext();
		} catch (Exception e) {
			 //sc==null，是启动服务器时，这时spring还没有加载struts2
		}
    	if(sc!=null){
    		Map<String, YN> ruleSettingMap = (Map<String, YN>) EhCacheManager.get(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.SYS_RULE_SETTING_KEY);
        	if(ruleSettingMap.get("accessLog")==YN.Y){
        		 Class<?> className = jp.getTarget().getClass();
        	    	//当前访问的方法名
        		   	String methodName = jp.getSignature().getName();
        		    //通过反射获得拦截的method
        		    Method method = className.getMethod(methodName,  ((MethodSignature)jp.getSignature()).getMethod().getParameterTypes());  
        	        log.info("service method:"+(className+"."+method.getName()).substring(6));
        	 }
    	}
    	Object result = jp.proceed();//继续下面,result 是被拦截方法的返回值
    	return result;//返回其他，不继续下面
    }
    /**
     * service 层方法成功返回后，执行下面
     * 
     * 该方法是以前记录日志的方法，以前将日志记录到数据库，现在改成记录到日志文件
     * 
     */
    /*@AfterReturning("execution(* com.core..service.impl.*.*(..))")
    public void afterReturning(JoinPoint jp)throws Exception {
    	writeLog(jp,"afterReturning");
    }*/
 
   /* @After("execution(* com.core..service.impl.*.*(..))")
    public void after(JoinPoint jp){
    	
    }*/
    
    //@AfterThrowing(pointcut="execution(* com.core..manager..*.*(..)) || execution(* com.core..service.impl.*.*(..))",throwing="e")
   /* @AfterThrowing(pointcut="execution(* com.core..service.impl.*.*(..))",throwing="e")
    public void afterThrowing(Exception e){
    	e.printStackTrace();
         log.info("exception"+e);
    }*/
    

    /**
     * 
     * @param jp
     * @param advice通知类型
     * @throws Exception 
     */
	private void writeLog(JoinPoint jp,String advice) throws Exception{
    	  //当前访问的class
    	  Class<?> className = jp.getTarget().getClass();
    	  //当前访问的class，加上了注释AccessLog
    	  AccessLog accessLog = className.getAnnotation(AccessLog.class);
    	  if(accessLog!=null){
    		  //当前访问的方法名
    	   	  String methodName = jp.getSignature().getName();
    	      
    	      //方法参数的值
    	   	  Object[] argValues = jp.getArgs();
    	   
    	   	  //所有参数的类型
    	   	  Class[] argClazzs = ((MethodSignature)jp.getSignature()).getMethod().getParameterTypes();
    	   	
    	      //通过反射获得拦截的method
    	   	  Method method = className.getMethod(methodName, argClazzs);  
	  
    	   	  //当前访问的方法，标示了注释：AccessLog
    	      if(method.isAnnotationPresent(AccessLog.class)) { 
    	    	  
    	    	  StringBuilder argStr = new StringBuilder("参数值为：<br/>");
    	    	  
        	   	  //处理每个参数
        	   	  for (int i = 0; i < argClazzs.length; i++) {
        	   		    argStr.append("[");
        			    if(argValues[i] instanceof Page){//分页参数，不做处理
        			    	argStr.append("page");
        			    }else if(argValues[i] instanceof Object[]){//如果是数组、可变参数
      			    	   Object[] arrayArgValue = (Object[]) argValues[i];
    			    	   for(int k=0;k<arrayArgValue.length;k++){
    			    		   argStr.append("[").append(arrayArgValue[k]).append("]");
    			    		   if(k<arrayArgValue.length-1){
    				    		  argStr.append(",");
    				    	   }
    			    	   }
    			       }else if(argValues[i] instanceof IDEntity){//参数是Entity的子类
    			    	    Class argClass = argValues[i].getClass();
	    			       	//获得表名
	    			       	if(argClass.getAnnotation(Table.class)==null){
	    			       		continue;
	    			       	}
	    			       	Table table = (Table) argClass.getAnnotation(Table.class);
	    			       	String tableName = table.name().toLowerCase();
	    			       		
	    			       	argStr.append("表：").append(tableName).append("<br/>");
	    			       	argStr.append("id:").append(ReflectionUtils.getFieldValue(argValues[i], "id")).append("<br/>");
	    			       	
	    			       	getArgstr(i,argStr,argClass,argValues);
        			   }else{
        			    	argStr.append(argValues[i]);
        			   }
        			   argStr.append("]");
        	   	  }
        	   	 
        	   	  //记录日志到数据库
        	   	  accessLog = method.getAnnotation(AccessLog.class);  
			      String accessDescribe = accessLog.accessDescribe(); 
		         
		          SysAccessLog sysAccesslog = new SysAccessLog();
		          sysAccesslog.setAcccessIp(Servlets.getClientIp());
		          sysAccesslog.setAccessDescribe(accessDescribe);
		          sysAccesslog.setAccessMethod(className.getName()+"."+methodName);
		          sysAccesslog.setAccessTime(DateUtils.getCurrentDate());
		          sysAccesslog.setAccessType(advice);
		          sysAccesslog.setAccessUser(Sessions.getSysUser());
		          sysAccesslog.setCreateTime(DateUtils.getCurrentDate());
		          sysAccesslog.setOperateArg(argStr.toString());
		         
		          accessLogService.save(sysAccesslog);
    	   	  }
    	  }
    }
    /**
     * 获得操作参数名和值：字段名+字段值
     * @param i
     * @param argStr
     * @param argClass
     * @param argValues
     */
    @SuppressWarnings("unchecked")
	private static void getArgstr(int i,StringBuilder argStr,Class argClass,Object[] argValues){    		
    	//getter/setter方法集合
    	Method[] fieldMethods = argClass.getDeclaredMethods();
    	//属性集合
    	Field[] fields = argClass.getDeclaredFields();
    	Map<String,String> fieldMap = new HashMap<String,String>();
    	for(Field field : fields){
    		fieldMap.put(field.getName().toLowerCase(), field.getName());
    	}
    	for(Method fieldMethod : fieldMethods){
    		//方法名
    		String mName = fieldMethod.getName();
    		//get方法或is方法
    		String prefix = "";
    		if(mName.startsWith("get") || mName.startsWith("is")){
    			prefix = mName.startsWith("get")?"get":"is";
    			String fieldNameTemp = StringUtils.removeStart(mName, prefix).toLowerCase();
    			String fieldName = fieldMap.get(fieldNameTemp);
    			if(StringUtils.isNotBlank(fieldName)){
    				//获得列名
		    	   	Column column = fieldMethod.getAnnotation(Column.class);
		    	    if(column==null){
		    	    	continue;
		    	    }
		    	    String columnName = column.name().toLowerCase();
		    			
		    		//属性值
		    		Object fieldValue = ReflectionUtils.getFieldValue(argValues[i], fieldName);
		    		//如果是集合或IDEntity子类，不再做处理
		    	    if(fieldValue instanceof Collection || fieldValue instanceof IDEntity){
		    	       	/* Collection f = (Collection) fieldValue;
		    	          Iterator<String> iterator = f.iterator();
		    	          while (iterator.hasNext()) {
		    	        	     Object element = iterator.next();
		    	          }*/
		    	       	  fieldValue = fieldName;
		    	      }
		    	      argStr.append(columnName).append(":").append(fieldValue+"<br/>");
    				}
    			}
    	}
    }
}
