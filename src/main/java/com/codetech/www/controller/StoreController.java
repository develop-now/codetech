package com.codetech.www.controller;

import com.codetech.www.domain.*;
import com.codetech.www.service.StaffService;
import com.codetech.www.service.StoreService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
    private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

    @Value("${saveFolderName}")
    private String saveFolder;

    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "store/index";
    }

    @RequestMapping(value = "/store-list", method = RequestMethod.GET)
    public String getStoreList(Model model, HttpSession session) {
        model.addAttribute("storeNav", "storeList");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("list", list);

        return "store/store-list";
    }

    @ResponseBody
    @RequestMapping(value = "/store-list-ajax", method = RequestMethod.GET)
    public Map<String, Object> getStoreListAjax(HttpSession session) {

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("list", list);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @RequestMapping(value = "/store-read", method = RequestMethod.GET)
    public String readStore(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "storeRead");

        Store store = storeService.readStore(store_id);
        model.addAttribute("store", store);
        return "store/store-read";
    }

    @RequestMapping(value = "/store-update", method = RequestMethod.GET)
    public String updateStore(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "storeUpdate");

        Store store = storeService.readStore(store_id);
        model.addAttribute("store", store);
        return "store/store-update";
    }

    @RequestMapping(value = "/updateAction", method = RequestMethod.POST)
    public String updateStoreAction(Store store, RedirectAttributes redirectAttributes,
                                    @RequestParam("image_changed") boolean image_changed) throws IOException {

        if (image_changed) {
            MultipartFile store_uploadFile = store.getStore_image();

            logger.info("update store image file process");
            String fileName = store_uploadFile.getOriginalFilename();
            store.setStore_original_image(fileName);

            String fileDBName = fileDBName(fileName, saveFolder);

            store_uploadFile.transferTo(new File(saveFolder + fileDBName));

            store.setStore_saved_image(fileDBName);
        }

        int updateResult = storeService.updateStore(store);

        if (updateResult == 1) {
            redirectAttributes.addFlashAttribute("info", "가게정보 수정에 성공했습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "가게정보 수정에 실패했습니다");
        }

        return "redirect:/store/index";
    }

    @ResponseBody
    @RequestMapping(value = "/store-status-change-ajax", method = RequestMethod.GET)
    public Map<String, Object> deleteStore(@RequestParam(value = "store_id") int store_id,
                                           @RequestParam(value = "status_value") String status_value, Model model) {
        model.addAttribute("storeNav", "storeDelete");

        int result = storeService.storeStatusChange(store_id, status_value);

        Map<String, Object> rtn = new HashMap<String, Object>();
        rtn.put("success", result > 0);
        rtn.put("result", result);

        return rtn;
    }

    @ResponseBody
    @RequestMapping(value = "/storeNameCheck", method = RequestMethod.GET)
    public Map<String, Object> storeNameCheck(@RequestParam("name") String name) {
        int result = storeService.storeNameCheck(name);

        Map<String, Object> rtn = new HashMap<String, Object>();
        rtn.put("result", result);

        return rtn;
    }

    @RequestMapping(value = "/store-create", method = RequestMethod.GET)
    public String createStore(Model model) {
        model.addAttribute("storeNav", "storeCreate");

        return "store/store-create";
    }

    @RequestMapping(value = "/createAction", method = RequestMethod.POST)
    public String createStoreAction(Store store, Menu menu,
                                    RedirectAttributes redirectAttributes) throws IOException {

        MultipartFile store_uploadFile = store.getStore_image();
        MultipartFile menu_uploadFile = menu.getMenu_image();

        logger.info("create store action called");

        if (!store_uploadFile.isEmpty()) {
            logger.info("create store image file process");
            String fileName = store_uploadFile.getOriginalFilename();
            store.setStore_original_image(fileName);

            String fileDBName = fileDBName(fileName, saveFolder);

            store_uploadFile.transferTo(new File(saveFolder + fileDBName));

            store.setStore_saved_image(fileDBName);
        }

        if (!menu_uploadFile.isEmpty()) {
            logger.info("create menu image file process");

            String fileName = menu_uploadFile.getOriginalFilename();
            menu.setMenu_original_image(fileName);

            String fileDBName = fileDBName(fileName, saveFolder);

            menu_uploadFile.transferTo(new File(saveFolder + fileDBName));

            menu.setMenu_saved_image(fileDBName);
        }

        int createResult = storeService.createStore(store, menu);

        if (createResult == 1) {
            redirectAttributes.addFlashAttribute("info", "가게 생성에 성공했습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "가게 생성에 실패했습니다");
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

    @RequestMapping(value = "/store-profit", method = RequestMethod.GET)
    public String getStoreProfit(HttpSession session, Model model) {
        model.addAttribute("storeNav", "storeProfit");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("store_list", list);

        return "store/store-profit";
    }

    @RequestMapping(value = "/store-comment", method = RequestMethod.GET)
    public String getStoreCommentList(HttpSession session, Model model) {
        model.addAttribute("storeNav", "storeComment");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("store_list", list);

        return "store/comment-list";
    }

    @RequestMapping(value = "/store-staff", method = RequestMethod.GET)
    public String getStoreStaff(HttpSession session, Model model) {
        model.addAttribute("storeNav", "storeStaff");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("store_list", list);

        return "store/store-staff";
    }

    @RequestMapping(value = "/store-customers", method = RequestMethod.GET)
    public String getStoreCustomers(HttpSession session, Model model) {
        model.addAttribute("storeNav", "storeCustomer");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("store_list", list);

        return "store/store-customers";
    }

    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public String getOrderList(HttpSession session, Model model) {
        model.addAttribute("storeNav", "orderList");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("store_list", list);

        return "store/order-list";
    }

    @RequestMapping(value = "/menu-list", method = RequestMethod.GET)
    public String getMenuList(HttpSession session, Model model) {
        model.addAttribute("storeNav", "menuList");

        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Store> list = storeService.getStoreListByOwner(owner_id);
        model.addAttribute("store_list", list);

        return "store/menu-list";
    }
}
