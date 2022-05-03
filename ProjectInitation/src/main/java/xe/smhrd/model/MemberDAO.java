package xe.smhrd.model;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import xe.smhrd.model.MemberVO;

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
	
//	emailCheck method
	public MemberVO emailCheck(String m_id) {
		
//		1. SqlSession ��������
		SqlSession session = sqlSessionFactory.openSession(true);
		
//		2. Sql�� ����
		MemberVO vo = session.selectOne("emailCheck", m_id);
		
//		3. ���� ��ȯ
		session.close();
		
		return vo;
	}
	
}
