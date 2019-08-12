package com.soul.service.impl;

import com.soul.component.Tool;
import com.soul.dao.VisitDao;
import com.soul.entity.Visit;
import com.soul.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.*;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@CacheConfig(cacheNames = "visit")
@Service
@Transactional
public class VisitServiceImpl implements VisitService {

    @Autowired
    private VisitDao visitDao;

    @Override
    @Cacheable(key = "'visitList'")
    public List<Visit> findAll() {
        return visitDao.findAll();
    }

    @Override
    @Caching(
            put = {
                    @CachePut(key = "'id:'+#visit.id")
            },
            evict = {
                    @CacheEvict(key = "'visitList'")
            }
    )
    public Visit saveOrUpdate(Visit visit) {
        if (visit.getCustomer().getId() == null) {
            visit.setCustomer(null);
        }
        if (visit.getLinkman().getId() == null) {
            visit.setLinkman(null);
        }
        return visitDao.saveAndFlush(visit);
    }

    @Override
    @Cacheable(key = "'id:'+#id")
    public Visit findById(Integer id) {
        return visitDao.findAllById(id);
    }

    @Override
    @Caching(
            evict = {
                    @CacheEvict(key = "'id:'+#id"),
                    @CacheEvict(key = "'visitList'")
            }
    )
    public void delete(Integer id) {
        visitDao.deleteById(id);
    }

    @Override
    public List<Visit> find(Integer id1, Integer id2) {
        if (id1 == null && id2 == null) {
            return visitDao.findAll();
        } else if (id1 == null) {
            return visitDao.findAllByLinkmanId(id2);
        } else if (id2 == null) {
            return visitDao.findAllByCustomerId(id1);
        } else {
            return visitDao.findAllByCustomerIdAndLinkmanId(id1, id2);
        }
    }

    @Override
    public List<Visit> query(Visit visit) {
        return visitDao.findAll(Example.of((Visit) Tool.setNull(visit)));
    }
}
