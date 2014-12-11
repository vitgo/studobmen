package by.conspect.db;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.transaction.annotation.Transactional;

import by.conspect.model.Item;

@RooJpaRepository(domainType = Item.class)
public interface ItemRepository {
	
	@Query("select i from Item as i where (i.discipline like :term or i.teacher like :term) and i.status='active'")
	@Transactional(readOnly = true)
	public List<Item> findItemsByDisciplineLikeOrTeacherLike(@Param("term") String term);
	
}
