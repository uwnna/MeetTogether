package com.meetogether.eeit10901.dao;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10936.pairs.model.MemberInfo;


public interface IPersonalInfoDao {

	   
 
	  MemberBean getMemberById(Integer memberId) ;

	  void addPersonalInfo(MemberInfo mm);

	  List<MemberInfo> getMemberList();
}
