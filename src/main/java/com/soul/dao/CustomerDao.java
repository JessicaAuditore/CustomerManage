package com.soul.dao;

import com.soul.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {

    Customer findAllById(Integer id);

    List<Customer> findAllByNameLike(String name);

    List<Customer> findAllByDictId(Integer id);

    List<Customer> findAllByDictIdAndNameLike(Integer id, String name);

    @Query(value = "select dict,count(c) from Customer c group by dict")
    List findCountLevel();

    @Query(value = "select source,count(c) from Customer c group by source")
    List findCountSource();
}