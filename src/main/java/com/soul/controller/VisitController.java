package com.soul.controller;

import com.soul.entity.Linkman;
import com.soul.entity.Visit;
import com.soul.service.CustomerService;
import com.soul.service.LinkmanService;
import com.soul.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/visit")
public class VisitController {

    @Autowired
    private VisitService visitService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private LinkmanService linkmanService;

    @GetMapping(value = "/list")
    public String list(Model model, HttpSession session) {
        if (session.getAttribute("linkman") != null) {
            Visit visit = new Visit();
            visit.setLinkman((Linkman) session.getAttribute("linkman"));
            model.addAttribute("visitList", visitService.query(visit));
        } else {
            model.addAttribute("visitList", visitService.findAll());
        }
        model.addAttribute("customerList", customerService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "visit/list";
    }

    @GetMapping(value = "/toAddPage")
    public String toAddPage(Model model) {
        model.addAttribute("customerList", customerService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "visit/add";
    }

    @PostMapping(value = "/addOrEdit")
    public String addOrEdit(Visit visit,HttpSession session) {
        if (session.getAttribute("linkman") != null) {
            visit.setLinkman((Linkman) session.getAttribute("linkman"));
        }
        visitService.saveOrUpdate(visit);
        return "redirect:/visit/list";
    }

    @GetMapping("/showVisit/{id}")
    public String showVisit(Model model, @PathVariable(value = "id") Integer id) {
        model.addAttribute("visit", visitService.findById(id));
        model.addAttribute("customerList", customerService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "visit/edit";
    }

    @GetMapping(value = "/delete/{id}")
    public String delete(@PathVariable(value = "id") Integer id) {
        visitService.delete(id);
        return "redirect:/visit/list";
    }

    @PostMapping(value = "/find")
    public String find(Visit visit, Model model) {
        model.addAttribute("visitList", visitService.find(visit.getCustomer().getId(), visit.getLinkman().getId()));
        model.addAttribute("customerList", customerService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "visit/list";
    }

    @GetMapping(value = "/toQueryPage")
    public String toQueryPage(Model model) {
        model.addAttribute("customerList", customerService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "query/visitQuery";
    }

    @PostMapping(value = "/query")
    public String query(Visit visit, Model model) {
        model.addAttribute("visitList", visitService.query(visit));
        model.addAttribute("customerList", customerService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "visit/list";
    }
}
