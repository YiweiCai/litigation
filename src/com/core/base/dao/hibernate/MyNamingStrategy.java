/**
 * 
 */
package com.core.base.dao.hibernate;

import org.hibernate.cfg.ImprovedNamingStrategy;
import org.hibernate.cfg.NamingStrategy;

/**
 * 
 * <li>项目名称: <li>功能描述: Hibernate自动生成数据库生成规则
 * 
 * @author xcl
 * @version $Id: $
 */
public class MyNamingStrategy extends ImprovedNamingStrategy implements NamingStrategy {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    public String propertyToColumnName(String propertyName) {
        // TODO Auto-generated method stub
        return super.propertyToColumnName(propertyName).toUpperCase();
    }

    @Override
    public String classToTableName(String className) {
        return super.classToTableName(className).toUpperCase();
    }

    @Override
    public String tableName(String tableName) {
        return super.tableName(tableName).toUpperCase();
    }

    @Override
    public String columnName(String columnName) {
        return super.columnName(columnName).toUpperCase();
    }
}
