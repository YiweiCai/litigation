package com.core.base.web.struts2.interceptor;

import java.io.File;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.util.ValueStack;
import com.core.base.annotation.FileUpload;
import com.core.base.entity.IDEntity;
import com.core.base.web.Servlets;
import com.core.base.web.struts2.action.BaseUploadFileAction;
import com.core.cms.entity.CmsArticle;
import com.core.upload.service.UploadFileService;
/**
 * 附件上传拦截器
 * 
 * 由于某种原因，在2012-12-26后，这种拦截器上传附件的方式，不再使用了，
 * 新的附件上传方式，虽然多写了点代码，但更清晰。
 * @author yeshujun
 */
public class MyFileUploadInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UploadFileService uploadFileService;
	
	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception {  
		
		//过滤器，获取请求的路径截取
		String requestPath = Servlets.getRequest().getRequestURI();
		String [] attr = requestPath.split("/");
		/*if(Servlets.getRequest().getContextPath().equals(attr[2])){
			Servlets.getSession().setAttribute("requestNameSpace","zzfy");
		}else{
			Servlets.getSession().setAttribute("requestNameSpace",attr[2]);
		}*/
		String requestNameSpace = "";
		//if(attr[2].contains("index")){
		if(attr[1].contains("index")){
			System.out.println("zzfy");
			requestNameSpace = "zzfy";
		}else{
			//requestNameSpace = attr[2];
			requestNameSpace = attr[1];
			System.out.println(requestNameSpace);
		}
		Servlets.getSession().setAttribute("requestNameSpace",requestNameSpace);
    	System.out.println("二级页："+requestNameSpace); 
		
		/*
		StringBuffer requestPath2 =Servlets.getRequest().getRequestURL();
		System.out.println("requestURL is :"+requestPath2.toString());
		*/
		 Object action = invocation.getAction();
		
    	 Class<?> actionClass = action.getClass();
    	 
    	 String methodName = invocation.getProxy().getMethod();
	     Method method = actionClass.getMethod(methodName);
	     
	     ValueStack valueStack = invocation.getStack();
	     
	     FileUpload uploadFileInfo = method.getAnnotation(FileUpload.class);
	     
		 if(!(action instanceof BaseUploadFileAction) || uploadFileInfo==null){
			 return invocation.invoke();
		 }else{
			 System.out.println("testStr:"+valueStack.findString("testStr"));
	 		 List<File> upload = (List<File>) valueStack.findValue("upload");
	 		 List<String> uploadFileName = (List<String>) valueStack.findValue("uploadFileName");
			 List<String> uploadContentType = (List<String>) valueStack.findValue("uploadContentType");
			 
			 if(upload==null || upload.size()==0){
				 return invocation.invoke();
			 }else{
				 String filePath = uploadFileInfo.filePath();
		    	 boolean isRecordToDB = uploadFileInfo.isRecordToDB();
		    	 if("".equals(filePath) ){
			    	 throw new Exception("附件未设置路径，请先设置路径");
			     }
		    	 
				 if(isRecordToDB){
					//附件拥有者id，请注意ownerId为action中的model的id，否则请修改此处的代码，取到附件拥有者id
					 String ownerId = "";
					 Object obj = ((BaseUploadFileAction) action).getModel();
					 if(obj instanceof IDEntity){
						 ownerId = ((IDEntity)obj).getId();
					} else if (obj instanceof CmsArticle) {
						/*ownerId = ((CmsArticle) obj).getId() == 0 ? "" : ""
								+ ((CmsArticle) obj).getId();*/
						ownerId = ((CmsArticle) obj).getId();
					}
					 if(StringUtils.isNotEmpty(ownerId)){
						uploadFileService.upload(ownerId,filePath,upload, uploadFileName, uploadContentType);
						 return invocation.invoke();
					 }else{
						 //在 action return（执行结束）后执行
						 String result = invocation.invoke();
						 obj = ((BaseUploadFileAction) action).getModel();
						 if(obj instanceof IDEntity){
							 ownerId = ((IDEntity)obj).getId();
						 } else if (obj instanceof CmsArticle) {
								ownerId = ((CmsArticle) obj).getId();
						}
						 if("".equals(ownerId) ){
					    	 throw new Exception("附件拥有者的id不是entity："+obj.getClass().getName()+"的id");
					     }
						 
						 uploadFileService.upload(ownerId,filePath,upload, uploadFileName, uploadContentType);
						 System.out.println("end");
						 return result;
					 }
					 
				 }else{
					 uploadFileService.upload("",filePath,upload, uploadFileName, uploadContentType);
					 System.out.println("end");
					 return invocation.invoke();
				 }
			 }
	 		 
		     
		 }
	     
	}
	public void setUploadFileService(UploadFileService uploadFileService) {
		this.uploadFileService = uploadFileService;
	}
}
