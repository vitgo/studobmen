package by.conspect.model;

import java.util.Date;

import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Item {

    @NotNull
    @Size(min = 1, max = 2000)
    private String discipline;

    @NotNull
    @Size(min = 1, max = 2000)
    private String type;
    
    private boolean isElectronic;

    @NotNull
    @Size(min = 1, max = 4000)
    private String ei;

    @NotNull
    @Size(min = 1, max = 2000)
    private String teacher;

    @Size(max = 4000)
    private String description;
    
    @NotNull
    @Size(min = 1, max = 4000)
    private String price;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    private Date publishDate;

    @NotNull
    @Size(min = 1, max = 500)
    private String status;

    @ManyToOne
    private SystemUser owner;
}
