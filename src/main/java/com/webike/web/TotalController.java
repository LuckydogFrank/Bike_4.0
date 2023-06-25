package com.webike.web;

import com.webike.dto.Total;
import com.webike.service.TotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("total")
public class TotalController {
    @Autowired
    private TotalService totalService;


    @RequestMapping("/totalManage")
    public String totalMange(Model model){
        Total totalBean = totalService.getTotalBean();
        model.addAttribute("total",totalBean);
        return "total";
    }



}
