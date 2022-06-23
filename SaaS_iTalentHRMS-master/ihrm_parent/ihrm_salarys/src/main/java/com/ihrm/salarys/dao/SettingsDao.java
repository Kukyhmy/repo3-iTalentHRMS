package com.ihrm.salarys.dao;

import com.ihrm.domain.salarys.Settings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * 自定义dao接口继承
 *      JpaRepository<实体类，主键>
 *      JpaSpecificationExecutor<实体类>
 */
public interface SettingsDao extends JpaRepository<Settings,String> ,JpaSpecificationExecutor<Settings> {
}
