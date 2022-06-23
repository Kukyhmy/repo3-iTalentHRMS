package com.ihrm.domain.employee.response;

import com.ihrm.domain.employee.EmployeeResignation;
import com.ihrm.domain.employee.UserCompanyPersonal;
import com.ihrm.domain.poi.ExcelAttribute;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.BeanUtils;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class EmployeeReportResult {

    @ExcelAttribute(sort = 0)
    private String userId;

    @ExcelAttribute(sort = 1)
    private String username;

    private String departmentName;

    @ExcelAttribute(sort = 2)
    private String mobile;

    @ExcelAttribute(sort = 9)
    private String timeOfEntry;

    private String companyId;

    private String sex;
    /**
     * 出生日期
     */
    private String dateOfBirth;
    /**
     * 最高学历
     */
    @ExcelAttribute(sort = 3)
    private String theHighestDegreeOfEducation;
    /**
     * 国家地区
     */
    @ExcelAttribute(sort = 4)
    private String nationalArea;
    /**
     * 护照号
     */
    @ExcelAttribute(sort = 5)
    private String passportNo;
    /**
     * 身份证号
     */
    private String idNumber;
    /**
     * 身份证照片-正面
     */
    private String idCardPhotoPositive;
    /**
     * 身份证照片-背面
     */
    private String idCardPhotoBack;
    /**
     * 籍贯
     */
    @ExcelAttribute(sort = 6)
    private String nativePlace;
    /**
     * 民族
     */
    private String nation;
    /**
     * 英文名
     */
    private String englishName;
    /**
     * 婚姻状况
     */
    private String maritalStatus;
    /**
     * 员工照片
     */
    private String staffPhoto;
    /**
     * 生日
     */
    @ExcelAttribute(sort = 7)
    private String birthday;
    /**
     * 属相
     */
    @ExcelAttribute(sort = 8)
    private String zodiac;
    /**
     * 年龄
     */
    private String age;
    /**
     * 星座
     */
    private String constellation;
    /**
     * 血型
     */
    private String bloodType;
    /**
     * 户籍所在地
     */
    private String domicile;
    /**
     * 政治面貌
     */
    private String politicalOutlook;
    /**
     * 入党时间
     */
    private String timeToJoinTheParty;
    /**
     * 存档机构
     */
    private String archivingOrganization;
    /**
     * 子女状态
     */
    private String stateOfChildren;
    /**
     * 子女有无商业保险
     */
    private String doChildrenHaveCommercialInsurance;
    /**
     * 有无违法违纪行为
     */
    private String isThereAnyViolationOfLawOrDiscipline;
    /**
     * 有无重大病史
     */
    private String areThereAnyMajorMedicalHistories;
    /**
     * QQ
     */
    private String qq;
    /**
     * 微信
     */
    private String wechat;
    /**
     * 居住证城市
     */
    private String residenceCardCity;
    /**
     * 居住证办理日期
     */
    private String dateOfResidencePermit;
    /**
     * 居住证截止日期
     */
    private String residencePermitDeadline;
    /**
     * 现居住地
     */
    private String placeOfResidence;
    /**
     * 通讯地址
     */
    private String postalAddress;
    /**
     * 联系手机
     */
    private String contactTheMobilePhone;
    /**
     * 个人邮箱
     */
    private String personalMailbox;
    /**
     * 紧急联系人
     */
    private String emergencyContact;
    /**
     * 紧急联系电话
     */
    private String emergencyContactNumber;
    /**
     * 社保电脑号
     */
    private String socialSecurityComputerNumber;
    /**
     * 公积金账号
     */
    private String providentFundAccount;
    /**
     * 银行卡号
     */
    private String bankCardNumber;
    /**
     * 开户行
     */
    private String openingBank;
    /**
     * 学历类型
     */
    private String educationalType;
    /**
     * 毕业学校
     */
    private String graduateSchool;
    /**
     * 入学时间
     */
    private String enrolmentTime;
    /**
     * 毕业时间
     */
    private String graduationTime;
    /**
     * 专业
     */
    private String major;
    /**
     * 毕业证书
     */
    private String graduationCertificate;
    /**
     * 学位证书
     */
    private String certificateOfAcademicDegree;
    /**
     * 上家公司
     */
    private String homeCompany;
    /**
     * 职称
     */
    private String title;
    /**
     * 简历
     */
    private String resume;
    /**
     * 有无竞业限制
     */
    private String isThereAnyCompetitionRestriction;
    /**
     * 前公司离职证明
     */
    private String proofOfDepartureOfFormerCompany;
    /**
     * 备注
     */
    private String remarks;

    /**
     * 离职时间
     */
    @ExcelAttribute(sort = 12)
    private String resignationTime;
    /**
     * 离职类型
     */
    @ExcelAttribute(sort = 10)
    private String typeOfTurnover;
    /**
     * 申请离职原因
     */
    @ExcelAttribute(sort = 11)
    private String reasonsForLeaving;

    public EmployeeReportResult(UserCompanyPersonal personal, EmployeeResignation resignation) {
        BeanUtils.copyProperties(personal,this);
        if(resignation != null) {
            BeanUtils.copyProperties(resignation,this);
        }
    }
}
