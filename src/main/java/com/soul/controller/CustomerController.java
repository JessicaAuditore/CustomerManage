package com.soul.controller;

import com.soul.entity.Customer;
import com.soul.entity.Dict;
import com.soul.entity.Linkman;
import com.soul.entity.Source;
import com.soul.service.CustomerService;
import com.soul.service.DictService;
import com.soul.service.LinkmanService;
import com.soul.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private LinkmanService linkmanService;

    @Autowired
    private DictService dictService;

    @Autowired
    private SourceService sourceService;

    @GetMapping(value = "/list")
    public String list(Model model, HttpSession session) {
        if (session.getAttribute("linkman") != null) {
            Customer customer = new Customer();
            customer.setLinkman((Linkman) session.getAttribute("linkman"));
            model.addAttribute("customerList", customerService.query(customer));
        } else {
            model.addAttribute("customerList", customerService.findAll());
        }
        model.addAttribute("dictList", dictService.findAll());
        return "customer/list";
    }

    @GetMapping(value = "/listPage")
    public String listPage(Model model, @PageableDefault(size = 3) Pageable pageable) {
        model.addAttribute("page", customerService.findAll(pageable));
        model.addAttribute("dictList", dictService.findAll());
        return "customer/listPage";
    }

    @GetMapping(value = "/toAddPage")
    public String toAddPage(Model model) {
        model.addAttribute("linkmanList", linkmanService.findAll());
        model.addAttribute("dictList", dictService.findAll());
        model.addAttribute("sourceList", sourceService.findAll());
        return "customer/add";
    }

    @PostMapping(value = "/addOrEdit")
    public String addOrEdit(Customer customer, HttpSession session) {
        if (session.getAttribute("linkman") != null) {
            customer.setLinkman((Linkman) session.getAttribute("linkman"));
        }
        customerService.saveOrUpdate(customer);
        return "redirect:/customer/list";
    }

    @GetMapping("/showCustomer/{id}")
    public String showCustomer(Model model, @PathVariable(value = "id") Integer id) {
        model.addAttribute("customer", customerService.findById(id));
        model.addAttribute("dictList", dictService.findAll());
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "customer/edit";
    }

    @GetMapping(value = "/delete/{id}")
    public String delete(@PathVariable(value = "id") Integer id) {
        customerService.delete(id);
        return "redirect:/customer/list";
    }

    @PostMapping(value = "/find")
    public String find(Customer customer, Model model) {
        model.addAttribute("customerList", customerService.find(customer.getName(), customer.getDict().getId()));
        model.addAttribute("dictList", dictService.findAll());
        return "customer/list";
    }

    @GetMapping(value = "/countLevel")
    public String countLevel(Model model) {
        model.addAttribute("list", customerService.findCountLevel());
        return "customer/listLevel";
    }

    @GetMapping(value = "/countSource")
    public String countSource(Model model) {
        model.addAttribute("list", customerService.findCountSource());
        return "customer/listSource";
    }

    @GetMapping(value = "/dataDirectory")
    public String dataDirectory(Model model) {
        model.addAttribute("dictList", dictService.findAll());
        model.addAttribute("sourceList", sourceService.findAll());
        return "customer/dataDirectory";
    }

    @GetMapping(value = "/dict/delete/{id}")
    public String dictDelete(@PathVariable Integer id) {
        dictService.delete(id);
        return "redirect:/customer/dataDirectory";
    }

    @ResponseBody
    @PostMapping(value = "/dict/edit")
    public Dict dictEdit(Dict dict) {
        dictService.saveOrUpdate(dict);
        return dict;
    }

    @PostMapping(value = "/dict/add")
    public String dictAdd(Dict dict) {
        dictService.saveOrUpdate(dict);
        return "redirect:/customer/dataDirectory";
    }

    @GetMapping(value = "/source/delete/{id}")
    public String sourceDelete(@PathVariable Integer id) {
        sourceService.delete(id);
        return "redirect:/customer/dataDirectory";
    }

    @ResponseBody
    @PostMapping(value = "/source/edit")
    public Source sourceEdit(Source source) {
        sourceService.saveOrUpdate(source);
        return source;
    }

    @PostMapping(value = "/source/add")
    public String sourceAdd(Source source) {
        sourceService.saveOrUpdate(source);
        return "redirect:/customer/dataDirectory";
    }

    @GetMapping(value = "/toQueryPage")
    public String toQueryPage(Model model) {
        model.addAttribute("linkmanList", linkmanService.findAll());
        model.addAttribute("sourceList", sourceService.findAll());
        model.addAttribute("dictList", dictService.findAll());
        return "query/customerQuery";
    }

    @PostMapping(value = "/query")
    public String query(Customer customer, Model model) {
        model.addAttribute("customerList", customerService.query(customer));
        model.addAttribute("dictList", dictService.findAll());
        return "customer/list";
    }
}