// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package by.conspect.service;

import by.conspect.model.Item;
import by.conspect.service.ItemServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ItemServiceImpl_Roo_Service {
    
    declare @type: ItemServiceImpl: @Service;
    
    declare @type: ItemServiceImpl: @Transactional;
    
    public long ItemServiceImpl.countAllItems() {
        return itemRepository.count();
    }
    
    public void ItemServiceImpl.deleteItem(Item item) {
        itemRepository.delete(item);
    }
    
    public Item ItemServiceImpl.findItem(Long id) {
        return itemRepository.findOne(id);
    }
    
    public List<Item> ItemServiceImpl.findAllItems() {
        return itemRepository.findAll();
    }
    
    public List<Item> ItemServiceImpl.findItemEntries(int firstResult, int maxResults) {
        return itemRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public Item ItemServiceImpl.updateItem(Item item) {
        return itemRepository.save(item);
    }
    
}
