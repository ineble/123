<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="QNA게시판" name="title"/>
</jsp:include>


<script type="text/javascript">
	function fn_qnaBoardList(f){
		f.action = 'qnaBoardList';
		f.submit();
	}
</script>


<form>
	<input type="button" value="질문하러가기" onclick="fn_qnaBoardList(this.form)"/>
</form>



<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>