<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<%@ page import="java.util.*" %>

	<div class="container py-3"> 
		<h4>Search People</h4>	
		<form action="searchPeople">
			<input class="form-control w-75" type="text" placeholder="Type here" name="searchPeopleText" id="search-text">
			<input class="btn btn-md mt-3" id="search-people-btn" type="submit" value="Search">
		</form> 
	</div>
	
	<div id="search-result">
		
	</div>
		
	<script type="text/javascript">
	$(document).ready(function (){
		$('#search-people-btn').on('click', function() {
			var value = $('search-text').val();
			$.ajax({
				url: 'searchPeople',
				data: value,
				success : function(r) {
					console.log(r);
				}
			});
		});
	});
	</script>
	
</body>
</html>