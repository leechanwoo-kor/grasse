package grasse.mypage.wish;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("myWishService")
public class MyWishServiceImpl implements MyWishService {

	@Resource(name = "myWishDAO")
	MyWishDAO myWishDAO;

	// 내 위시리스트 리스트
	@Override
	public List<Map<String, Object>> selectMyWishList(Map<String, Object> map) throws Exception {
		return myWishDAO.selectMyWishList(map);
	}

	// 내 정보
	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception {
		return myWishDAO.selectMyInfo(map);
	}

	// 내 위시 리스트 추가하기
	@Override
	public void addWish(Map<String, Object> map) {
		myWishDAO.addMyWish(map);
	}

	// 내 위시리스트 삭제
	@Override
	public void deleteMyWish(Map<String, Object> map) throws Exception {
		myWishDAO.deleteMyWish(map);
	}

}
