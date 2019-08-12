package com.soul.service;

import com.soul.entity.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {

    List<Customer> findAll();

    Page<Customer> findAll(Pageable pageable);

    Customer findById(Integer id);

    Customer saveOrUpdate(Customer customer);

    void delete(Integer id);

    List<Customer> find(String name, Integer id);

    List findCountLevel();

    List findCountSource();

    List<Customer> query(Customer customer);
}
