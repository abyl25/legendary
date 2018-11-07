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

    <title>Post A New Job</title>

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
		    min-height:520px;
		}

header{
    margin:0;
    padding:1em;
    background-color: DARKSLATEGRAY;
    clear: left;  
    color:white;
    font-size:20;
    text-align: center;
    box-shadow: inset 0 0 20px 0px black;
}

	footer {
	    margin:0;
    	padding:1em;
	    background-color: DARKSLATEGRAY;
	    clear: left;  
	    color:white;
	    font-size:20;
	    text-align: center;
	    box-shadow: inset 0 0 20px 0px black;
		bottom: 0px;
		width : 100%;
		height:100%;
	}
	</style>
</head>
<body>
<a href="${contextPath}/">
<header>
	    <img src="https://s3-us-west-1.amazonaws.com/cmpe275/images/logo.jpeg" alt="hirePeople"/>
</header>
</a>
<div class="container">
	<h4 class="text-right"><a href="${contextPath}/jobApplications/${jobid}">Check Applications</a></h4>
    <form:form method="POST" action="${contextPath}/postjob" modelAttribute="companyjobposts" class="form-signin">
        <h2 class="form-signin-heading">Post A Job</h2>
        <spring:bind path="jobid">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="hidden" path="jobid" class="form-control" placeholder = "Job ID"
                            autofocus="true"></form:input>
                <form:errors path="jobid"></form:errors>
            </div>
        </spring:bind>
         <spring:bind path="Title">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="Title" class="form-control" placeholder = "Job Title"
                            autofocus="true"></form:input>
                <form:errors path="Title"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="Descrip">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:textarea path="Descrip" class="form-control" placeholder="Description"
                            autofocus="true"/>
                <form:errors path="Descrip"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="Resp">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:textarea path="Resp" class="form-control" placeholder="Responsibilities"/>
                <form:errors path="Resp"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="Loc">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="Loc" class="form-control" placeholder="Location"></form:input>
                <form:errors path="Loc"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="Sal">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="Sal" class="form-control" placeholder="Salary"></form:input>
                <form:errors path="Sal"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="jobposition">
        <div class="form-group ${status.error ? 'has-error' : ''}">
        		<c:choose>
  					<c:when test="${jobposition eq 'Open'}">
		       			<form:radiobutton path="jobposition" value="Open" checked="checked" />
		       		</c:when>
		       		<c:otherwise>
		       			<form:radiobutton path="jobposition" value="Open" />
		       		</c:otherwise>
		       </c:choose>
		       Open &nbsp;&nbsp;
		       <c:choose>
  					<c:when test="${jobposition eq 'Filled'}">
		       			<form:radiobutton path="jobposition" value="Filled" checked="checked" />
		       		</c:when>
		       		<c:otherwise>
		       			<form:radiobutton path="jobposition" value="Filled"/>
		       		</c:otherwise>
		       </c:choose>
		       Filled &nbsp;&nbsp;
		       <c:choose>
  					<c:when test="${jobposition eq 'Cancelled'}">
		       			<form:radiobutton path="jobposition" value="Cancelled" checked="checked" />
		       		</c:when>
		       		<c:otherwise>
		       			<form:radiobutton path="jobposition" value="Cancelled"/>
		       		</c:otherwise>
		       </c:choose>
		       Cancelled
		       <form:errors path="jobposition"/>
		      <br>
		       </div>
		      
</spring:bind>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Save changes</button>
    </form:form>
    
    
    <c:if test="${not empty cannotcancel}">
    <script>
    $(function() {

		console.log("Inside script");
    	$("#appDetail").dialog({
			width: 650,
			modal: true
		});

	})();
    </script>
    
    	<div style="font-size:20px;">
				<div id="appDetail" title="App Details">
					<b>The job cannot be cancelled as the job has an application in Offer Accepted state</b>
				</div>
		</div>
    </c:if>

</div>
<footer>CMPE275 Project Team-3</footer>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>