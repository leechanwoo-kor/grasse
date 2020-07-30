package grasse.item.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	//리뷰 리스트
	List<Map<String, Object>> ReviewList(Map<String, Object> map) throws Exception;
 	//리뷰 쓰기
 	void ReviewWrite(Map<String, Object> map) throws Exception;
 	//리뷰 상세보기
 	Map<String, Object> ReviewDetail(Map<String, Object> map) throws Exception;
 	//리뷰 수정
	void ReviewUpdate(Map<String, Object> map) throws Exception;
	//리뷰 삭제
	void ReviewDelete(Map<String, Object> map) throws Exception;

	//리뷰 댓글 리스트
	List<Map<String, Object>> ReviewCommentList(Map<String, Object> map) throws Exception;
	//리뷰 댓글 쓰기
	void ReviewCommentWrite(Map<String, Object> map) throws Exception;
	//리뷰 댓글 수정
	void ReviewCommentUpdate(Map<String, Object> map) throws Exception;
	//리뷰 댓글 삭제
	void ReviewCommentDelete(Map<String, Object> map) throws Exception;
}
