package by.conspect.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class SystemUser {

	@NotNull
    @Size(max = 500)
    private String email;
	
	@NotNull
	@Size(max = 500)
	private String userRole;
	
	public SystemUser() {
		
	}
	
	public SystemUser(String email, String userRole) {
		this.email = email;
		this.userRole = userRole;
	}
    
}
