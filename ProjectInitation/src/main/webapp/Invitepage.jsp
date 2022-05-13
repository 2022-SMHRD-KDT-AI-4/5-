<%@page import="xe.smhrd.model.BoardDAO"%>
<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write Invite Page</title>
</head>
<body>
    <form action="InviteService" method="post">
        <h1>초대장 작성하기</h1>
<%
	List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");
	BoardDAO dao = new BoardDAO();
	if(cartList == null){
%>
<span id="null_list">찜 목록이 비었습니다.</span>
<%
	}else{
		for(BoardVO bvo : cartList){%>
			<div style="border: 1px solid gold; float:left; width:auto">
				<table width="650px" height="600px">
					 <tr bgcolor="pink" height="50px" width="50px">
                        <th id="th1"><%=bvo.getP_name() %></th>
                        <th>대표이미지 설정
                            <input type="checkbox" name="p_id" value="<%=bvo.getP_id()%>">
                        </th>
                    </tr>
                    
                    <tr align="center">
                		<td id="content" rowspan="2"><img src="img/<%=bvo.getP_img()%>" alt="<%=bvo.getP_name() %>" width="450px" height="500px"></td>
           		 	</tr>
           		 	
           		 	<tr height="100%">
                    	<td id="list" align="center" bgcolor="skyblue">
                    	<%
                    		List<BoardVO> ilist = dao.selectPartyItemList(bvo.getP_id());
                    		for(BoardVO ivo : ilist){ // 해당 파티에 아이템 항목들을 불러오는 for문
                    	%>
                        	<li align="left"><%=ivo.getI_name()%></li>
                        <%} // 두번째 for문 닫히는 지점%>	
                    	</td>    
            		</tr>


<%			
		} //첫번째 for문 닫히는 지점
%>
				</table>
<%
	} // else 문 끝나는 지점
%>
		</div>
		
		
            
    <div style="border: 1px solid blue; float:left; width:auto">       
          <table width="600px" height="600px">             
              <tr height="35px" bgcolor="whitesmoke">
                  <td align="right">파티이름 : </td>
                  <td><input type="text" name="name"></td>
              </tr>
  
              <tr height="35px" bgcolor="whitesmoke">
                  <td align="right">파티일자 : </td>
                  <td><input type="date" name="date"></td>
              </tr>
  
              <tr height="35px" bgcolor="whitesmoke">
                  <td align="right">장소 : </td>
                  <td><input type="text" name="address"></td>
                 
              </tr>
              
              <tr bgcolor="gray" height="35px">
              	<th colspan="2" align="center">기타 필요한 사항을 적어주세요▼</th>
                	<tr height="35px" bgcolor="whitesmoke">
                    	<td align="right" colspan="2" >
                          <textarea name="content" cols="85" rows="28"></textarea>
                        </td>
                    </tr>
             	       
             	    <tr height="35px" bgcolor="whitesmoke">
                    	<td colspan="2" align="center">
                        	<input type="submit" value="작성하기">
                            <input type="reset" value="초기화">
                        </td>
                   </tr>
                </th>
             </tr>
          </table>
      </div>
      
    </form>

</body>
</html>