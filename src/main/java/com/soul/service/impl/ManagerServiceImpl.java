package com.soul.service.impl;

import com.soul.dao.ManagerDao;
import com.soul.entity.Manager;
import com.soul.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@CacheConfig(cacheNames = "manager")
@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;

    @Override
    public Manager login(String username, String password) {
        List<Manager> managers = managerDao.findAllByName(username);
        if (managers.size() == 0) {
            return null;
        } else {
            Manager manager = managers.get(0);
            if (manager.getPassword().equals(password)) {
                return manager;
            } else {
                return new Manager();
            }
        }
    }

    @Override
    @CacheEvict(key = "'managerList'")
    public void saveOrUpdate(Manager manager) {
        managerDao.saveAndFlush(manager);
    }

    @Override
    @Cacheable(key = "'managerList'")
    public List<Manager> findAll() {
        return managerDao.findAll();
    }

    @Override
    @CacheEvict(key = "'managerList'")
    public void delete(Integer id) {
        managerDao.deleteById(id);
    }

    @Override
    public List<Manager> find(String realname, String level) {
        if (Objects.equals(realname, "") && Objects.equals(level, "")) {
            return managerDao.findAll();
        } else if (Objects.equals(level, "")) {
            return managerDao.findAllByRealnameLike(realname);
        } else if (Objects.equals(realname, "")) {
            return managerDao.findAllByLevel(level);
        } else {
            return managerDao.findAllByLevelAndRealnameLike(level, realname);
        }
    }
}
