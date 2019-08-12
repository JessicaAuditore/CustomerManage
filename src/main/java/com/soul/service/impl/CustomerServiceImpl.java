package com.soul.service.impl;

import com.soul.component.Tool;
import com.soul.dao.CustomerDao;
import com.soul.entity.Customer;
import com.soul.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.*;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

@CacheConfig(cacheNames = "customer")
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    @Cacheable(key = "'customerList'")
    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    @Override
    public Page<Customer> findAll(Pageable pageable) {
        return customerDao.findAll(pageable);
    }

    @Override
    @Cacheable(key = "'id:'+#id")
    public Customer findById(Integer id) {
        return customerDao.findAllById(id);
    }

    @Override
    @Caching(
            put = {
                    @CachePut(key = "'id:'+#customer.id")
            },
            evict = {
                    @CacheEvict(key = "'customerList'")
            }
    )
    public Customer saveOrUpdate(Customer customer) {
        if (customer.getDict().getId() == null) {
            customer.setDict(null);
        }
        if (customer.getLinkman().getId() == null) {
            customer.setLinkman(null);
        }
        if (customer.getSource().getId() == null) {
            customer.setSource(null);
        }
        return customerDao.saveAndFlush(customer);
    }

    @Override
    @Caching(
            evict = {
                    @CacheEvict(key = "'id:'+#id"),
                    @CacheEvict(key = "'customerList'")
            }
    )
    public void delete(Integer id) {
        customerDao.deleteById(id);
    }

    @Override
    public List<Customer> find(String name, Integer id) {
        if (id == null && Objects.equals(name, "")) {
            return customerDao.findAll();
        } else if (id == null) {
            return customerDao.findAllByNameLike(name);
        } else if (Objects.equals(name, "")) {
            return customerDao.findAllByDictId(id);
        } else {
            return customerDao.findAllByDictIdAndNameLike(id, name);
        }
    }

    @Override
    public List findCountLevel() {
        return customerDao.findCountLevel();
    }

    @Override
    public List findCountSource() {
        return customerDao.findCountSource();
    }

    @Override
    public List<Customer> query(Customer customer) {
        return customerDao.findAll(Example.of((Customer) Tool.setNull(customer)));
    }
}
