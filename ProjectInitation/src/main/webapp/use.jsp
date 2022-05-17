<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come On Yo</title>
    <link rel="stylesheet" type="text/css" href="assets/css/use.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/icon.png" />
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="assets/base.js"></script>

</head>
<body id="use-info">

    <div class="use-page">
        <a href="Main.jsp"><img src="assets/images/logoda.png" ></a>
    </div>

    <div class="outer-div">

        <div id="title">
            <h1>Come on Yo 사용방법</h1>


            <div class="inner-div">
                <table>
                    <tr>
                        <td><img src="screen/1_use_join.png" width="850px" height="700px"></td>
                        <td id="u1">1. 회원가입을 한다</td><br>
                        <td>* 아이디 미중복체크, 비밀번호 미일치 시 아이디 생성 불가</td>
                        
                        
                    </tr>
                    <tr>
                        <td><img src="screen/2_use_login.png"  width="850px" height="700px"></td>
                        <td id="u2">2. 로그인을 한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/3_chose_theme.png"  width="850px" height="700px"></td>
                        <td id="u3">3. 내가 하려는 파티의 테마 이미지를 클릭해서 여러 아이템들을 본다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/4_chose_item.png"  width="850px" height="700px"></td>
                        <td id="u4">4. 마음에 드는 아이템을 클릭한다</td>0
                    </tr>
                    <tr>
                        <td><img src="screen/5_back_next.png"  width="850px" height="700px"></td>
                        <td id="u5">5. 다음 또는 이전 버튼으로 다른 아이템들도 확인할 수 있다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/6_in_item_cart.png"  width="850px" height="700px"></td>
                        <td id="u6">6. 원하는 아이템은 찜하기를 통해 찜목록에 담을 수 있다</td><br>
                        <td>* 찜하기 후 오른쪽 상단의 버튼을 클릭하여 찜목록 펼치기</td>
                    </tr>
                    <tr>
                        <td><img src="screen/7_sub_item.png"  width="850px" height="700px"></td>
                        <td id="u7">7. 찜 목록에 있는 아이템중 해제하고 싶은 아이템은 찜빼기를 활용한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/8_clear_cart.png"  width="850px" height="700px"></td>
                        <td id="u8">8. 찜 목록 비우기로 찜 목록을 한번에 해제할 수도 있다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/9_select_write.png"  width="850px" height="700px"></td>
                        <td id="u9">9. 원하는 아이템을 다 담았다면 초대장 작성하기를 클릭한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/10_write_invite.png"  width="850px" height="700px"></td>
                        <td id="u10">10. 초대장 작성 페이지에서 파티이름, 장소, 날짜를 지정한다</td>
                        <td>* 파티이름, 날짜, 장소, 내용 기입 필수</td>
                    </tr>
                    <tr>
                        <td><img src="screen/11_choice_pic.png"  width="850px" height="700px"></td>
                        <td id="u11">11. 찜 목록들의 아이템들 중에서 대표이미지 하나를 설정한다</td>
                        <td>* 대표 이미지 선택 필수</td>
                    </tr>
                    <tr>
                        <td><img src="screen/12_sel_write.png"  width="850px" height="700px"></td>
                        <td id="u12">12. 초대장 작성과, 대표이미지 설정이 끝나면 '작성하기' 버튼을 클릭한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/13_sel_item.png"  width="850px" height="700px"></td>
                        <td id="u13">13. 나의 Party 모아보기 페이지에서 작성한 항목을 클릭한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/14_click_vote.png"  width="850px" height="700px"></td>
                        <td id="u13">14. 임시 초대장 우측 하단에 ①투표 보내기 클릭</td>
                    </tr>
                    <tr>
                        <td><img src="screen/15_send_vote.png"  width="850px" height="700px"></td>
                        <td id="u13">15. 초대 할 지인들에게 URL을 보낸다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/16_sel_want.png"  width="850px" height="700px"></td>
                        <td id="u14">16. 링크를 받은 지인들은 자신이 원하는 상세목록을 체크 할 수 있다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/17_finish_vote.png"  width="850px" height="700px"></td>
                        <td id="u15">17. 상세목록을 체크한 후 선택하기를 클릭하여 파티주최자에게 보낸다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/18_finish_want.png"  width="850px" height="700px"></td>
                        <td id="u16">18. 상세목록을 받은 주최자는 추천수를 통해 최종선택을 한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/19_enroll_invite.png"  width="850px" height="700px"></td>
                        <td id="u16">19. 선택 후 ②초대장 등록하기를 클릭하여 초대장을 등록한다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/20_send_invite.png"  width="850px" height="700px"></td>
                        <td id="u17">20. ③초대장 보내기 통해 URL을 복사하여 만들어진 초대장을 지인들에게 보낸다</td>
                    </tr>
                    <tr>
                        <td><img src="screen/21_party.jpeg"  width="850px" height="700px"></td>
                        <td id="u18">21. Come On Yo를 통해서 즐겁고 행복한 파티를 즐긴다</td>
                    </tr>
                </table>
            </div>
            <br>
            <br>
            <br>
            <div class="button">
                <input type="button" id="" value="메인으로" onclick="location.href='Main.jsp'">
            </div>
        </div>
        
        <button class="top">
			<img src="assets/images/conged.png" alt="top button">
		</button>
</body>
</html>