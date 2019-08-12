package com.soul.controller;

import com.soul.entity.Linkman;
import com.soul.service.LinkmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/linkman")
public class LinkmanController {

    @Autowired
    private LinkmanService linkmanService;

    @GetMapping(value = "/login")
    public String login(){
        return "linkman/login";
    }

    @PostMapping(value = "/loginHandle")
    public String loginHandle(Model model, HttpSession session, @RequestParam("user_name") String name, @RequestParam("user_password") String password) {
        if ("".equals(name)) {
            model.addAttribute("state", "用户名不为空");
            return "linkman/login";
        } else if ("".equals(password)) {
            model.addAttribute("state", "密码不为空");
            return "linkman/login";
        } else {
            Linkman linkman = linkmanService.login(name, password);
            if (linkman == null) {
                model.addAttribute("state", "用户不存在");
                return "linkman/login";
            } else if (linkman.equals(new Linkman())) {
                model.addAttribute("state", "密码错误");
                return "linkman/login";
            } else {
                session.setAttribute("linkman", linkman);
                return "index";
            }
        }
    }

    @GetMapping(value = "/toModifyPage")
    public String toModifyPage() {
        return "linkman/modify";
    }

    @PostMapping(value = "/modify")
    public String modify(Model model, HttpSession session, @RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword, @RequestParam("repeatPassword") String repeatPassword) {
        Linkman linkman = (Linkman) session.getAttribute("linkman");
        if (!linkman.getPassword().equals(oldPassword)) {
            model.addAttribute("error", "原密码错误");
            return "user/state/error";
        }
        if (!newPassword.equals(repeatPassword)) {
            model.addAttribute("error", "两次输入密码不同");
            return "user/state/error";
        }
        if (oldPassword.equals(newPassword)) {
            model.addAttribute("error", "新密码与原密码相同");
            return "user/state/error";
        }
        linkman.setPassword(newPassword);
        linkmanService.saveOrUpdate(linkman);
        session.setAttribute("linkman", linkman);
        return "user/state/success";
    }

    @GetMapping(value = "/exit")
    public String exit(HttpSession session) {
        session.removeAttribute("linkman");
        session.removeAttribute("state");
        return "user/login";
    }

    @GetMapping(value = "/list")
    public String list(Model model) {
        model.addAttribute("linkmanList", linkmanService.findAll());
        return "linkman/list";
    }

    @GetMapping(value = "/toAddPage")
    public String toAddPage(Model model) {
        return "linkman/add";
    }

    @PostMapping(value = "/addOrEdit")
    public String addOrEdit(Linkman linkman) {
        linkmanService.saveOrUpdate(linkman);
        return "redirect:/linkman/list";
    }

    @GetMapping("/showLinkman/{id}")
    public String showLinkman(Model model, @PathVariable(value = "id") Integer id) {
        model.addAttribute("linkman", linkmanService.findById(id));
        return "linkman/edit";
    }

    @GetMapping(value = "/delete/{id}")
    public String delete(@PathVariable(value = "id") Integer id) {
        linkmanService.delete(id);
        return "redirect:/linkman/list";
    }

    @PostMapping(value = "/find")
    public String find(Linkman linkman, Model model) {
        model.addAttribute("linkmanList", linkmanService.find(linkman.getName()));
        return "linkman/list";
    }

    @GetMapping(value = "/toQueryPage")
    public String toQueryPage() {
        return "query/linkmanQuery";
    }

    @PostMapping(value = "/query")
    public String query(Linkman linkman, Model model) {
        model.addAttribute("linkmanList", linkmanService.query(linkman));
        return "linkman/list";
    }
}
