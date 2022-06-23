package com.ihrm.employee.dao;
import com.ihrm.domain.employee.UserWorkNumber;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Description: UserDao
 * @Author Kuky
 * @Date: 2022/6/20 0:50
 * @Version 1.0
 */
public interface UserDao extends JpaRepository<UserWorkNumber,String>, JpaSpecificationExecutor<UserWorkNumber> {


}
