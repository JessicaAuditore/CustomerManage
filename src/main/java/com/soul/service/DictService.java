package com.soul.service;

import com.soul.entity.Dict;

import java.util.List;

public interface DictService {

    List<Dict> findAll();

    void delete(Integer id);

    void saveOrUpdate(Dict dict);
}
