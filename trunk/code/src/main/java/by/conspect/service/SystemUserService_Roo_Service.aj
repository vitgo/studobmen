// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package by.conspect.service;

import by.conspect.model.SystemUser;
import by.conspect.service.SystemUserService;
import java.util.List;

privileged aspect SystemUserService_Roo_Service {
    
    public abstract long SystemUserService.countAllSystemUsers();    
    public abstract void SystemUserService.deleteSystemUser(SystemUser systemUser);    
    public abstract SystemUser SystemUserService.findSystemUser(Long id);    
    public abstract List<SystemUser> SystemUserService.findAllSystemUsers();    
    public abstract List<SystemUser> SystemUserService.findSystemUserEntries(int firstResult, int maxResults);    
    public abstract void SystemUserService.saveSystemUser(SystemUser systemUser);    
    public abstract SystemUser SystemUserService.updateSystemUser(SystemUser systemUser);    
}
