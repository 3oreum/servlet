<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 로고 영역 --%>
<div class="col-2 d-flex align-items-center">
	<h3><a href="#" class="text-success">Melong</a></h3>
</div>
	<%-- 검색 영역 --%>
<div class="col-10 d-flex align-items-center">
		<div class="w-100">
			<form method="get" action="/lesson03/quiz02/layout2.jsp">
				<div class="input-group">
					<input type="text" class="form-control col-5" name="search">
					<div class="input-group-append">
						<button class="btn btn-info" type="submit">검색</button>
					</div>
				</div>
			</form>
		</div>
</div>