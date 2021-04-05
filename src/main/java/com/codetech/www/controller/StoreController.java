package com.codetech.www.controller;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createStore(Model model) {
        model.addAttribute("storeNav", "create");

        return "store/store-create";
    }

    @ResponseBody
    @RequestMapping(value = "/storeNameCheck", method = RequestMethod.GET)
    public Map<String, Object> storeNameCheck(@RequestParam("name") String name, HttpServletResponse res) {
        int result = storeService.storeNameCheck(name);

        Map<String, Object> rtn = new HashMap<String, Object>();
        rtn.put("result", result);

        return rtn;
    }

    @RequestMapping(value = "/createAction", method = RequestMethod.POST)
    public String createStoreAction(Store store, Menu menu, HttpServletRequest req,
                                    RedirectAttributes redirectAttributes,
                                    @RequestParam(value = "opening_h_w_start") String opening_h_w_start,
                                    @RequestParam(value = "opening_h_w_end") String opening_h_w_end,
                                    @RequestParam(value = "opening_h_h_start") String opening_h_h_start,
                                    @RequestParam(value = "opening_h_h_end") String opening_h_h_end) throws IOException {

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

        store.setOpening_h_w(opening_h_w_start + "~" + opening_h_w_end);
        store.setOpening_h_h(opening_h_h_start + "~" + opening_h_h_end);

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

        // DB에 저장될 파일명
        String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName;
        logger.info("DB file name : " + fileDBName);

        return fileDBName;
    }
}
