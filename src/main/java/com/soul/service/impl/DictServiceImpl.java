package com.soul.service.impl;

import com.soul.dao.DictDao;
import com.soul.entity.Dict;
import com.soul.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@CacheConfig(cacheNames = "dict")
@Service
@Transactional
public class DictServiceImpl implements DictService {

    @Autowired
    private DictDao dictDao;

    @Autowired
    private CacheManager cacheManager;

    @Override
    @Cacheable(key = "'dictList'")
    public List<Dict> findAll() {
        return dictDao.findAll();
    }

    @Override
    @CacheEvict(key = "'dictList'")
    public void delete(Integer id) {
        dictDao.deleteById(id);
        Objects.requireNonNull(cacheManager.getCache("customer")).evict("customerList");
    }

    @Override
    @CacheEvict(key = "'dictList'")
    public void saveOrUpdate(Dict dict) {
        if (!"".equals(dict.getName())) {
            dictDao.saveAndFlush(dict);
            Objects.requireNonNull(cacheManager.getCache("customer")).evict("customerList");
        }
    }
}
