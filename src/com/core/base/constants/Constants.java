package com.core.base.constants;


/**
 * 静态常量
 * @author yeshujun
 * 2009-03-21
 */
public class Constants {
	
	/**
	 * 用户在session中的变量名
	 */
	public static final String USER_SESSION_KEY="userSession";   

	/**
	 * cookie名
	 */
    public static final String COOKIE_REMEMBERME_KEY="cookie.rememberme"; 
    
    /**
     * 默认分页页面，一页显示的记录条数
     */
    public static final int PAGE_SIZE=10;
    
    /**
     * 取到sql、hql模板的数据来源：xml或database
     * 为xml时，从*.query.xml中获取
     * 为database时，从数据库查询
     */
    public static String QUERY_SQL_HQL_FROM = "xml"; 
    
    public static final String DEFAULT_DEPART_ID = "2";
    
    public static final String DEFAULT_ROLE_IDS = "4028e3484d9a91fa014d9aa0414a007a";
    
    public static final String LAWYER_ROLE_IDS = "8ae99b51511de52301512e402ded0003";
    
    public static final String COMMISSIONER_ROLE_IDS = "8ae99b51511de52301512e40e3ff000d";
}
