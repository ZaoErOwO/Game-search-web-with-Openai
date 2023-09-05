package com.icss.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icss.dao.UserDao;
import com.icss.entity.User;

@Service
public class UserBiz {

	@Autowired
	private UserDao userDao;
	
	public synchronized User login(String uname,String pwd) throws Exception{	
		return userDao.login(uname, pwd);		
	}
}
