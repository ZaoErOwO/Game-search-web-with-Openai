package com.icss.mapper;

import org.apache.ibatis.annotations.Param;

import com.icss.entity.User;

public interface IUserMapper {
	
	public User login(@Param("uname") String uname,@Param("pwd") String pwd) throws Exception;
	
	public void addUser(User user) throws Exception;
}
