package com.bw.entity;


public class CateBrand implements java.io.Serializable {

	//columns START
	private Integer cid;
	private Integer bid;
	//columns END
	public CateBrand(){
	}
	public CateBrand(Integer cid,Integer bid){
		this.cid=cid;		this.bid=bid;	}

	public void setCid(Integer cid){
		this.cid=cid;
	}
	public Integer getCid(){
		return cid;
	}

	public void setBid(Integer bid){
		this.bid=bid;
	}
	public Integer getBid(){
		return bid;
	}
}

