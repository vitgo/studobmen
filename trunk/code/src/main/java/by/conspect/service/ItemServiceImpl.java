package by.conspect.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import by.conspect.db.ItemRepository;
import by.conspect.db.SystemUserRepository;
import by.conspect.model.Item;
import by.conspect.model.SystemUser;

public class ItemServiceImpl implements ItemService {
	private static final Logger logger = Logger.getLogger(ItemServiceImpl.class);
	
	@Autowired
	private ItemRepository itemRepository;
	
	@Autowired
	private SystemUserRepository systemUserRepository;
	
	@Autowired
	private MailService mailService;
	
	public List<Item> findItemsByDisciplineLikeOrTeacherLike(String term) {
		return itemRepository.findItemsByDisciplineLikeOrTeacherLike("%" + term + "%");
	}

	public void saveItem(Item item) {
		SystemUser owner = item.getOwner();
		if(systemUserRepository.findSystemUsersByEmailEqualsAndUserRoleEquals(owner.getEmail(), SystemUserService.PUBLISHER_ROLE).isEmpty()) {
			owner.setUserRole(SystemUserService.PUBLISHER_ROLE);
			systemUserRepository.save(owner);
		}
        itemRepository.save(item);
    }
	
	public Item getItem(Long id, String email) {
		if(systemUserRepository.findSystemUsersByEmailEqualsAndUserRoleEquals(email, SystemUserService.CLIENT_ROLE).isEmpty()) {
			SystemUser user = new SystemUser(email, SystemUserService.CLIENT_ROLE);
			systemUserRepository.save(user);
		}
		
		Item item = itemRepository.findOne(id);
		
		StringBuilder subject = new StringBuilder();
		subject.append("Ordered \"");
		subject.append(item.getType());
		subject.append("\" owners contacts");
		
		StringBuilder text = new StringBuilder();
		text.append("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /></head><body><p>\u0418\u043D\u0444\u043E\u0440\u043C\u0430\u0446\u0438\u044F \u043E\u0442 <span style=\"font-size:12px;\"><cite>&nbsp;<a href=\"http://conspect.j.rsnx.ru/conspects/\">Conspects.ru</a></cite></span></p>");
		text.append("<p><span style=\"font-size:16px;\">\u0412\u044B \u043E\u0431\u043C\u0435\u043D\u044F\u043B\u0438 &quot;");
		text.append(item.getPrice());
		text.append("&quot; \u043D\u0430 &quot;");
		text.append(item.getType());
		text.append("&quot; (");
		text.append(item.getDescription());
		text.append(").</span></p><p>\u0427\u0442\u043E\u0431\u044B \u043F\u043E\u043B\u0443\u0447\u0438\u0442\u044C &quot;");
		text.append(item.getType());
		text.append("&quot; \u0441\u0432\u044F\u0436\u0438\u0442\u0435\u0441\u044C \u0441 \u0445\u043E\u0437\u044F\u0438\u043D\u043E\u043C \u043F\u043E \u0430\u0434\u0440\u0435\u0441\u0443: <a href=\"mailto:");
		text.append(item.getOwner().getEmail());
		text.append("?subject=%D0%A8%D0%BF%D0%BE%D1%80%D1%8B&amp;body=%D0%AF%20%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%20%D0%B7%D0%B0%20%D1%88%D0%BF%D0%BE%D1%80%D1%8B%20%D0%BE%D1%82%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BF%D0%B8%D0%B2%D0%BE.%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BC%D1%8B%20%D1%81%D0%BC%D0%BE%D0%B6%D0%B5%D0%BC%20%D1%8D%D1%82%D0%BE%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%3F\">mail@mail.ru</a></p>");
		text.append("<p>\u0422\u043E, \u0447\u0442\u043E \u0432\u044B \u043F\u043E\u043B\u0443\u0447\u0438\u0442\u0435, \u0438\u043C\u0435\u0435\u0442 \u043E\u0442\u043D\u043E\u0448\u0435\u043D\u0438\u0435 \u043A: ");
		text.append(item.getDiscipline());
		text.append(", ");
		text.append(item.getTeacher());
		text.append(", ");
		text.append(item.getEi());
		text.append(".</p></body></html>");
		
		try {
			mailService.sendMail(MailServiceImpl.FROM_ADDRESS, email, subject.toString(), text.toString());
			
			if(!item.isIsElectronic()) {
				item.setStatus(COMPLETED_STATUS);
				itemRepository.save(item);
			}
		} catch (Exception e) {
			logger.error(e);
			item = null;
		}
		return item;
	}
}
