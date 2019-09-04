package com.bw.service;

import java.util.List;

import com.bw.entity.Brand;
import com.bw.entity.CateBrand;
import com.bw.entity.Category;
import com.bw.entity.Goods;

public interface GoodsService {

	List<Goods> listGoods();

	List<Category> listCate();

	List<Brand> listBrand();

	boolean addGoods(Goods goods);

	Goods findgid(Integer gid);

	boolean updateGoods(Goods goods);

}
