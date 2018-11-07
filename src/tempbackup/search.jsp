<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style>
		div.contain {
		    width: 100%;
		    border: 1px solid gray;
		}

header{
    margin:0;
    padding:1em;
    background-color: DARKSLATEGRAY;
    clear: left;  
    color:gold;
    font-size:20;
    text-align: center;
    box-shadow: inset 0 0 20px 0px black;
}

	footer {
	    margin:0;
    	padding:1em;
	    background-color: DARKSLATEGRAY;
	    clear: left;  
	    color:gold;
	    font-size:20;
	    text-align: center;
	    box-shadow: inset 0 0 20px 0px black;
		bottom: 0px;
		width : 100%;
	}
nav {
	background-color: SILVER;
	font-weight:bold;
    float:left;
    max-width: 20%;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
    display: inline-block;
	position: relative;    
	z-index: 1; 
    text-align: center;
    padding: 2em;     
	margin: -2em; 
}

nav ul li {display: inline-block;
	width: 100%; 
	text-align: left;   
	height:100%;

}
nav ul li:hover {background: DARKSLATEGRAY; 
	width: 100%; 
	height:100%;
	text-align: left;

}
   
nav ul a {
    text-decoration: none;
    display: inline-block;
}

</style>
</head>
<body>
<div class="contain">
<a href="${contextPath}/welcome">
	<header>
	    <img src="${contextPath}/images/logo.png" alt="hirePeople"/>
	</header>
</a>
 <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2 style="float: center">Welcome ${pageContext.request.userPrincipal.name}! </h2>       
    </c:if>
   
<!-- div style="margin-left:25%"-->
<div class="w3-container">
	<form id="search" action="${contextPath}/search" method="GET" > 
	   	<h2 class="form-heading">Search</h2></li>
	    <div class="form-group ${error != null ? 'has-error' : ''}"> 
		   	<input name="q" class="form-control" tabindex="1" onfocus="if (this.value=='search') this.value = ''" type="text" maxlength="80" size="28" value="search">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Search</button> 
		</div>
		<br>
		<ul style="float:left" class="nav nav-tabs">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Locations <span class="caret"></span></a>
 				<ul class="dropdown-menu">
					<c:forEach var="facet" items="${filter}">
						<li><input type="checkbox" name="checkboxName" value="${facet.value}"><c:out value="${facet.value}" />(<c:out value="${facet.count}" />)</li>
					</c:forEach>
				</ul>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Title <span class="caret"></span></a>
 				<ul class="dropdown-menu">
					<c:forEach var="jobtitle" items="${title}">
						<li><input type="checkbox" name="checkboxTitle" value="${jobtitle.value}"><c:out value="${jobtitle.value}" /></li>
					</c:forEach>
				</ul>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Salary Range<span class="caret"></span></a>
 				<ul class="dropdown-menu">
					<c:forEach var="job_sal" items="${salar}">
						<li><input type="checkbox" name="checkboxSal" value="${job_sal.value}"><c:out value="$'${job_sal.value}'" />(<c:out value="${job_sal.count}" />)</li>>
					</c:forEach>
				</ul>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Company<span class="caret"></span></a>
 				<ul class="dropdown-menu">
					<c:forEach var="comp" items="${company}">
						<li><input type="checkbox" name="checkboxComp" value="${comp.value}"><c:out value="${comp.value}" /></li>>
					</c:forEach>
				</ul>
			</li>

		 </ul>
       
	</form>
</div>
 <br>
<h3>Search Job Results</h3>
	<c:if test="${not empty jobslist}">
		<ul>
		 	<c:forEach var="job" items="${jobslist}">
		 	<div class="thumbnail-container" style="float:left;height:60px;width:60px">
				<img src="${job.company.logo}" width="50" height="50" onerror="this.src='${contextPath}/images/teamwork.png'" />
			</div>
			<div>
				
				<h4 class="text-left"><a href="${contextPath}/applyjob/${job.jobid}"> <b><c:out value="${job.title}" /></b> </a></h4>
				<p style="color:grey"><c:out value="${job.loc}" /></p>
				<c:out value="${job.descrip}" />
				<form method="POST" action="${contextPath}/interestedapply/${job.jobid}">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<c:set var="jid">${job.jobid}</c:set>
					<c:if test = "${job.jobposition eq 'Open'}">
						<c:choose>
							<c:when test = "${interested.get(jid)}">
								<h4 align="left"><button class="btn btn-primary" type="submit">Interested</button></h4>
							</c:when>
							<c:otherwise>
								<h4 align="left"><button class="btn btn-primary" type="submit">Not Interested</button></h4>
							</c:otherwise>
						</c:choose>
					</c:if>
				</form>
			</div>
			<hr>
			</c:forEach>
		</ul>
	</c:if>
	
	<div id="pagination">

    <c:url value="/search" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/search" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>                
    </c:forEach>
    <c:url value="/search" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
	</div>
</div>  
	<!--  /div --> 
<footer>CMPE275 Project Team-3</footer>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>