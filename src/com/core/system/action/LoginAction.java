package com.core.system.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.utils.DateUtils;
import com.core.base.utils.FastMap;
import com.core.base.utils.string.EncodeUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.JsonResult;
import com.core.base.web.render.Renders;
import com.core.system.entity.SysRuleSetting;
import com.core.system.entity.SysUser;
import com.core.system.entity.UserLoginLog;
import com.core.system.service.RuleSettingService;
import com.core.system.service.UserLoginLogService;
import com.core.system.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 登录与退出action
 * @author yeshujun
 * 2009-03-20晚
 */
@Controller("system.action.LoginAction")
@Scope("prototype")
public class LoginAction extends ActionSupport{   
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//private static final Log log = LogFactory.getLog(LoginAction.class);
    
    private String loginName;   
    private String password;   
    private String cookieRememberme;//cookie字符串
    private YN rememberMe;  
    private YN forceLogin;//是否强制登录，Y:是，N:否
    private String loginMessage;
    
    private String yzm;
    
	@Autowired
    private UserService userService;
	@Autowired
    private UserLoginLogService userLoginLogService;
	@Autowired
	private RuleSettingService LoginRuleSettingService;
	
	//@Autowired
	//private MyMailSender myMailSender;
	
	public String create(){
		return null;
	}
	
	
	private Color getRandColor(int fc, int bc) { // 给定范围获得随机颜色  
        Random random = new Random();  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    } 
	
