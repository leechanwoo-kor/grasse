package grasse.item.review;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import grasse.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {
	
	// 리뷰 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ReviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.selectAllReview", map);// selectList는 Mybatis기본 기능으로 리스트를 조회할때
																				// 사용
	}

	// 리뷰 쓰기
	public void ReviewWrite(Map<String, Object> map) throws Exception {
		insert("review.insertReview", map);
	}

	// 리뷰 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> ReviewDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("review.selectOneReview", map);
	}

	// 리뷰 수정
	public void ReviewUpdate(Map<String, Object> map) throws Exception {
		update("review.updateReview", map);
	}

	// 리뷰 삭제
	public void ReviewDelete(Map<String, Object> map) throws Exception {
		delete("review.deleteReview", map);
	}

	// 리뷰 댓글 쓰기
	public void ReviewCommentWrite(Map<String, Object> map) throws Exception {
		insert("review.insertReviewComment", map);
	}

	// 리뷰 댓글 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ReviewCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.selectReviewComment", map);
	}

	// 리뷰 댓글 수정
	public void ReviewCommentUpdate(Map<String, Object> map) {
		update("review.updateReviewComment", map);
	}

	// 리뷰 댓글 삭제
	public void ReviewCommentDelete(Map<String, Object> map) throws Exception {
		delete("review.deleteReviewComment", map);
	}


}