package com.soul.dao;

import com.soul.entity.Visit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VisitDao extends JpaRepository<Visit, Integer> {

    Visit findAllById(Integer id);

    List<Visit> findAllByCustomerId(Integer id);

    List<Visit> findAllByLinkmanId(Integer id);

    List<Visit> findAllByCustomerIdAndLinkmanId(Integer id1, Integer id2);
}
