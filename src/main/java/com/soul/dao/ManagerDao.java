package com.soul.dao;

import com.soul.entity.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagerDao extends JpaRepository<Manager, Integer> {

    List<Manager> findAllByName(String name);

    List<Manager> findAllByRealnameLike(String realname);

    List<Manager> findAllByLevel(String level);

    List<Manager> findAllByLevelAndRealnameLike(String level, String realname);
}

