<%@page import="xe.smhrd.model.BoardDAO"%>
<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/css/invitepage.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/icon.png" />
    <title>Come On Yo</title>
    <style>
        #wrap {
            padding-left: 50px;
        }
        table {
            border: 3.5px solid #FFC99A;
            font-size: 20px;
        }
        #button1 {
            height: 55px;
        }
        #button2 {
            height: 55px;
        }
        table, tr, td {
            padding: 0px;
            margin: 0px;
            background-color: rgba(255, 250, 240, 0.7);
        }
        #wr-ta {
            margin-right: 30px;
        }
        #null_list {
            font-family: 'NanumBarunpen';
            font-size: 100px;
        }
    </style>
</head>
<body id="write-info">
<div class="write-page">
    <a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
</div>

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
			<div id="wrap" style="float:left; width:auto;">
				<table id="wr-ta" width="650px" height="600px">
					 <tr height="50px" width="50px">
                        <th id="th1"><%=bvo.getP_name() %></th>
                        <th>대표이미지 설정
                            <input type="checkbox" name="p_id" value="<%=bvo.getP_id()%>">
                        </th>
                    </tr>
                    
                    <tr align="center">
                		<td id="content" rowspan="2">
                		<img src="img/<%=bvo.getP_img()%>" alt="<%=bvo.getP_name() %>" width="450px" height="500px"></td>
           		 	</tr>
           		 	
           		 	<tr height="100%">
                    	<td id="list" align="center">
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
		
		
            
    <div style=" float:left; width:auto">       
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
              	<th colspan="2" align="center">보내고 싶은 내용▼</th>
              <tr height="35px" bgcolor="whitesmoke">
                <td align="right" colspan="2" >
              		<textarea name="content" cols="85" rows="28">
			   	★☆당신을 초대합니다☆★
                        
			▶▷적고 싶은 내용을 적으세요◁◀
                    </textarea>
                </td>
              </tr>
             	       
              <tr height="35px" bgcolor="whitesmoke">
              	<td colspan="2" align="center">
                	<input type="submit" value="작성하기" style="background-color: #FFC99A; border: #FFC99A;">
                    <input type="reset" value="초기화" style="background-color: #FFC99A; border: #FFC99A;">
                </td>
              </tr>
          </table>
    </div>
 
</form>

</body>
</html>