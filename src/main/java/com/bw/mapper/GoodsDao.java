package com.bw.mapper;

import java.util.List;

import com.bw.entity.Brand;
import com.bw.entity.CateBrand;
import com.bw.entity.Category;
import com.bw.entity.Goods;

public interface GoodsDao {

	List<Goods> listGoods();

	List<Category> listCate();

	List<Brand> listBrand();

	int addGoods(Goods goods);

	Goods findgid(Integer gid);

	int updateGoods(Goods goods);

}
