package grasse.item.review;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;

	// 리뷰 리스트
	@Override
	public List<Map<String, Object>> ReviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.ReviewList(map);
	}

	// 리뷰 쓰기
	@Override
	public void ReviewWrite(Map<String, Object> map) throws Exception {
		reviewDAO.ReviewWrite(map);
	}

	// 리뷰 상세보기
	@Override
	public Map<String, Object> ReviewDetail(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = reviewDAO.ReviewDetail(map);
		return resultMap;
	}

	// 리뷰 수정
	@Override
	public void ReviewUpdate(Map<String, Object> map) throws Exception {

		reviewDAO.ReviewUpdate(map);

	}

	// 리뷰 삭제
	@Override
	public void ReviewDelete(Map<String, Object> map) throws Exception {

		reviewDAO.ReviewDelete(map);
	}

	// 리뷰 코멘트 쓰기
	@Override
	public void ReviewCommentWrite(Map<String, Object> map) throws Exception {

		reviewDAO.ReviewCommentWrite(map);
	}

	// 리뷰 코멘트 리스트
	@Override
	public List<Map<String, Object>> ReviewCommentList(Map<String, Object> map) throws Exception {

		return reviewDAO.ReviewCommentList(map);

	}

	// 리뷰 댓글 수정
	public void ReviewCommentUpdate(Map<String, Object> map) throws Exception {
		reviewDAO.ReviewCommentUpdate(map);
	};

	// 리뷰 코멘트 삭제
	@Override
	public void ReviewCommentDelete(Map<String, Object> map) throws Exception {
		reviewDAO.ReviewCommentDelete(map);

	}

}
