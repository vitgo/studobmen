package by.conspect.web;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import by.conspect.model.Item;
import by.conspect.model.SystemUser;
import by.conspect.service.ItemService;

@RequestMapping("/items")
@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html;charset=UTF-8;charset=UTF-8")
    public String create(@Valid Item item, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, item);
            return "items/create";
        }
        uiModel.asMap().clear();
        itemService.saveItem(item);
        return "redirect:/items/search/" + encodeUrlPathSegment(item.getDiscipline(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html;charset=UTF-8")
    public String createForm(Model uiModel) {
		Item item = new Item();
		item.setStatus(ItemService.ACTIVE_STATUS);
		item.setPublishDate(new Date());
		item.setOwner(new SystemUser());
        populateEditForm(uiModel, item);
        return "items/create";
    }
	
	@RequestMapping(value = "/search/{term}", produces = "text/html;charset=UTF-8")
	public String show(@PathVariable String term, Model uiModel) {
		List<Item> items = itemService.findItemsByDisciplineLikeOrTeacherLike(term);
		uiModel.addAttribute("items", items);
		uiModel.addAttribute("term", term);
		return "items/list";
	}

	@RequestMapping(value = "/{id}.json", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody Item showItem(@PathVariable("id") Long id) {
		Item item = itemService.findItem(id);
		item.getOwner().setEmail("");
		return item;
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.POST)
    public String getItem(@RequestParam("id") Long id,
    		Model uiModel) {
		Item item = itemService.findItem(id);
		uiModel.addAttribute("itemType", item.getType());
		uiModel.addAttribute("itemId", id);
		return "items/get";
    }
	
	@RequestMapping(value = "/congradulations", method = RequestMethod.POST)
    public String congradulation(@RequestParam("itemId") Long id, 
    		@RequestParam("userEmail") String userEmail,
    		Model uiModel,
    		RedirectAttributes redirectAttrs) {
		String target;
		Item item = itemService.getItem(id, userEmail);
		if(item != null) {
			uiModel.addAttribute("item", item);
			uiModel.addAttribute("userEmail", userEmail);
			target = "items/congradulations";
		} else {
			target = "error";
		}
		return target;
    }
	
	/*
	@RequestMapping(value = "/{id}", produces = "text/html;charset=UTF-8")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("item", itemService.findItem(id));
        uiModel.addAttribute("itemId", id);
        return "items/show";
    }

	@RequestMapping(produces = "text/html;charset=UTF-8")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("items", itemService.findItemEntries(firstResult, sizeNo));
            float nrOfPages = (float) itemService.countAllItems() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("items", itemService.findAllItems());
        }
        addDateTimeFormatPatterns(uiModel);
        return "items/list";
    }
    

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html;charset=UTF-8")
    public String update(@Valid Item item, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, item);
            return "items/update";
        }
        uiModel.asMap().clear();
        itemService.updateItem(item);
        return "redirect:/items/" + encodeUrlPathSegment(item.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html;charset=UTF-8")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, itemService.findItem(id));
        return "items/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html;charset=UTF-8")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Item item = itemService.findItem(id);
        itemService.deleteItem(item);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/items";
    }
    
    */

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("item_publishdate_date_format", "dd.MM.yyyy");
    }

	void populateEditForm(Model uiModel, Item item) {
        uiModel.addAttribute("item", item);
        addDateTimeFormatPatterns(uiModel);
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}
