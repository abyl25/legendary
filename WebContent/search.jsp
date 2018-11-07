<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Legendary</title>

<!--
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script> 
 <script src="js/jquery-3.3.1.min"></script>  -->
<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
 -->
 
<!-- 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
-->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.js"></script>	
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.js.map"></script>
-->
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="container py-3">
		<input class="form-control w-75" type="text" placeholder="Type here" name="search">
		<input class="btn btn-md mt-2" id="search-job" type="submit" value="Submit">
			
		<!--   <div class="jumbotron">			
		</div>	-->
	</div>
	
	<div id="search-result">
		
	</div>
		
	<script type="text/javascript">
	$(document).ready(function() {
		$("#search-job").click(function(){
			var host = 'data.usajobs.gov'; 
			var userAgent = 'abylay.tastanbekov@nu.edu.kz';
			var authKey = '47U9piIWBORGHkOZXDoAe1SQaFK7P4sMKiUjG0HD9kE=';
			
			$.ajax({
				url: 'https://data.usajobs.gov/api/search?Keyword=Software', 
				method: 'GET',
				headers: {          
			        "Host": host,          
			        "User-Agent": userAgent,          
			        "Authorization-Key": authKey      
			    },  
				success: function(result){
		        	$("#search-result").html(result);
		    	}
			});
		});
	});	
	</script>
</body>
</html>