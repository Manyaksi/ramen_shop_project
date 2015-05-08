package kr.or.kosta.common.controller;

import java.util.HashMap;
import java.util.Map;

/** �� �� �� ��� ������ ���� Wrapper Ŭ���� */
public class ModelAndView{
	private String view;
	private Map<String, Object> map;
	public ModelAndView() {
		map = new HashMap<String, Object>();
	}
	public ModelAndView(String view, Map<String, Object> map) {
		this.view = view;
		this.map = map;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	public void addObject(String key, Object value){
		map.put(key, value);
	}
	
	@Override
	public String toString() {
		return "ModelAndView [view=" + view + ", map=" + map + "]";
	}
}