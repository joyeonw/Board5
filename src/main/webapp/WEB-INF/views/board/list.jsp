<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet"  href="/css/common.css" />

<style>
 
  #table {
	  td { 
	    padding     : 10px;
	    text-align  : center; 
	  }
	  
	  td:nth-of-type(1) { width : 100px; }  
	  td:nth-of-type(2) { width : 380px; text-align : left;  }  
	  td:nth-of-type(3) { width : 110px; }  
	  td:nth-of-type(4) { width : 110px; }  
	  td:nth-of-type(5) { width : 100px; }
	  
	  tr:first-child > td { text-align:center; }
	   
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
  }

<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</style>

</head>
<body>	
	<main>  
	  
	 <%@include file="/WEB-INF/include/menus.jsp" %>
	
	  <h2>게시물 목록</h2>
	  <table id="table" >
	    <tr>
	      <td>번호</td>
	      <td>제목</td>
	      <td>작성자</td>	      
	      <td>작성일</td>	   
	      <td>조회수</td>	   
	    </tr>
	    <tr>
	      <td colspan="5">
	        [<a href="/">HOME</a>]&nbsp;&nbsp;&nbsp;	    
	        [<a href="/Board/WriteForm?menu_id=${ menu_id }">새 글 추가</a>]
	      </td>
	    </tr>
	    
	    <c:forEach  var="boardVo"  items="${ boardList }" >
	    <tr>
	      <td>${ boardVo.bno   }</td>
	      <td>
	       <a href="/Board/View?bno=${ boardVo.bno }">
	          ${ boardVo.title       }
	       </a>
	      </td>	      	      
	      <td>${ boardVo.writer      }</td>	      
	      <td>${ boardVo.regdate     }</td>      
	      <td>${ boardVo.hit         }</td>      
	    </tr>
	    </c:forEach>
	    
	    
	  </table>
	
	</main>
</body>
</html>








