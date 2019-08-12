package com.soul.service;

import com.soul.entity.Visit;

import java.util.List;

public interface VisitService {

    List<Visit> findAll();

    Visit saveOrUpdate(Visit visit);

    Visit findById(Integer id);

    void delete(Integer id);

    List<Visit> find(Integer id1, Integer id2);

    List<Visit> query(Visit visit);
}