	public String getAuthCode(){
		HttpServletResponse response = ServletActionContext.getResponse();  
		HttpServletRequest request = ServletActionContext.getRequest();
		try {  
            int width = 50;  
            int height = 18;  
            // 取得一个4位随机字母数字字符串  
            String s = RandomStringUtils.random(4, true, true);  
  
            // 保存入session,用于与用户的输入进行比较.  
            // 注意比较完之后清除session.  
            HttpSession session = request.getSession(true);  
            session.setAttribute("authCode", s);  
            
            response.setContentType("images/jpeg");  
            response.setHeader("Pragma", "No-cache");  
            response.setHeader("Cache-Control", "no-cache");  
            response.setDateHeader("Expires", 0);  
  
            ServletOutputStream out = Servlets.getResponse().getOutputStream();  
            BufferedImage image = new BufferedImage(width, height,  
                    BufferedImage.TYPE_INT_RGB);  
            Graphics g = image.getGraphics();  
            // 设定背景色  
            g.setColor(getRandColor(200, 250));  
            g.fillRect(0, 0, width, height);  
  
            // 设定字体  
            Font mFont = new Font("Times New Roman", Font.BOLD, 18);// 设置字体  
            g.setFont(mFont);  
  
            // 画边框  
            // g.setColor(Color.BLACK);  
            // g.drawRect(0, 0, width - 1, height - 1);  
  
            // 随机产生干扰线，使图象中的认证码不易被其它程序探测到  
            g.setColor(getRandColor(160, 200));  
            // 生成随机类  
            Random random = new Random();  
            for (int i = 0; i < 155; i++) {  
                int x2 = random.nextInt(width);  
                int y2 = random.nextInt(height);  
                int x3 = random.nextInt(12);  
                int y3 = random.nextInt(12);  
                g.drawLine(x2, y2, x2 + x3, y2 + y3);  
            }  
  
            // 将认证码显示到图象中  
            g.setColor(new Color(20 + random.nextInt(110), 20 + random  
                    .nextInt(110), 20 + random.nextInt(110)));  
  
            g.drawString(s, 2, 16);  
  
            // 图象生效  
            g.dispose();  
            // 输出图象到页面  
            ImageIO.write((BufferedImage) image, "JPEG", out);  
            out.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null; 
	}

	
	@LoginValidation(validate = YN.N)
    public String checkYzm() throws Exception {
       // String email = Servlets.getStringParameter("yzm", "");
        HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		String authCode = (String) session.getAttribute("authCode");
		boolean flag = true;
		if(authCode == null || yzm == null || !authCode.equals(yzm)){
			flag= false;
		}
        Renders.renderJson(new JsonResult(flag));

        return NONE;
    }
	
	/**
     * 登录
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
	public String login()throws Exception{ 
		
        try {   
        	
        	HttpSession session =  Servlets.getSession();
        	String authCode = (String) session.getAttribute("authCode");
    		
    		/*if(authCode == null || yzm == null || !authCode.equals(yzm)){
    			
    			Renders.renderJson(new JsonResult("验证码不正确"));
    			return NONE;
    		}*/
    		
        	
        	SysUser sysUser = Sessions.getSysUser();
        	
            if(sysUser != null && StringUtils.isNotEmpty(sysUser.getId())){//session存在，重新登录
            	session.removeAttribute(Constants.USER_SESSION_KEY); 
            	sysUser = null;
            }
            Map<String,String> paramMap = new HashMap<String, String>();
            //cookie自动登录
            if(StringUtils.isNotBlank(cookieRememberme)){
            	byte[] bv =  EncodeUtils.decodeHex(cookieRememberme);
                String loginNameAndPassword = new String(bv);
                if (StringUtils.isNotEmpty(loginNameAndPassword)) {   
                    String[] split = loginNameAndPassword.split("\\|");   
                    if(split.length==2){
                    	paramMap = new FastMap().newHashMap().set("loginName", split[0]).set("passWord",split[1]);
                        sysUser = userService.findOne("system.findUsers",paramMap);
                    }
                }
            }else{
            	 //非cookie登录
            	 paramMap = new FastMap().newHashMap().set("loginName",loginName).set("passWord",EncodeUtils.encodeMd5(password));
            	 System.out.println(paramMap.get("passWord"));
            	 sysUser = userService.findOne("system.findUsers",paramMap); 
            }
            
            if(rememberMe==YN.Y){   
            	String cookieValue =  sysUser.getLoginName()+"|"+sysUser.getPassWord();
                Cookie cookie = new Cookie(Constants.COOKIE_REMEMBERME_KEY,EncodeUtils.encodeHex(cookieValue.getBytes()));   
                cookie.setPath(Servlets.getRequest().getContextPath());
                cookie.setMaxAge(7*24*60*60);//7天*24小时*60分*60秒
                Servlets.getResponse().addCookie(cookie);
            } 
            if(sysUser!=null){
                //2016-01-18：站群方式后，需要判别用户的归属地是否当前访问的二级页面一致
                //判断用户类别：2表示当前登录人员为注册用户，可自由访问页面，目前是写死的。以后增加方法获取注册用户的id
                if(!sysUser.getSysDept().getId().equalsIgnoreCase("2")){
                    String requestNameSpace = (String) Servlets.getSession().getAttribute("requestNameSpace");
                    if(sysUser.getOrganization().equalsIgnoreCase(requestNameSpace)){
                        if(forceLogin==YN.N){
                            //查询登录规则
                            SysRuleSetting loginRuleSetting = LoginRuleSettingService.findOne("login");
                            //同一个账号不可重复登录
                            if(loginRuleSetting.getRuleCode()==YN.N){
                                Map<String,SysUser> onlineUserMap = (Map<String, SysUser>) EhCacheManager.getAll(CacheConstants.HTTP_SESSION_CACHE);
                                if(onlineUserMap!=null && onlineUserMap.size()>0){
                                    for(String sessionId : onlineUserMap.keySet()){
                                        if(sysUser.getId().equals(onlineUserMap.get(sessionId).getId())){
                                            Renders.renderJson(new JsonResult("repeatLogin"));
                                            return NONE;
                                        }
                                    }
                                }
                            }
                        }

                    }else{
                        Renders.renderJson(new JsonResult("请确认当前登录子站是否为自己所属单位"));
                    }
                }
                sysUser.setSysRole(sysUser.getSysRoles().get(0));
                sysUser.setRoleId(sysUser.getSysRoles().get(0).getId());
                sysUser.setDepeId(sysUser.getSysDept().getId());
                sysUser.setLoginTime(DateUtils.getCurrentDate());

                session.setAttribute(Constants.USER_SESSION_KEY, sysUser);

                //myMail80Sender.sendMail(sysUser.getMailbox(), sysUser.getMailboxPassword(),new String[]{"372566232@qq.com"}, "我登录了", "我登录了");
                Renders.renderJson(new JsonResult("success"));
             	 return NONE;
            }else{
            	Renders.renderJson(new JsonResult("用户名或密码不正确"));
            	return NONE;
            }
        }catch (Exception e){   
        	e.printStackTrace();
            Renders.renderJson(new JsonResult("系统出现异常"));
        	return NONE;
        }   
    }   
    /**
     * 注销
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
	public String logout() throws Exception{   
    	HttpServletRequest request = Servlets.getRequest();
        HttpSession session = request.getSession(false); 
        //清空session
        if (session!=null){
        	  SysUser sysUser = Sessions.getSysUser();
        	  Map<String, YN> ruleSettingMap = (Map<String, YN>) EhCacheManager.get(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.SYS_RULE_SETTING_KEY);
        	  if(sysUser!=null && ruleSettingMap.get("loginLog")==YN.Y){
        		  //记录登录日志，如果用户直接点击浏览器的关闭按钮，将无法记录登录日志
            	  UserLoginLog userLog = new UserLoginLog();
                  userLog.setLoginIp(Servlets.getClientIp());
                  userLog.setLoginTime(sysUser.getLoginTime());
                  userLog.setCreateTime(sysUser.getLoginTime());
                  userLog.setCreateUser(sysUser);
                  userLog.setLoginUser(sysUser);
                  userLog.setLogoutTime(DateUtils.getCurrentDate());
        		  userLog.setOnlineTimeLength(DateUtils.getTimeLength(userLog.getLoginTime(), userLog.getLogoutTime(), "3"));
        		  
        		  userLoginLogService.save(userLog);
        		  
        		  session.removeAttribute(Constants.USER_SESSION_KEY);   
        	  }
    		 
              session.invalidate();
        }   
        //清理cookie 
        /*Cookie[] cookies = request.getCookies();   
        if (cookies!=null && cookies.length>0) {   
            for (Cookie cookie : cookies) {   
                if (Constants.COOKIE_REMEMBERME_KEY.equals(cookie.getName())) {   
                    cookie.setValue("");   
                    cookie.setMaxAge(0);   
                    cookie.setPath(Servlets.getRequest().getContextPath());
                    Servlets.getResponse().addCookie(cookie);   
                    return "logout";   
                }   
            }   
        }   */
        return "logout";   
    }
	
    /**
     * 
     * <li>功能描述：Ajax注销用户登录</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    public String logoutAjax() throws Exception {
        HttpServletRequest request = Servlets.getRequest();
        HttpSession session = request.getSession(false);
        // 清空session
        if (session != null) {
            SysUser sysUser = Sessions.getSysUser();
            Map<String, YN> ruleSettingMap = (Map<String, YN>) EhCacheManager.get(
                CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.SYS_RULE_SETTING_KEY);
            if (sysUser != null && ruleSettingMap.get("loginLog") == YN.Y) {
                // 记录登录日志，如果用户直接点击浏览器的关闭按钮，将无法记录登录日志
                UserLoginLog userLog = new UserLoginLog();
                userLog.setLoginIp(Servlets.getClientIp());
                userLog.setLoginTime(sysUser.getLoginTime());
                userLog.setCreateTime(sysUser.getLoginTime());
                userLog.setCreateUser(sysUser);
                userLog.setLoginUser(sysUser);
                userLog.setLogoutTime(DateUtils.getCurrentDate());
                userLog.setOnlineTimeLength(DateUtils.getTimeLength(userLog.getLoginTime(),
                    userLog.getLogoutTime(), "3"));

                userLoginLogService.save(userLog);

                session.removeAttribute(Constants.USER_SESSION_KEY);
            }

            session.invalidate();
        }
        Renders.renderJson(new JsonResult("注销成功！"));

        return NONE;
    }
    //--------------------以下是getter/setter方法----------------------------------------
   
    public String getLoginName() {   
        return loginName;   
    }   
    public YN getRememberMe() {
		return rememberMe;
	}
	public void setRememberMe(YN rememberMe) {
		this.rememberMe = rememberMe;
	}
	public void setLoginName(String loginName) {   
        this.loginName = loginName;   
    }   
    public String getPassword() {   
        return password;   
    }   
    public void setPassword(String password) {   
        this.password = password;   
    }   

	public String getLoginMessage() {
		return loginMessage;
	}
	public void setLoginMessage(String loginMessage) {
		this.loginMessage = loginMessage;
	}
	public YN getForceLogin() {
		return forceLogin;
	}
	public void setForceLogin(YN forceLogin) {
		this.forceLogin = forceLogin;
	}
	public String getCookieRememberme() {
		return cookieRememberme;
	}
	public void setCookieRememberme(String cookieRememberme) {
		this.cookieRememberme = cookieRememberme;
	}


	public String getYzm() {
		return yzm;
	}


	public void setYzm(String yzm) {
		this.yzm = yzm;
	}
}  
