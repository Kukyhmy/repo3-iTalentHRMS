package com.ihrm.system.shiro.realm;

import com.ihrm.common.Constants.Constant;
import com.ihrm.common.shiro.realm.IhrmRealm;
import com.ihrm.domain.system.Permission;
import com.ihrm.domain.system.User;
import com.ihrm.domain.system.response.ProfileResult;
import com.ihrm.system.service.PermissionService;
import com.ihrm.system.service.UserService;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Kuky
 * @date: 2020/02/08
 **/
public class UserRealm extends IhrmRealm {

    @Resource
    private UserService userService;

    @Resource
    private PermissionService permissionService;

    /**
     * 认证方法
     * @param authenticationToken   权限token
     * @return  权限token对应的权限Info
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) {
        //获取用户的手机号和密码
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
        String mobile = upToken.getUsername();
        String password = new String(upToken.getPassword());
        //根据手机号查询用户
        User user = userService.findByMobile(mobile);

        //根据用户是否存在,用户密码是否和输入密码一致
        if (user != null && user.getPassword().equals(password)){
            //构造安全数据并返回(安全数据：用户基本信息,权限信息,ProfileResult)
            ProfileResult result;
            //如果是员工,就把员工的信息保存
            if (Constant.UserLevel.USER.equals(user.getLevel())){
                result = new ProfileResult(user);
            }else{
                Map<String,Object> map = new HashMap<>(1);
                //如果是企业管理员,就查询企业管理员可见的
                if (Constant.UserLevel.COADMIN.equals(user.getLevel())){
                    map.put("enVisible" , "1");
                }else if (Constant.UserLevel.SAASADMIN.equals(user.getLevel())){
                    //如果是SaaS管理员，只显示企业不显示的，即只显示企业管理和模块管理
                    map.put("enVisible" , "0");
                }
                List<Permission> list = permissionService.findAll(map);
                result = new ProfileResult(user , list);
            }

            //构造方法：安全数据,密码,realm域名
            return new SimpleAuthenticationInfo(result , user.getPassword() , this.getName());
        }
        //返回null,会抛出异常,表示用户名和密码不匹配
        return null;
    }

    
}
