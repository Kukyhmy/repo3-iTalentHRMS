package com.ihrm.social.dao;

import com.ihrm.domain.social_security.SocialsecurityCompanySettings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * 自定义dao接口继承
 *      JpaRepository<实体类，主键>
 *      JpaSpecificationExecutor<实体类>
 */
public interface CompanySettingsDao extends JpaRepository<SocialsecurityCompanySettings,String> ,JpaSpecificationExecutor<SocialsecurityCompanySettings> {
}
