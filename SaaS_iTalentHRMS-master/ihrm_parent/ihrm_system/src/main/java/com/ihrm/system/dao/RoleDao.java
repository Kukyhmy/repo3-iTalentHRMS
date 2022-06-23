package com.ihrm.system.dao;

import com.ihrm.domain.system.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author: Kuky
 * @date: 2020/01/15
 **/
public interface RoleDao extends JpaRepository<Role,String>, JpaSpecificationExecutor<Role> {
}
