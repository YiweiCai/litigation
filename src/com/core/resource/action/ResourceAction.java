/**
 * 
 */
package com.core.resource.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.FileUpload;
import com.core.base.annotation.LoginValidation;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.Renders;
import com.core.base.web.struts2.action.BaseUploadFileAction;
import com.core.resource.entity.Resource;
import com.core.resource.entity.ResourceDownloadHistory;
import com.core.resource.service.ResourceDownloadHistoryService;
import com.core.resource.service.ResourceService;
import com.core.system.entity.SysUser;

/**
 * <li>项目名称: cyzc</li> <li>功能描述: 资源Action类</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Scope("prototype")
@Controller("core.ResourceAction")
public class ResourceAction extends BaseUploadFileAction<Resource> {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private String id;
    private Resource resource;
    private Page page = new Page(Constants.PAGE_SIZE);

    // 查询条件
    private String name;
    private String type;
    private String category;
    private String environment;

    /**
     * 模式：精品推荐-quality；资源类型-type；资源分类-category；搜索结果-result（默认值为：result）
     */
    private String mode;

    // 当前用户
    private SysUser user = Sessions.getSysUser();

    @Autowired
    ResourceService resourceService;

    @Autowired
    ResourceDownloadHistoryService resourceDownloadHistoryService;

    /*
     * (non-Javadoc)
     * 
     * @see com.opensymphony.xwork2.ModelDriven#getModel()
     */
    @Override
    public Resource getModel() {
        return this.resource;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#prepareModel()
     */
    @Override
    public void prepareModel() throws Exception {
        if (StringUtils.isBlank(id)) {
            this.resource = new Resource();
            resource.setCreateTime(DateUtils.getCurrentDate());
            resource.setPublishTime(resource.getCreateTime());// 资源的发布时间默认与创建时间相同，待审核通过时再做修改
            resource.setCreateUser(user);
        } else {
            this.resource = this.resourceService.get(id);
            setUploadFileList(getUploadFileService().findByOwnerId(id));
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#add()
     */
    @Override
    public String add() throws Exception {
        return ADD;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#update()
     */
    @Override
    public String update() throws Exception {
        return ADD;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#detail()
     */
    @Override
    @LoginValidation(validate = YN.N)
    public String detail() throws Exception {
        this.resource.setVisitCount(this.resource.getVisitCount() + 1);
        this.resourceService.update(resource);

        return DETAIL;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#save()
     */
    @Override
    @FileUpload(filePath = "uploadfile/resource", isRecordToDB = true)
    public String save() throws Exception {
        if (StringUtils.isEmpty(id)) {
            resourceService.save(resource);
            Renders.renderJson(Renders.SAVE_SUCCESS);
        } else {
            resourceService.update(resource);
            Renders.renderJson(Renders.UPDATE_SUCCESS);
        }
        return NONE;
    }

    /**
     * 
     * <li>功能描述：审核</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    public String check() throws Exception {
        this.resource = this.resourceService.get(id);
        int state = 0;
        try {
            state = Integer.parseInt(Servlets.getRequest().getParameter("state"));
        } catch (Exception e) {
        }

        if (resource != null) {
            resource.setState(state);
        }
        resourceService.update(resource);
        Renders.renderJson(Renders.UPDATE_SUCCESS);

        return NONE;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#list()
     */
    @Override
    public String list() throws Exception {
        try {
            Map<String, String> paramMap = new HashMap<String, String>();
            if (StringUtils.isNotBlank(name)) {
                paramMap.put("name", "%" + name + "%");
            }
            if (StringUtils.isNotBlank(type)) {
                paramMap.put("type", type);
            }
            if (StringUtils.isNotBlank(category)) {
                paramMap.put("category", category);
            }
            if (StringUtils.isNotBlank(environment)) {
                paramMap.put("environment", "%" + environment + "%");
            }

            page = this.resourceService.findPage(page, "core.findResources", paramMap);
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
        }
        return LIST;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.core.base.web.struts2.action.BaseCrudAction#delete()
     */
    @Override
    public String delete() throws Exception {
        // TODO: 在删除资源时应同时删除附件
        String ids = Servlets.getRequest().getParameter("ids");
        this.resourceService.deleteByIds(ids.split(","));
        Renders.renderJson(Renders.DELETE_SUCCESS);
        return NONE;
    }

    /**
     * 
     * <li>功能描述：前台资源列表页</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String flist() throws Exception {
        try {
            Map<String, Object> paramMap = new HashMap<String, Object>();

            paramMap.put("state", 1);
            if (StringUtils.isNotBlank(name)) {
                paramMap.put("name", "%" + name + "%");
            }
            if (StringUtils.isNotBlank(type)) {
                paramMap.put("type", type);
            }
            if (StringUtils.isNotBlank(category)) {
                paramMap.put("category", category);
            }
            // 精品推荐为资源按浏览次数倒序排列
            if ("quality".equals(mode)) {
                paramMap.put("orderattr", "visitCount");
                paramMap.put("ordertype", "DESC");
            }

            page = this.resourceService.findPage(page, "core.findResources", paramMap);
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
            e.printStackTrace();
        }
        return "flist";
    }

    /**
     * 
     * <li>功能描述：最新资源（栏目块）</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String newtop() throws Exception {
        try {
            String hql = "from Resource where state = 1 order by publishTime desc";
            page = this.resourceService.findPage(page, new HqlBuilder(hql));
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
            e.printStackTrace();
        }

        return "newtop";
    }

    /**
     * 
     * <li>功能描述：下载排行（栏目块）</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String downtop() throws Exception {
        try {
            String hql = "from Resource where state = 1 order by downloadCount desc";
            page = this.resourceService.findPage(page, new HqlBuilder(hql));
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
            e.printStackTrace();
        }

        return "downtop";
    }

    /**
     * 
     * <li>功能描述：精品推荐（栏目块）</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String quality() throws Exception {
        try {
            String hql = "from Resource where state = 1 order by visitCount desc";
            page = this.resourceService.findPage(page, new HqlBuilder(hql));
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
            e.printStackTrace();
        }

        return "quality";
    }

    /**
     * 下载附件
     */
    @Override
    public String download() throws Exception {
        this.resource = this.resourceService.get(id);

        if (this.resource != null) {
            this.resource.setDownloadCount(this.resource.getDownloadCount() + 1);
            this.resourceService.update(resource);

            // 写入资源下载记录
            writeDownloadHistory();
        }

        return super.download();
    }

    /**
     * <li>功能描述：写入资源下载记录</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    private void writeDownloadHistory() throws Exception {
        String hql = "select history from ResourceDownloadHistory history "
            + "where history.createUser.id = '" + user.getId() + "' and history.resourceId = '"
            + this.resource.getId() + "'";

        ResourceDownloadHistory history = this.resourceDownloadHistoryService
            .findOne(new HqlBuilder(hql));

        if (history == null) {
            history = new ResourceDownloadHistory();
            history.setCreateTime(DateUtils.getCurrentDate());
            history.setUpdateTime(DateUtils.getCurrentDate());
            history.setCreateUser(user);
            history.setDownloadCount(1);
            history.setResourceId(id);

            this.resourceDownloadHistoryService.save(history);
        } else {
            history.setDownloadCount(history.getDownloadCount() + 1);
            history.setUpdateTime(DateUtils.getCurrentDate());

            this.resourceDownloadHistoryService.update(history);
        }
    }

    /**
     * 获取id
     * 
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置id
     * 
     * @param id id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取resource
     * 
     * @return resource
     */
    public Resource getResource() {
        return resource;
    }

    /**
     * 设置resource
     * 
     * @param resource resource
     */
    public void setResource(Resource resource) {
        this.resource = resource;
    }

    /**
     * 获取page
     * 
     * @return page
     */
    public Page getPage() {
        return page;
    }

    /**
     * 设置page
     * 
     * @param page page
     */
    public void setPage(Page page) {
        this.page = page;
    }

    /**
     * 获取name
     * 
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置name
     * 
     * @param name name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取user
     * 
     * @return user
     */
    public SysUser getUser() {
        return user;
    }

    /**
     * 设置user
     * 
     * @param user user
     */
    public void setUser(SysUser user) {
        this.user = user;
    }

    /**
     * 获取resourceService
     * 
     * @return resourceService
     */
    public ResourceService getResourceService() {
        return resourceService;
    }

    /**
     * 设置resourceService
     * 
     * @param resourceService resourceService
     */
    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }

    /**
     * 获取type
     * 
     * @return type type
     */
    public String getType() {
        return type;
    }

    /**
     * 设置type
     * 
     * @param type type
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取category
     * 
     * @return category category
     */
    public String getCategory() {
        return category;
    }

    /**
     * 设置category
     * 
     * @param category category
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 获取environment
     * 
     * @return environment environment
     */
    public String getEnvironment() {
        return environment;
    }

    /**
     * 设置environment
     * 
     * @param environment environment
     */
    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    /**
     * 获取模式：精品推荐-quality；资源类型-type；资源分类-category；搜索结果-result（默认值为：result）
     * 
     * @return mode
     */
    public String getMode() {
        return mode;
    }

    /**
     * 设置模式：模式：精品推荐-quality；资源类型-type；资源分类-category；搜索结果-result（默认值为：result）
     * 
     * @param mode 模式：精品推荐-quality；资源类型-type；资源分类-category；搜索结果-result（默认值为：result）
     */
    public void setMode(String mode) {
        this.mode = mode;
    }

}
