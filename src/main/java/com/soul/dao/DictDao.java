package com.soul.dao;

import com.soul.entity.Dict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DictDao extends JpaRepository<Dict,Integer> {


}
