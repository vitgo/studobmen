package by.conspect.db;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.transaction.annotation.Transactional;

import by.conspect.model.SystemUser;

@RooJpaRepository(domainType = SystemUser.class)
public interface SystemUserRepository {
	
	@Query("select u from SystemUser as u where u.email=:email and u.userRole=:role")
	@Transactional(readOnly = true)
	public List<SystemUser> findSystemUsersByEmailEqualsAndUserRoleEquals(@Param("email") String email, @Param("role") String role);
}
