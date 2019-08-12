package com.soul.service;

import com.soul.entity.Manager;

import java.util.List;

public interface ManagerService {

    Manager login(String username, String password);

    void saveOrUpdate(Manager user);

    List<Manager> findAll();

    void delete(Integer id);

    List<Manager> find(String realname, String level);
}
