package grasse.mypage.wish;

import java.util.List;
import java.util.Map;

public interface MyWishService {
	List<Map<String, Object>> selectMyWishList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;

	void deleteMyWish(Map<String, Object> map) throws Exception;

	void addWish(Map<String, Object> jsonMap);

}
