package by.conspect.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/systemusers")
@Controller
public class SystemUserController {

	/*
	@Autowired
    SystemUserService systemUserService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid SystemUser systemUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, systemUser);
            return "systemusers/create";
        }
        uiModel.asMap().clear();
        systemUserService.saveSystemUser(systemUser);
        return "redirect:/systemusers/" + encodeUrlPathSegment(systemUser.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new SystemUser());
        return "systemusers/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("systemuser", systemUserService.findSystemUser(id));
        uiModel.addAttribute("itemId", id);
        return "systemusers/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("systemusers", systemUserService.findSystemUserEntries(firstResult, sizeNo));
            float nrOfPages = (float) systemUserService.countAllSystemUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("systemusers", systemUserService.findAllSystemUsers());
        }
        return "systemusers/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid SystemUser systemUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, systemUser);
            return "systemusers/update";
        }
        uiModel.asMap().clear();
        systemUserService.updateSystemUser(systemUser);
        return "redirect:/systemusers/" + encodeUrlPathSegment(systemUser.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, systemUserService.findSystemUser(id));
        return "systemusers/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SystemUser systemUser = systemUserService.findSystemUser(id);
        systemUserService.deleteSystemUser(systemUser);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/systemusers";
    }

	void populateEditForm(Model uiModel, SystemUser systemUser) {
        uiModel.addAttribute("systemUser", systemUser);
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
    */
}
