package com.soul.dao;

import com.soul.entity.Source;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SourceDao extends JpaRepository<Source,Integer> {


}
