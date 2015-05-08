package kr.or.kosta.common.dao;

import java.lang.reflect.Method;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

/**
 * Jdbc����� ����ϴ� ������ Dao ����
 * ConnectionPooling ����
 * @author �����
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
		// Reflection API�� �̿��� Dao ���� ���� 
		dao = Class.forName(daoClassName).newInstance();
		// ������ Dao�� DataSource ����
		DataSource dataSource = createDataSource();
		// Reflection API�� �̿��� �޼��� ���� ȣ��
		Method method = dao.getClass().getMethod("setDataSource", DataSource.class);
		method.invoke(dao, dataSource);
		//dao.setDataSource(dataSource);
		return dao;
	}
}
