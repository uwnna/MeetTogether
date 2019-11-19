package com.meetogether.eeit10901.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.IPersonalInfoDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10936.pairs.model.MemberInfo;





@Repository
public class PersonalInfoImpl implements IPersonalInfoDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public List<MemberInfo> addPersonalInfo(MemberInfo personalinfo) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberById(personalinfo.getMemberId());
		
		session.save(personalinfo);
		return null;
	}


	@Override
	public MemberBean getMemberById(Integer memberId) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, memberId);
		return result;
	}


	@Override
	public List<MemberInfo> getAllInfo() {
		
		return null;
	}


}
