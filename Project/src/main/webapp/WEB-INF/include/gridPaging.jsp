<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${paging.totalPages > 1}">
    <div class="pagination">
        <c:forEach begin="1" end="${paging.totalPages}" var="page">
            <a href="?page=${page}" class="${page == paging.page ? 'active' : ''}">${page}</a>
        </c:forEach>
    </div>
</c:if>

<style>
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 30px;
        font-size: 14px;
    }
    .pagination a {
        margin: 0 8px;
        padding: 8px 12px;
        border-radius: 5px;
        text-decoration: none;
        color: #555;
        background-color: #f8f9fa;
        border: 1px solid #ddd;
        transition: all 0.3s;
    }
    .pagination a:hover {
        background-color: #e2e6ea;
        color: #333;
    }
    .pagination a.active {
        font-weight: bold;
        background-color: #17a2b8;
        color: #fff;
        border-color: #17a2b8;
    }
</style>