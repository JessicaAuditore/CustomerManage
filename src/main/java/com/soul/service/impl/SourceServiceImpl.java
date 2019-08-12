package com.soul.service.impl;

import com.soul.dao.SourceDao;
import com.soul.entity.Source;
import com.soul.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@CacheConfig(cacheNames = "source")
@Service
@Transactional
public class SourceServiceImpl implements SourceService {

    @Autowired
    private SourceDao sourceDao;

    @Autowired
    private CacheManager cacheManager;

    @Override
    @Cacheable(key = "'sourceList'")
    public List<Source> findAll() {
        return sourceDao.findAll();
    }

    @Override
    @CacheEvict(key = "'sourceList'")
    public void delete(Integer id) {
        sourceDao.deleteById(id);
        Objects.requireNonNull(cacheManager.getCache("customer")).evict("customerList");
    }

    @Override
    @CacheEvict(key = "'sourceList'")
    public void saveOrUpdate(Source source) {
        if (!"".equals(source.getName())) {
            sourceDao.saveAndFlush(source);
            Objects.requireNonNull(cacheManager.getCache("customer")).evict("customerList");
        }
    }
}
