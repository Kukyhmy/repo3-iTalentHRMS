# SaaS_iTalentHRMS（iTalent-基于SaaS的人力资源管理系统）
iTalentHR人力资源管理系统采用前后端分离方式进行开发，采用旨在为用户提供是在线系统模式软件在线服务，多租户平台，实现租户通过浏览器即可管理上百人的薪资、考勤、社保、入职离职。

---

## 功能模块图
各个模块的功能介绍：
![系统结构图](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/iTalentHR.png)
- **功能补充：**
- 报表技术
  采用多种报表技术(ApachePOI,JasperReport)实现企业人力资源各项数据统计汇总，包括传统的Excel报表及PDF报表生成，POI报表的优化技术。
- 完备的权限系统解决方案
  项目加入经典的权限系统RBAC认证模型，采用Shiro+springBoot整合实现权限系统开发，实现系统的认证与授权、加密，实现单点登录。

---
### 前端技术栈(无深入学习，浅学改造&使用)
以Node.js为核心的Vue.js前端技术生态架构
使用element-ui组件库快速开发前端界面，在GitHub上下载的一套脚手架，与后端项目通过swagger-ui及postman结合调试开发，主要内容如下：
* 技术栈
  * vue 2.5++
  * elementUI 2.2.2
  * axios
  * vue-router
* 环境
  * node 8.++
  * npm 5++
### 后端技术栈
**SpringBoot+SpringCloud+SpringMVC+SpringDataJPA**

**服务发现框架Eureka、Zuul网关、微服务调用组件Feign、微服务网关zuul**
![微服务架构图](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/architectureDiagram.png)

---
## 开发环境
* JDK : Oracle JDK 1.8
* Mysql： 8.0
* Maven： 3.8.5
* Redis： 3.5.8

---

## 项目截图
### 首页登录

![账号密码登录](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/index.png)
![刷脸扫码登录](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/shualianlogin.png)
### SaaS管理员模块

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/admin-index.png)
![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/admin-company.png)

### 企业管理员模块
![首页](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/mindex.png)
![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-1.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-2.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-3.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-4.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-5.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-6.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-7.png)

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/model-8.png)

### 员工模块

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/yuangong.png)

![员工信息PDF打印](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/pdf.png) 

---
## 系统架构

![系统架构图.png](https://i.loli.net/2020/06/18/S3WzdcZrqaIuAO4.png)

---
## 微服务模块

![](http://rdpzpf4g4.hn-bkt.clouddn.com/readme/run/project.png)

各个模块的功能介绍：

![](https://img-blog.csdnimg.cn/20210102135523520.png)

---
## 启动顺序
1.  ihrm_eureka   
2.  ihrm_gate
3.  ihrm_company
4.  ihrm_system
5.  ihrm_attendance
6.  ihrm_social_securitys
7.  ihrm_salarys 
8.  ihrm_employee 
9.  ihrm_audit

启动顺序原因：

* 因为所有模块都注册到了Eureka中，故最先启动Eureka模块
* 因为在gate模块后面都是业务模块，所以网关模块放在第二位启动
* 因为system模块通过feign调用了company模块的接口，所以company要在system模块之前启动
* 因为salarys模块通过feign调用了attendance和social_securitys模块的接口，所以salarys在其之后启动
* 后面两个顺序可以打乱
* 服务调用了其他服务的接口，最好是先去启动被调用的模块

---
## 用户登录
登录时用户名为手机号，密码大多为123456。
帐号信息表在bs_user中。
登录时使用MD5加密，对密码进行三次MD5加密，salt为手机号。
登录时需开启redis，因为登录成功后会把登录信息存储在redis中。
因为我本机的redis设置了帐号和密码，可在application.yml中配置即可。

* SaaS管理员帐号密码
  * 13800000001
  * 123456
* 企业管理员帐号密码
  * 13800000002
  * 123456
* 员工帐号密码
  * 13800000003
  * 123456

---
## 数据库文件
- *数据库文件目录为`static-files/ihrm.sql`、`static-files/act.sql`；*
数据库主要一个主数据库，数据库名为ihrm；另一个数据库名为act，是activity7使用的，可以自动生成

ihrm：
* 介绍
  * bs
    * bs开头的表，表示业务相关的内容
  * pe
    * pe开头的表，表示权限相关的内容
  * co
    * co开头的表，表示公司相关的内容
  * em
    * em开头的表，表示员工相关的内容

act ：
* 介绍
  * act主要为activity7工作流用到的数据库

---
## BPMN流程文件

在请假时需要进行走流程，使用的是activity7工作流。
流程BPMN文件：
- *流程BPMN文件目录为`static-files/ihrm.sql`、`static-files/act.sql`；*
* 介绍
  * 把BPMN文件解析到act数据库
  * act数据库会在部署时自动创建
---
## 项目存在的问题
### 员工管理模块

* 保存用户信息时部门id和name不统一

## 前端
前端使用Vue编写，地址为：https://github.com/Kukyhmy/repo2-SaaS-iTalentHRMS-Vue.git



