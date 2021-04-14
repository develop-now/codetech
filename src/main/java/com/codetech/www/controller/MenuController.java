package com.codetech.www.controller;

import com.codetech.www.domain.Menu;
import com.codetech.www.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping(value = "/menu")
public class MenuController {
    private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Value("${saveFolderName}")
    private String saveFolder;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/menu-list-by-owner", method = RequestMethod.GET)
    public ModelAndView getMenuListByOwner(HttpSession session, ModelAndView modelAndView) {
        modelAndView.addObject("storeNav", "menuList");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        Map<String, List<Menu>> list = menuService.getMenuListByOwner(owner_id);
        List<String> storeList = new ArrayList<String>();

        if (list.size() > 0)
            for (String key : list.keySet()) {
                storeList.add(key);
                modelAndView.addObject(key, list.get(key));
            }
        modelAndView.addObject("menuList", list);
        modelAndView.addObject("storeList", storeList);

        modelAndView.setViewName("store/menu-list");

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/menu-list-by-store-ajax", method = RequestMethod.GET)
    public Map<String, Object> getMenuListByStoreAjax(@RequestParam(value = "store_id") int store_id) {
        Map<String, Object> rtn = new HashMap<String, Object>();

        List<Menu> list = menuService.getMenuListByStore(store_id);

        rtn.put("list", list);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @RequestMapping(value = "/menu-list-by-store", method = RequestMethod.GET)
    public String getMenuListByStore(@RequestParam(value = "store_id") int store_id, Model model) {
        List<Menu> list = menuService.getMenuListByStore(store_id);

        return "store/menu-list";
    }

    @RequestMapping(value = "/menu-read", method = RequestMethod.GET)
    public String readMenu(@RequestParam(value = "menu_id") int menu_id, Model model) {
        model.addAttribute("storeNav", "menuRead");

        Menu menu = menuService.readMenu(menu_id);
        model.addAttribute("menu", menu);

        return "store/menu-read";
    }

    @RequestMapping(value = "/menu-create", method = RequestMethod.GET)
    public String createMenu(Model model) {
        model.addAttribute("storeNav", "menuCreate");

        return "store/menu-create";
    }

    @RequestMapping(value = "/createAction", method = RequestMethod.POST)
    public String createMenuAction(Menu menu,
                                   RedirectAttributes redirectAttributes) throws IOException {
        MultipartFile menu_uploadFile = menu.getMenu_image();

        if (!menu_uploadFile.isEmpty()) {
            logger.info("create menu image file process");

            String fileName = menu_uploadFile.getOriginalFilename();
            menu.setMenu_original_image(fileName);

            String fileDBName = fileDBName(fileName, saveFolder);

            menu_uploadFile.transferTo(new File(saveFolder + fileDBName));

            menu.setMenu_saved_image(fileDBName);
        }

        int createResult = menuService.createMenu(menu);

        if (createResult == 1) {
            redirectAttributes.addFlashAttribute("info", "메뉴 생성에 성공했습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "메뉴 생성에 실패했습니다");
        }

        return "redirect:/store/index";
    }

    private String fileDBName(String fileName, String saveFolder) {
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;
        int date = c.get(Calendar.DATE);

        String homeDir = saveFolder + "/" + year + "-" + month + "-" + date;

        logger.info("save home dir : " + homeDir);

        File path1 = new File(homeDir);

        try {
            if (!(path1.exists())) {
                logger.info("before make dir path: " + path1);
                boolean result = path1.mkdirs();
                logger.info("after make dir result: " + result);
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        Random r = new Random();
        int random = r.nextInt(100000000);

        int index = fileName.lastIndexOf(".");

        String fileExtension = fileName.substring(index + 1);
        logger.info("file extension : " + fileExtension);

        String reFileName = "bbs" + year + month + date + random + "." + fileExtension;
        logger.info("re file name : " + reFileName);

        String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName;
        logger.info("DB file name : " + fileDBName);

        return fileDBName;
    }

    @RequestMapping(value = "/menu-update", method = RequestMethod.GET)
    public String updateMenu(@RequestParam(value = "menu_id") int menu_id, Model model) {
        model.addAttribute("storeNav", "menuUpdate");

        Menu menu = menuService.readMenu(menu_id);
        model.addAttribute("menu", menu);

        return "store/menu-update";
    }

    @RequestMapping(value = "/updateAction", method = RequestMethod.POST)
    public String updateMenuAction(Menu menu, RedirectAttributes redirectAttributes,
                                   @RequestParam("image_changed") boolean image_changed) throws IOException {
        if (image_changed) {
            MultipartFile menu_uploadFile = menu.getMenu_image();

            if (!menu_uploadFile.isEmpty()) {
                logger.info("create menu image file process");

                String fileName = menu_uploadFile.getOriginalFilename();
                menu.setMenu_original_image(fileName);

                String fileDBName = fileDBName(fileName, saveFolder);

                menu_uploadFile.transferTo(new File(saveFolder + fileDBName));

                menu.setMenu_saved_image(fileDBName);
            }
        }

        int updateResult = menuService.updateMenu(menu);

        if (updateResult == 1) {
            redirectAttributes.addFlashAttribute("info", "메뉴 수정에 성공했습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "메뉴 수정에 실패했습니다");
        }

        return "redirect:/store/index";
    }

    @RequestMapping(value = "/menu-delete", method = RequestMethod.GET)
    public String deleteMenu(@RequestParam(value = "menu_id") int menu_id, Model model) {
        model.addAttribute("storeNav", "menuDelete");

        return "store/menu-delete";
    }
}
