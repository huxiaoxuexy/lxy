package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.entity.Brand;
import com.bw.entity.CateBrand;
import com.bw.entity.Category;
import com.bw.entity.Goods;
import com.bw.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class GoodsController {
	@Resource
	private GoodsService service;
	
	//商品列表
	@RequestMapping("listGoods.do")
	public String listGoods(ModelMap modelMap,@RequestParam(required=false,defaultValue="1")Integer pageNum) {
		PageHelper pageHelper=new PageHelper();
		pageHelper.startPage(pageNum, 3);	
		
		List<Goods> listGoods=service.listGoods();
		
		PageInfo<Goods> page=new PageInfo<Goods>(listGoods);
		
		modelMap.put("page", page);
		return "list";
	}
	
	//分类表
	@RequestMapping("listCate.do")
	@ResponseBody
	public List<Category> listCate() {
		List<Category> listCate=service.listCate();
		return listCate;
	}
	
	//品牌表
	@RequestMapping("listBrand.do")
	@ResponseBody
	public List<Brand> listBrand() {
		List<Brand> listBrand=service.listBrand();
		return listBrand;
	}
	
	//添加
	@RequestMapping("addGoods.do")
	@ResponseBody
	public boolean addGoods(Goods goods) {
		boolean b=service.addGoods(goods);
		return b;
	}
	
	
	//回显
	@RequestMapping("findgid.do")
	@ResponseBody
	public Map<String, Object> findgid(Integer gid) {
		Map<String, Object> map=new HashMap<String, Object>();
		
		List<Category> listCate=service.listCate();
		List<Brand> listBrand=service.listBrand();
		Goods goods=service.findgid(gid);
		
		map.put("listCate", listCate);
		map.put("listBrand", listBrand);
		map.put("goods", goods);
		
		return map;
	}
	
	
	//修改
	@RequestMapping("updateGoods.do")
	@ResponseBody
	public boolean updateGoods(Goods goods) {
		boolean b=service.updateGoods(goods);
		return b;
	}
		

	

}
