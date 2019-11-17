package com.meetogether.eeit10913.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10913.dao.ProductDao;
import com.meetogether.eeit10913.model.ReviewBean;
@Service
public class ProductServiceImpl implements ProductService {
	ProductDao dao;
	
	@Autowired
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public void add(ReviewBean review) {
		dao.add(review);
		
	}
	
	@Transactional
	@Override
	public void update(ReviewBean rev) {
		dao.update(rev);	
	}
	
	@Transactional
	@Override
	public void delete(Integer review) {
		dao.delete(review);
	}
	
	@Transactional
	@Override
	public ReviewBean getReviewById(Integer reviewId) {
		return dao.getReviewById(reviewId);
	}
	
	@Transactional
	@Override
	public List<ReviewBean> selectALL() {
		return dao.selectALL();
	}

	@Transactional
	@Override
	public MemberBean getMemberById(int memberId) {
		return dao.getMemberById(memberId);
	}
	
	@Transactional
	@Override
	public Blob getphotoById(Integer id) {
	return dao.getphotoById(id);
	}
	
	@Transactional
	@Override
	public ActBean getActivityById(int actId) {
		return dao.getActivityById(actId);
	}
}
