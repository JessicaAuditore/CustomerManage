package com.soul.service;

import com.soul.entity.Source;

import java.util.List;

public interface SourceService {

    List<Source> findAll();

    void delete(Integer id);

    void saveOrUpdate(Source source);
}
