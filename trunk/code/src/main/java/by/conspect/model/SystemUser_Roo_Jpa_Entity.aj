// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package by.conspect.model;

import by.conspect.model.SystemUser;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect SystemUser_Roo_Jpa_Entity {
    
    declare @type: SystemUser: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long SystemUser.id;
    
    @Version
    @Column(name = "version")
    private Integer SystemUser.version;
    
    public Long SystemUser.getId() {
        return this.id;
    }
    
    public void SystemUser.setId(Long id) {
        this.id = id;
    }
    
    public Integer SystemUser.getVersion() {
        return this.version;
    }
    
    public void SystemUser.setVersion(Integer version) {
        this.version = version;
    }
    
}