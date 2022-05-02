package xe.smhrd.model;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	
//	Connection pool �����
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
//		Connection pool ����
		try {
			String resource = "xe/smhrd/mapper/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//==============================================================================
	
	public int join(MemberVO vo) {
		
//		SqlSession ��������
		SqlSession session = sqlSessionFactory.openSession(true);
		
//		MemberMapper.xml�� ����� SQL���� ����
		int cnt = session.insert("join", vo);
		
//		���� ��ȯ
		session.close();
		
//		���ϰ� ��ȯ
		return cnt;
	}
	
}
