<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination">
    <c:if test="${pagingHelper.hasPreviousPage()}">
        <a href="?page=1">처음</a>
        <a href="?page=${pagingHelper.nowPage - 1}">이전</a>
    </c:if>

    <c:forEach var="i" begin="${pagingHelper.startPage}" end="${pagingHelper.endPage}">
        <c:choose>
            <c:when test="${i == pagingHelper.nowPage}">
                <span class="now">${i}</span>
            </c:when>
            <c:otherwise>
                <a href="?page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${pagingHelper.hasNextPage()}">
        <a href="?page=${pagingHelper.nowPage + 1}">다음</a>
        <a href="?page=${pagingHelper.totalPages}">마지막</a>
    </c:if>
</div>


<style>
.pagination {
    text-align: center;
    margin-top: 20px;
}

.page-link {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 12px;
    background-color: #333; /* 짙은 회색 */
    color: white;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.page-link:hover {
    background-color: #000; /* 검정 */
}

.now {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 12px;
    background-color: #000; /* 검정 */
    color: white;
    font-weight: bold;
    border-radius: 4px;
}
</style>