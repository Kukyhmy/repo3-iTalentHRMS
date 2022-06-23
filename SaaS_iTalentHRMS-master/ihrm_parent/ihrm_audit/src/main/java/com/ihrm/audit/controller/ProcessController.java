package com.ihrm.audit.controller;

import com.ihrm.audit.entity.ProcInstance;
import com.ihrm.audit.entity.ProcTaskInstance;
import com.ihrm.audit.service.AuditService;
import com.ihrm.audit.service.ProcessService;
import com.ihrm.common.controller.BaseController;
import com.ihrm.common.entity.PageResult;
import com.ihrm.common.entity.Result;
import com.ihrm.common.entity.ResultCode;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 流程控制的controller
 * @author: Kuky
 * @date: 2020/03/19
 **/
@CrossOrigin
@RestController
@RequestMapping("/process")
public class ProcessController extends BaseController {

    @Resource
    private ProcessService processService;

    @Resource
    private AuditService auditService;

    /**
     * 部署流程
     */
    @RequestMapping(value = "/deploy" , method = RequestMethod.POST)
    public Result deploy(@RequestParam("file")MultipartFile file) throws IOException {
        processService.deployProcess(file , companyId);
        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 查询所有的流程信息
     * SUSPENSION_STATE_:流程状态（当前流程是否被挂起）---1代表激活、可用状态，非1表示挂起状态
     */
    @RequestMapping(value = "/definition" , method = RequestMethod.GET)
    public Result definitionList() {
        List list = processService.getProcessDefinitionList(companyId);
        return new Result(ResultCode.SUCCESS , list);
    }

    /**
     * 挂起和恢复流程
     */
    @RequestMapping(value = "/suspend/{processKey}", method = RequestMethod.GET)
    public Result suspendProcess(@PathVariable String processKey) {
        processService.suspendProcess(processKey);
        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 查询申请列表
     * localhost:8080/api/user/process/instance/1/10
     */
    @RequestMapping(value = "/instance/{page}/{size}", method = RequestMethod.PUT)
    public Result instanceList(@RequestBody ProcInstance instance,@PathVariable int page, @PathVariable int size) {

        //调用service分页查询
        Page pages = auditService.getInstanceList(instance , page , size);
        //将page对象转化为自己的pageResult对象
        PageResult pr = new PageResult(pages.getTotalElements() , pages.getContent());
        return new Result(ResultCode.SUCCESS , pr);
    }


    /**
     * 查询申请的详细数据
     */
    @RequestMapping(value = "/instance/{id}", method = RequestMethod.GET)
    public Result getInstanceDetail(@PathVariable String id) {
        //调用service根据id查询
        ProcInstance instance = auditService.findInstanceDetail(id);
        return new Result(ResultCode.SUCCESS , instance);
    }

    /**
     * 流程申请
     */
    @RequestMapping(value = "/startProcess", method = RequestMethod.POST)
    public Result startProcess(@RequestBody Map map) {
        //调用service
        auditService.startProcess(map , companyId);
        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 提交审核
     */
    @RequestMapping(value = "/instance/commit", method = RequestMethod.PUT)
    public Result commit(@RequestBody ProcTaskInstance procTaskInstance) {
        //调用service
        auditService.commit(procTaskInstance , companyId);
        return new Result(ResultCode.SUCCESS);
    }

    //查询流程任务明细
    @RequestMapping(value = "/instance/tasks/{id}",method = RequestMethod.GET)
    public Result tasks(@PathVariable String id) {
        //调用service
        return new Result(ResultCode.SUCCESS,auditService.findTasksByProcess(id));
    }





}
