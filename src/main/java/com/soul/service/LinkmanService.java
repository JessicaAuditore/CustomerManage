package com.soul.service;

import com.soul.entity.Linkman;

import java.util.List;

public interface LinkmanService {

    List<Linkman> findAll();

    Linkman saveOrUpdate(Linkman linkman);

    Linkman findById(Integer id);

    void delete(Integer id);

    List<Linkman> find(String name);

    List<Linkman> query(Linkman linkman);

    Linkman login(String name, String password);
}
