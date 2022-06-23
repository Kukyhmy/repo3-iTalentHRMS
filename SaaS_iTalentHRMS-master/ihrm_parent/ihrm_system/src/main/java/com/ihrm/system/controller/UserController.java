package com.ihrm.system.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ihrm.common.Constants.Constant;
import com.ihrm.common.controller.BaseController;
import com.ihrm.common.entity.PageResult;
import com.ihrm.common.entity.Result;
import com.ihrm.common.entity.ResultCode;
import com.ihrm.common.poi.ExcelImportUtil;
import com.ihrm.domain.company.Company;
import com.ihrm.domain.system.User;
import com.ihrm.domain.system.response.ProfileResult;
import com.ihrm.system.client.CompanyFeignClient;
import com.ihrm.system.service.UserService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.data.domain.Page;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Kuky
 * @date: 2020/01/09
 **/
//解决跨域
//@CrossOrigin
@RestController
@RequestMapping(value = "/sys")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    @Resource
    private CompanyFeignClient companyFeignClient;

    /**
     * 更新用户图片
     * @param id
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/user/upload/{id}")
    public Result upload(@PathVariable String id , @RequestParam(name = "file") MultipartFile file) throws Exception {

        //1.调用service保存图片
        String imgUrl = null;
        try {
            //需要配置百度AI,如果不正确会抛出异常
            imgUrl = userService.uploadImage(id , file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //2.返回数据
        return new Result(ResultCode.SUCCESS , imgUrl);
    }

    /**
     * 导入Excel,添加用户
     */
    @RequestMapping(value = "/user/import" , method = RequestMethod.POST)
    public Result importUser(@RequestParam(name = "file") MultipartFile file) throws Exception {

        //1.解析Excel
//        //1.1.根据Excel文件创建工作簿
//        Workbook wb = new XSSFWorkbook(file.getInputStream());
//        //1.2.获取Sheet
//        Sheet sheet = wb.getSheetAt(0);//参数：索引
//        //1.3.获取Sheet中的每一行，和每一个单元格
//        //2.获取用户数据列表
//        List<User> list = new ArrayList<>();
//        System.out.println(sheet.getLastRowNum());
//        for (int rowNum = 1; rowNum<= sheet.getLastRowNum() ;rowNum ++) {
//            Row row = sheet.getRow(rowNum);//根据索引获取每一个行
//            Object [] values = new Object[row.getLastCellNum()];
//            for(int cellNum=1;cellNum< row.getLastCellNum(); cellNum ++) {
//                Cell cell = row.getCell(cellNum);
//                Object value = getCellValue(cell);
//                values[cellNum] = value;
//            }
//            User user = new User(values);
//            list.add(user);
//        }
        List<User> list = new ExcelImportUtil(User.class).readExcel(file.getInputStream(), 1, 1);
        //3.批量保存用户
        userService.saveAll(list , companyId , companyName);
        return new Result(ResultCode.SUCCESS);
    }
    public static Object getCellValue(Cell cell) {
        //1.获取到单元格的属性类型
        CellType cellType = cell.getCellType();
        //2.根据单元格数据类型获取数据
        Object value = null;
        switch (cellType) {
            case STRING:
                value = cell.getStringCellValue();
                break;
            case BOOLEAN:
                value = cell.getBooleanCellValue();
                break;
            case NUMERIC:
                if(DateUtil.isCellDateFormatted(cell)) {
                    //日期格式
                    value = cell.getDateCellValue();
                }else{
                    //数字
                    value = cell.getNumericCellValue();
                }
                break;
            case FORMULA: //公式
                value = cell.getCellFormula();
                break;
            default:
                break;
        }
        return value;
    }
    /**
     * 分配角色
     */
    @RequestMapping(value = "/user/assignRoles" , method = RequestMethod.PUT)
    public Result save(@RequestBody Map<String,Object> map){

        //获取被分配的用户id
        String userId = (String) map.get("id");
        //获取到角色的id列表
        List<String> roleIds = (List<String>) map.get("roleIds");
        //调用service完成角色分配
        userService.assignRoles(userId , roleIds);

        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 保存
     * @return
     */
    @RequestMapping(value = "/user" , method = RequestMethod.POST)
    public Result save(@RequestBody User user){
        //设置保存的用户id
        user.setCompanyId(companyId);
        user.setCompanyName(companyName);
        //调用service完成保存用户
        userService.save(user);
        //构造返回结果
        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 查询用户列表
     * @return
     */
    @RequestMapping(value = "/user" , method = RequestMethod.GET)
    public Result findAll(int page, int size, @RequestParam() Map map){

        //获取当前的企业id
        map.put("companyId" , companyId);
        Page<User> pageUser = userService.findAll(map, page, size);
        //构造返回结果
        PageResult<User> pageResult = new PageResult<>(pageUser.getTotalElements(),pageUser.getContent());
        return new Result(ResultCode.SUCCESS , pageResult);
    }

    /**
     * 根据Id查询
     */
    @RequestMapping(value = "/user/{id}" , method = RequestMethod.GET)
    public Result findById(@PathVariable(value = "id") String id){
        //添加roleIds(用户已经具有的角色id数组)
        User user = userService.findById(id);
        return new Result(ResultCode.SUCCESS , user);
    }

    /**
     * 修改User
     */
    @RequestMapping(value = "/user/{id}" , method = RequestMethod.PUT)
    public Result update(@PathVariable(value = "id") String id , @RequestBody User user){
        //调用Service更新
        userService.update(id , user);
        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 根据Id删除
     */
    @RequiresPermissions(value = "API-USER-DELETE")
    @RequestMapping(value = "/user/{id}" , method = RequestMethod.DELETE , name = "API-USER-DELETE")
    public Result delete(@PathVariable(value = "id") String id){
        userService.deleteById(id);
        return new Result(ResultCode.SUCCESS);
    }

    public static void main(String[] args) {
        String pass = new Md5Hash("123456" , "13800000002" , 3).toString();
        System.out.println(pass);
    }
    /**
     * 用户登录
     */
    @PostMapping(value = "/login")
    public Result login(@RequestBody Map<String,Object> loginMap){
        String mobile = (String) loginMap.get("mobile");
        String password = (String) loginMap.get("password");
        try {

            //如果该公司被禁止登录,直接返回
            User user = userService.findByMobile(mobile);
            if (!Constant.UserLevel.SAASADMIN.equals(user.getLevel())){
                //返回时List<LinkedHashMap> ,需要对其解析
                LinkedHashMap linkedHashMap
                        = (LinkedHashMap) companyFeignClient.findCompanyById(user.getCompanyId()).getData();
                Company company = JSON.parseObject(JSON.toJSONString(linkedHashMap), new TypeReference<Company>() {
                });
                if (!ObjectUtils.isEmpty(company)){
                    if (Constant.Company.COMPANY_DISABLE.equals(String.valueOf(company.getState()))){
                        return new Result(ResultCode.UNAUTHORISE);
                    }
                }
            }
            //构造登录令牌
            password = new Md5Hash(password , mobile , 3).toString();
            UsernamePasswordToken upToken = new UsernamePasswordToken(mobile , password);
            //获取subject
            Subject subject = SecurityUtils.getSubject();
            //调用login方法,进入realm完成认证
            subject.login(upToken);
            //获取sessionId
            String sessionId = (String) subject.getSession().getId();
            //构造返回结果
            return new Result(ResultCode.SUCCESS , sessionId);
        }catch (Exception e){
            System.out.println("error : " + e);
            return new Result(ResultCode.MOBILEORPASSWORDERROR);
        }
    }

    /**
     * 用户登录成功之后,获取用户信息
     */
    @RequestMapping(value = "/profile" , method = RequestMethod.POST)
    public Result profile() {
        //获取session中的安全数据
        Subject subject = SecurityUtils.getSubject();
        //subject获取所有的安全集合
        PrincipalCollection principals = subject.getPrincipals();
        //获取安全数据
        ProfileResult result = (ProfileResult) principals.getPrimaryPrincipal();
        return new Result(ResultCode.SUCCESS,result);
    }

}
