package com.mysite.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysite.admin.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;
}
