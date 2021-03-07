package com.spring.boot.dao;

import com.spring.boot.entities.User;
import java.util.List;

public interface UserDao {

    public List<User> findAllUsers();

    public User findById(int id);

    public boolean save(User user);

    public boolean delete(int id);

    public boolean update(User user);
}
