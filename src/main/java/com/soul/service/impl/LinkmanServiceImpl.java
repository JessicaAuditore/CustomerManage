package com.soul.service.impl;

import com.soul.component.Tool;
import com.soul.dao.LinkmanDao;
import com.soul.entity.Linkman;
import com.soul.service.LinkmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.*;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@CacheConfig(cacheNames = "linkman")
@Service
@Transactional
public class LinkmanServiceImpl implements LinkmanService {

    @Autowired
    private LinkmanDao linkmanDao;

    @Override
    public Linkman login(String name, String password) {
        List<Linkman> linkmen = linkmanDao.findAllByName(name);
        if (linkmen.size() == 0) {
            return null;
        } else {
            Linkman linkman = linkmen.get(0);
            if (linkman.getPassword().equals(password)) {
                return linkman;
            } else {
                return new Linkman();
            }
        }
    }

    @Override
    @Cacheable(key = "'linkmanList'")
    public List<Linkman> findAll() {
        return linkmanDao.findAll();
    }

    @Override
    @Cacheable(key = "'id:'+#id")
    public Linkman findById(Integer id) {
        return linkmanDao.findAllById(id);
    }

    @Override
    @Caching(
            put = {
                    @CachePut(key = "'id:'+#linkman.id")
            },
            evict = {
                    @CacheEvict(key = "'linkmanList'")
            }
    )
    public Linkman saveOrUpdate(Linkman linkman) {
        return linkmanDao.saveAndFlush(linkman);
    }

    @Override
    @Caching(
            evict = {
                    @CacheEvict(key = "'id:'+#id"),
                    @CacheEvict(key = "'linkmanList'")
            }
    )
    public void delete(Integer id) {
        linkmanDao.deleteById(id);
    }

    @Override
    public List<Linkman> find(String name) {
        if (Objects.equals(name, "")) {
            return linkmanDao.findAll();
        } else {
            return linkmanDao.findAllByNameLike(name);
        }
    }

    @Override
    public List<Linkman> query(Linkman linkman) {
        return linkmanDao.findAll(Example.of((Linkman) Tool.setNull(linkman)));
    }
}
