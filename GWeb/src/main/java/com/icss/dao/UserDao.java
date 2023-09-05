package com.icss.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icss.entity.User;
import com.icss.mapper.IUserMapper;

@Repository
public class UserDao {

	@Autowired
	private IUserMapper userMapper;
	
	
	public User login(String uname,String pwd) throws Exception{		
		return userMapper.login(uname, pwd);
	}	
}
