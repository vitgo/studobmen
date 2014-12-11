package by.conspect.service;

import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import by.conspect.model.Item;

@RooService(domainTypes = { by.conspect.model.Item.class })
public interface ItemService {
	public static final String ACTIVE_STATUS = "active";
	public static final String COMPLETED_STATUS = "completed";
	
	public List<Item> findItemsByDisciplineLikeOrTeacherLike(String term);
	
	public Item getItem(Long id, String email);
	
}
