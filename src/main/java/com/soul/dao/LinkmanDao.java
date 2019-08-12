package com.soul.dao;

import com.soul.entity.Linkman;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LinkmanDao extends JpaRepository<Linkman, Integer> {

    Linkman findAllById(Integer id);

    List<Linkman> findAllByNameLike(String name);

    List<Linkman> findAllByName(String name);
}
