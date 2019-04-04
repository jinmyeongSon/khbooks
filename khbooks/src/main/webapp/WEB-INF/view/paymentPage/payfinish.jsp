<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>KH BOOKs</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]-->

<script type="text/javascript">	
		$(document).ready(function() {
			var res ="${finish}";
			
			if(res=="success"){
			var total = ${total_amount};
		    opener.location.href='dsds.kh?total_amount='+total;
		    alert(total);
		    alert(res);
		    window.close();
			}else{
			    window.close();
			}
		});
		
	    
</script>

</head>
<body>

</body>
</html>
