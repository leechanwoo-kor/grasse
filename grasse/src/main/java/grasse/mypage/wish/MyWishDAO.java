package grasse.mypage.wish;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("myWishDAO")
public class MyWishDAO extends AbstractDAO {

	// 내 위시리스트 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyWishList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("myWish.selectMyWishList", map);
	}

	// 내 정보 찾기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("myWish.selectMyInfo", map);
	}

	// 위시 리스트 삭제
	public void deleteMyWish(Map<String, Object> map) throws Exception {
		update("myWish.deleteMyJJim", map);
	}

	// 위시 리스트 추가
	public void addMyWish(Map<String, Object> map) {
		insert("myWish.addMyWish", map);
	}
}
