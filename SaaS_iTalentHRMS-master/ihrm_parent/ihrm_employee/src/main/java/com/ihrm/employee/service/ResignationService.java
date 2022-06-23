package com.ihrm.employee.service;

import com.ihrm.domain.employee.EmployeeResignation;
import com.ihrm.employee.dao.EmployeeResignationDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;


@Service
public class ResignationService {

    @Resource
    EmployeeResignationDao resignationDao;

    public void save(EmployeeResignation resignation) {
        resignation.setCreateTime(new Date());
        resignationDao.save(resignation);
    }

    public EmployeeResignation findById(String userId) {
        return resignationDao.findByUserId(userId);
    }
}
