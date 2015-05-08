package kr.or.kosta.common.controller;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

/**
 * Singleton ���� �� Factory ������ ����� ControllerFactory
 * @author �����
 *
 */
public class ControllerFactory {
	
	// �������� ���
	private String controllerMappingPath;
	
	// ��û�� ���� ���� ��Ʈ�ѷ� Ŭ���� ���� �� ����
	private HashMap<String, Controller> controllerMap; 
	
	private static ControllerFactory controllerFactory;
	
	private ControllerFactory(){}
	
	private ControllerFactory(String configFilePath){
		this.controllerMappingPath = configFilePath;
		controllerMap = new HashMap<String, Controller>();
		// ���������� ������ Properties ��ü ����
		Properties prop = new Properties();
		FileInputStream fis = null;
		try{
			
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
			Iterator keyIter = prop.keySet().iterator();
			System.out.println("[DEBUG] : ������ ������Ʈ�ѷ���...");
			while(keyIter.hasNext()){
				String controllerName = (String)keyIter.next();
				String controllerClass = prop.getProperty(controllerName);
				// ��Ʈ�ѷ� ����
				Controller controllerObject = (Controller)Class.forName(controllerClass).newInstance();
				controllerMap.put(controllerName, controllerObject);
				System.out.println(controllerName + " : " + controllerObject);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}		
	}
	
	/** �̱��� ���� ������ ���� ���� �޼ҵ� */
	public static ControllerFactory getInstance(String controllerMappingPath){
		if(controllerFactory == null){
			synchronized (ControllerFactory.class) {
				controllerFactory = new ControllerFactory(controllerMappingPath);
			}
		}
		return controllerFactory;
	}
	
	public Controller getController(String controllerName){
		return controllerMap.get(controllerName);		
	}
}
