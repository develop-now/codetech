package com.codetech.www.domain;


public class StoreMap {
	
	private String store_name;
    //private int store_id; Getter/Setter 나중에
    private String store_address_si;
    private String store_address_gu;
    private String store_address_dong;
    private String lat; //위도
    private String lon; //경도
    
    
    
    private int storemap_id;
    public int getStoremap_id() {
		return storemap_id;
	}
	public void setStoremap_id(int storemap_id) {
		this.storemap_id = storemap_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_address_si() {
		return store_address_si;
	}
	public void setStore_address_si(String store_address_si) {
		this.store_address_si = store_address_si;
	}
	public String getStore_address_gu() {
		return store_address_gu;
	}
	public void setStore_address_gu(String store_address_gu) {
		this.store_address_gu = store_address_gu;
	}
	public String getStore_address_dong() {
		return store_address_dong;
	}
	public void setStore_address_dong(String store_address_dong) {
		this.store_address_dong = store_address_dong;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}

	
    

}
