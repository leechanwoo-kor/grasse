package grasse.common.paging;

import org.springframework.stereotype.Component;

@Component(value = "faqListPaging")
public class FaqListPaging {
	//
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalList;
	private StringBuffer pagingHTML;
	private String path;

	public void paging() {
		pagingHTML = new StringBuffer();
		int totalPage = (totalList + pageSize - 1) / pageSize;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		pagingHTML.append("<ul class='pagination' style='justify-content: center;'>");
		if (startPage > pageBlock)
			pagingHTML.append("<li class='page-item'><a class='page-link' href='" + path + "/faq/faqList.do?page="
					+ (startPage - 1) + "'>이전</a></li>");

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage) {
				pagingHTML.append("<li class='page-item active'><a class='page-link' href='" + path
						+ "/faq/faqList.do?page=" + i + "'>" + i + "</a></li>");
			} else {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='" + path + "/faq/faqList.do?page="
						+ i + "'>" + i + "</a></li>");
			}

		}

		if (endPage < totalPage) {
			pagingHTML.append("<li class='page-item'><a class='page-link' href='" + path + "/faq/faqList.do?page="
					+ (endPage + 1) + "'>다음</a></li>");
		}
		pagingHTML.append("</ul>");
	}

	/* setter & getter */
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String pg) {
		this.currentPage = Integer.parseInt(pg);
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalList() {
		return totalList;
	}

	public void setTotalList(int totalList) {
		this.totalList = totalList;
	}

	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}

	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}