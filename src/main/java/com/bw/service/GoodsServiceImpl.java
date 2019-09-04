package com.bw.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.entity.Brand;
import com.bw.entity.CateBrand;
import com.bw.entity.Category;
import com.bw.entity.Goods;
import com.bw.mapper.GoodsDao;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao dao;

	public List<Goods> listGoods() {
		// TODO Auto-generated method stub
		return dao.listGoods();
	}

	public List<Category> listCate() {
		// TODO Auto-generated method stub
		return dao.listCate();
	}

	public List<Brand> listBrand() {
		// TODO Auto-generated method stub
		return dao.listBrand();
	}

	public boolean addGoods(Goods goods) {
		// TODO Auto-generated method stub
		int i=dao.addGoods(goods);
		if (i>0) {
			return true;
		}
		return false;
	}

	public Goods findgid(Integer gid) {
		// TODO Auto-generated method stub
		return dao.findgid(gid);
	}

	public boolean updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		int i=dao.updateGoods(goods);
		if (i>0) {
			return true;
		}
		return false;
	}

}
