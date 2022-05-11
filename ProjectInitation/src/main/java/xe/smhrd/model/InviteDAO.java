package xe.smhrd.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class InviteDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "xe/smhrd/mapper/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int write(InviteVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.insert("invite", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}
	public int selectLast() {
		SqlSession session = sqlSessionFactory.openSession(true);
		int num = session.selectOne("selectLast");
		session.close();
		return num;
	}
	public int addinvsel(InviteVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.insert("addinvsel", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}
	
	public int addinvselitm(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.insert("addinvselitm", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}
	
	public List<InviteVO> selectMylist(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<InviteVO> list = session.selectList("selectMylist", m_id);
		session.close();
		return list;
	}
	
	public InviteVO selectMyOne(int v_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		InviteVO vo = session.selectOne("selectMyOne", v_id);
		session.close();
		return vo;
	}
	
	public List<InviteVO> selectMyItem(int v_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<InviteVO> list = session.selectList("selectMyItem", v_id);
		session.close();
		return list;
	}
	
	public void voteOne(InviteVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("voteOne", vo);
		session.close();
	}
	
	public void resultOne(InviteVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("resultOne", vo);
		session.close();
	}
	
	public void clearAll(int v_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("clearAll", v_id);
		session.close();
	}
	
	public List<InviteVO> selectResultItem(int v_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<InviteVO> list = session.selectList("selectResultItem", v_id);
		session.close();
		return list;
	}
	
}
