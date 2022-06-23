package com.ihrm.domain.employee;

import com.ihrm.domain.poi.ExcelAttribute;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 用户工号实体类
 */
@Entity
@Table(name = "bs_user")
@Getter
@Setter
@NoArgsConstructor
public class UserWorkNumber implements Serializable {
    private static final long serialVersionUID = 4297464181093070302L;
    /**
     * ID
     */
    @Id
    private String id;


    /**
     * 工号
     */
    @ExcelAttribute(sort = 3)
    private String workNumber;



}
