<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
  td { 
    padding     : 10px;  
    width       : 150px;
    text-align  : center; 
  }
  
  tr:first-child {
     background-color: black;
     color : white;
     font-weight: bold;
     /* SCSS 문법에 적용 
     https://www.jsdelivr.com/package/npm/browser-scss
      */
     td {
        border-color : white;
     }
  }
 
  tr:nth-child(2) > td {
     text-align : right;
  }
  
</style>

</head>
<body>
	<main>  
	  <h2>사용자 목록(수정)</h2>
	  <table>
	    <tr>
	      <td>아이디</td>
	      <td>이름</td>
	      <td>이메일</td>
	      <td>포인터</td>
	      <td>가입일</td>	   
	    </tr>
	    <tr>
	      <td colspan="5">
	        [<a href="/Users/WriteForm">사용자 추가</a>]
	      </td>
	    </tr>
	    
	    <c:forEach  var="userVo"  items="${ userList }" >
	    <tr>
	      <td>${ userVo.userid     }</td>
	      <td>
	       <a href="/Users/View?userid=${ userVo.userid }">
	        ${ userVo.username   }
	       </a>
	      </td>
	      <td>${ userVo.email      }</td>	      
	      <td>${ userVo.upoint     }</td>	      
	      <td>${ userVo.indate     }</td>      
	    </tr>
	    </c:forEach>
	    
	    
	  </table>
	
	</main>
</body>
</html>








