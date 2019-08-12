package com.soul.controller;

import com.soul.entity.Manager;
import com.soul.service.ManagerService;
import com.soul.service.impl.ManagerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @GetMapping(value = "/login")
    public String login() {
        return "manager/login";
    }

    @PostMapping(value = "/loginHandle")
    public String loginHandle(Model model, HttpSession session, @RequestParam("user_name") String name, @RequestParam("user_password") String password) {
        if ("".equals(name)) {
            model.addAttribute("state", "用户名不为空");
            return "manager/login";
        } else if ("".equals(password)) {
            model.addAttribute("state", "密码不为空");
            return "manager/login";
        } else {
            Manager manager = managerService.login(name, password);
            if (manager == null) {
                model.addAttribute("state", "用户不存在");
                return "manager/login";
            } else if (manager.equals(new Manager())) {
                model.addAttribute("state", "密码错误");
                return "manager/login";
            } else {
                session.setAttribute("manager", manager);
                return "index";
            }
        }
    }

    @GetMapping(value = "/exit")
    public String exit(HttpSession session) {
        session.removeAttribute("manager");
        session.removeAttribute("state");
        return "manager/login";
    }

    @GetMapping(value = "/toModifyPage")
    public String toModifyPage() {
        return "manager/modify";
    }

    @PostMapping(value = "/modify")
    public String modify(Model model, HttpSession session, @RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword, @RequestParam("repeatPassword") String repeatPassword) {
        Manager manager = (Manager) session.getAttribute("manager");
        if (!manager.getPassword().equals(oldPassword)) {
            model.addAttribute("error", "原密码错误");
            return "manager/state/error";
        }
        if (!newPassword.equals(repeatPassword)) {
            model.addAttribute("error", "两次输入密码不同");
            return "manager/state/error";
        }
        if (oldPassword.equals(newPassword)) {
            model.addAttribute("error", "新密码与原密码相同");
            return "manager/state/error";
        }
        manager.setPassword(newPassword);
        managerService.saveOrUpdate(manager);
        session.setAttribute("manager", manager);
        return "manager/state/success";
    }

    @GetMapping(value = "/list")
    public String list(Model model) {
        model.addAttribute("managerList", managerService.findAll());
        return "manager/list";
    }

    @GetMapping(value = "/delete/{id}")
    public String delete(@PathVariable Integer id) {
        managerService.delete(id);
        return "redirect:/manager/list";
    }

    @ResponseBody
    @PostMapping(value = "/edit")
    public Manager edit(Manager manager) {
        managerService.saveOrUpdate(manager);
        return manager;
    }

    @PostMapping(value = "/find")
    public String find(Manager manager, Model model) {
        model.addAttribute("managerList", managerService.find(manager.getRealname(), manager.getLevel()));
        return "manager/list";
    }
}
