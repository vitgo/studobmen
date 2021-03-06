// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package by.conspect.model;

import by.conspect.db.ItemRepository;
import by.conspect.model.Item;
import by.conspect.model.ItemDataOnDemand;
import by.conspect.model.SystemUserDataOnDemand;
import by.conspect.service.ItemService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ItemDataOnDemand: @Component;
    
    private Random ItemDataOnDemand.rnd = new SecureRandom();
    
    private List<Item> ItemDataOnDemand.data;
    
    @Autowired
    private SystemUserDataOnDemand ItemDataOnDemand.systemUserDataOnDemand;
    
    @Autowired
    ItemService ItemDataOnDemand.itemService;
    
    @Autowired
    ItemRepository ItemDataOnDemand.itemRepository;
    
    public Item ItemDataOnDemand.getNewTransientItem(int index) {
        Item obj = new Item();
        setDescription(obj, index);
        setDiscipline(obj, index);
        setEi(obj, index);
        setIsElectronic(obj, index);
        setPrice(obj, index);
        setPublishDate(obj, index);
        setStatus(obj, index);
        setTeacher(obj, index);
        setType(obj, index);
        return obj;
    }
    
    public void ItemDataOnDemand.setDescription(Item obj, int index) {
        String description = "description_" + index;
        if (description.length() > 4000) {
            description = description.substring(0, 4000);
        }
        obj.setDescription(description);
    }
    
    public void ItemDataOnDemand.setDiscipline(Item obj, int index) {
        String discipline = "discipline_" + index;
        if (discipline.length() > 2000) {
            discipline = discipline.substring(0, 2000);
        }
        obj.setDiscipline(discipline);
    }
    
    public void ItemDataOnDemand.setEi(Item obj, int index) {
        String ei = "ei_" + index;
        if (ei.length() > 4000) {
            ei = ei.substring(0, 4000);
        }
        obj.setEi(ei);
    }
    
    public void ItemDataOnDemand.setIsElectronic(Item obj, int index) {
        Boolean isElectronic = true;
        obj.setIsElectronic(isElectronic);
    }
    
    public void ItemDataOnDemand.setPrice(Item obj, int index) {
        String price = "price_" + index;
        if (price.length() > 4000) {
            price = price.substring(0, 4000);
        }
        obj.setPrice(price);
    }
    
    public void ItemDataOnDemand.setPublishDate(Item obj, int index) {
        Date publishDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setPublishDate(publishDate);
    }
    
    public void ItemDataOnDemand.setStatus(Item obj, int index) {
        String status = "status_" + index;
        if (status.length() > 500) {
            status = status.substring(0, 500);
        }
        obj.setStatus(status);
    }
    
    public void ItemDataOnDemand.setTeacher(Item obj, int index) {
        String teacher = "teacher_" + index;
        if (teacher.length() > 2000) {
            teacher = teacher.substring(0, 2000);
        }
        obj.setTeacher(teacher);
    }
    
    public void ItemDataOnDemand.setType(Item obj, int index) {
        String type = "type_" + index;
        if (type.length() > 2000) {
            type = type.substring(0, 2000);
        }
        obj.setType(type);
    }
    
    public Item ItemDataOnDemand.getSpecificItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Item obj = data.get(index);
        Long id = obj.getId();
        return itemService.findItem(id);
    }
    
    public Item ItemDataOnDemand.getRandomItem() {
        init();
        Item obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return itemService.findItem(id);
    }
    
    public boolean ItemDataOnDemand.modifyItem(Item obj) {
        return false;
    }
    
    public void ItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = itemService.findItemEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Item' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Item>();
        for (int i = 0; i < 10; i++) {
            Item obj = getNewTransientItem(i);
            try {
                itemService.saveItem(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            itemRepository.flush();
            data.add(obj);
        }
    }
    
}
