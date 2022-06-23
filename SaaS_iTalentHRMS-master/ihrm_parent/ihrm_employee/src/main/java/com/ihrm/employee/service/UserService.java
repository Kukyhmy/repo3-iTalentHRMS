package com.ihrm.employee.service;

import com.ihrm.domain.employee.UserWorkNumber;
import com.ihrm.employee.dao.UserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Description: UserService
 * @Author Kuky
 * @Date: 2022/6/20 0:49
 * @Version 1.0
 */
@Service
public class UserService {
    @Resource
    private UserDao userDao;

    public UserWorkNumber findById(String id) {
        return userDao.findById(id).get();
    }
}