package by.conspect.service;

import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { by.conspect.model.SystemUser.class })
public interface SystemUserService {
	public String PUBLISHER_ROLE = "publisher";
	public String CLIENT_ROLE = "client";
}
