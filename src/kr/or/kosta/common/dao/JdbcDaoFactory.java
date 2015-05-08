package kr.or.kosta.common.dao;

import java.lang.reflect.Method;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

/**
 * Jdbc기술을 사용하는 각각의 Dao 생성
 * ConnectionPooling 적용
 * @author 김기정
 *
 */
public class JdbcDaoFactory extends DaoFactory{
	
	private static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
//	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521";
	private static final String DB_URL = "jdbc:oracle:thin:@192.168.0.28:1521";
	private static final String USER_ID = "hr";
	private static final String USER_PW = "hr";
	
	public DataSource createDataSource(){
		PoolProperties prop = new PoolProperties();
        prop.setUrl(DB_URL);
        prop.setDriverClassName(DRIVER_NAME);
        prop.setUsername(USER_ID);
        prop.setPassword(USER_PW);
        prop.setInitialSize(2); // 10
        prop.setMaxActive(5);   // 100
        prop.setMinIdle(2);
        prop.setMaxWait(10000);
        
        DataSource dataSource = new DataSource();
        dataSource.setPoolProperties(prop);
		return dataSource;
	}
	
	
//	public UserDao getUserDao(){
//		return new JdbcUserDao(createDataSource());
//	}
//	public abstract AccountDao getAccountDao(){}
//	public abstract MessageDao getMessageDao(){}
	
	@Override
	public Object getDao(String daoClassName) throws Exception{
		Object dao = null;
		// Reflection API를 이용한 Dao 동적 생성 
		dao = Class.forName(daoClassName).newInstance();
		// 생성된 Dao에 DataSource 설정
		DataSource dataSource = createDataSource();
		// Reflection API를 이용한 메서드 동적 호출
		Method method = dao.getClass().getMethod("setDataSource", DataSource.class);
		method.invoke(dao, dataSource);
		//dao.setDataSource(dataSource);
		return dao;
	}
}
