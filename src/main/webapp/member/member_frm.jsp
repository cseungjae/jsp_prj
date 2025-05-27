<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원가입 처리" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.97/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function findZipcode() {
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr").value = roadAddr;
            document.getElementById("addr2").focus();
            // document.getElementById("addr2").value = data.jibunAddress;
            
           
        }
    }).open();
}





$(function(){

	$('#chkID').click(function() {
	    var left = window.screenX + 200;
	    var top  = window.screenY + 150;
	    window.open('id_dup.jsp', 'idChk', 'width=512,height=313,left=' + left + ',top=' + top);
	});


	  $('#chkPass').blur(function() {
	    var pass    = $('#pass').val();
	    var chkPass = $('#chkPass').val();
	    if (pass !== chkPass) {
	      alert('비밀번호가 일치하지 않습니다.');
	      $('#pass, #chkPass').val('');
	      $('#pass').focus();
	    }
	  });

	  $('#btnZipcode').click(findZipcode);

	  $('#selfIntro').keyup(function() {
	    var text = $(this).val();
	    if (text.length > 500) {
	      alert('500자 초과');
	      $(this).val(text.substring(0, 500));
	    }
	    $('#wordCount').text($(this).val().length);
	  });
	
	  
	  $('#btnConfirm').click(function() {
		    if ($('[name="id"]').val() == "") {
		      alert('아이디는 필수 입력입니다.');
		      $('[name="id"]').focus(); return;
		    }
		    if ($('[name="pass"]').val() == "") {
		      alert('비밀번호는 필수 입력입니다.');
		      $('[name="pass"]').focus(); return;
		    }
		    if ($('[name="name"]').val() == "") {
		      alert('이름은 필수 입력입니다.');
		      $('[name="name"]').focus(); return;
		    }
		    if ($('[name="tel"]').val() == "") {
		      alert('휴대폰은 필수 입력입니다.');
		      $('[name="tel"]').focus(); return;
		    }
		    if ($('[name="tel"]').val().length <11) {
			      alert('휴대폰 번호는 11글자 이상 필수 입력입니다.');
			      $('[name="tel"]').focus(); return;
			    }
		    
		    if ($('[name="email"]').val() == "") {
		      alert('이메일은 필수 입력입니다.');
		      $('[name="email"]').focus(); return;
		    }
		    if ($('[name="zipcode"]').val() == "") {
		      alert('우편번호는 필수 입력입니다.');
		      $('[name="zipcode"]').focus(); return;
		    }
		    if ($('[name="addr"]').val() == "") {
		      alert('주소는 필수 입력입니다.');
		      $('[name="addr"]').focus(); return;
		    }
		    
		    $("#frm").submit();
		  });
	  
	  $("#id").keyup(function(evt) {
		  var id = $("#id").val();
		  
		  if (id.length > 5) {
		    // ▶ id가 6자 이상일 때 AJAX 호출
		    $.ajax({
		      url:      "ajax_id_dup.jsp",
		      type:     "GET",
		      data:     { id: id },
		      dataType: "json",
		      error: function(xhr) {
		        alert("버튼 눌러서 팝업창으로 중복검사");
		        console.log(xhr.status);
		      },
		      success: function(jsonObj) {
		        // ▶ 여기서 if–else 처리
		        var msg, color;
		        if (jsonObj.idFlag) {
		          msg   = "사용가능";
		          color = "0000FF";
		        } else {
		          msg   = "이미 사용중";
		          color = "FF0000";
		        }
$("#idOutput").html("<span style='color:#" + color + "'>" + msg + "</span>");
		      }
		    });
		  } else {
		    // ▶ id가 5자 이하일 때
		    $("#idOutput").html("아이디를 검증하세요.");
		  }

		}); 

	  
	  
	  
	  
	
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">


  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>

</header>
<main>
<div id="container">
	
<h2>회원가입 양식</h2>

<iframe src="http://192.168.10.68/html_prj/css0410/scrollbar.html" 
        style="border: 0px; width: 1420px; height: 200px"></iframe>

<form action="member_process.jsp" name="frm" id="frm" method="post">
  <table>
    <tr>
      <th>* 아이디</th>
      <td>
        <input type="text" name="id" id="id" maxlength="20" class="inputBox" style="width:120px">
        <input type="button" value="ID중복확인" class="btnBox" id="chkID"><br>
        <div id="idOutput"></div>
      </td>
    </tr>
    <tr>
      <th>* 비밀번호</th>
      <td>
        <input type="password" name="pass" id="pass" class="inputBox" style="width:200px">
        비밀번호 확인
        <input type="password" name="chkPass" id="chkPass" class="inputBox" style="width:200px">
      </td>
    </tr>
    <tr>
      <th>* 이름</th>
      <td colspan="3"><input type="text" name="name" class="inputBox" style="width:150px"></td>
    </tr>
    <tr>
      <th>생일</th>
      <td colspan="3"><input type="text" name="birth" class="inputBox" style="width:150px"></td>
    </tr>
    <tr>
      <th>연락처</th>
      <td colspan="3"><input type="text" name="tel2" class="inputBox" style="width:130px"></td>
    </tr>
    <tr>
      <th>* 휴대폰</th>
      <td colspan="3">
        <input type="text" name="tel" class="inputBox" style="width:130px">
        <input type="checkbox" name="reception"> 수신
      </td>
    </tr>
    <tr>
      <th>* 이메일</th>
      <td colspan="3">
        <input type="text" name="email" class="inputBox" style="width:250px">@ 
        <input type="text" name="domain" list="domain" class="inputBox" style="width:150px">
        <datalist id="domain">
          <option value="daum.net">
          <option value="gmail.com">
          <option value="hotmail.com">
          <option value="nate.com">
          <option value="korea.com">
          <option value="직접 입력">
        </datalist>
        <input type="checkbox" name="reception2"> 수신
      </td>
    </tr>
    <tr>
      <th>* 성별</th>
      <td>
        <input type="radio" name="gender" class="gender" value="남자" checked> 남자
        <input type="radio" name="gender" class="gender" value="여자"> 여자
      </td>
    </tr>
    <tr>
      <th>소재지</th>
      <td>
        <select name="region" id="region" style="height:32px; width:160px">
          <option value="선택해주세요">선택해주세요</option>
          <option value="강원">강원</option>
          <option value="경기">경기</option>
          <option value="경남">경남</option>
          <option value="경북">경북</option>
          <option value="광주">광주</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>* 우편번호</th>
      <td colspan="3">
        <input type="text" name="zipcode" id="zipcode" readonly class="inputBox" style="width:60px">
        <input type="button" value="우편번호검색" id="btnZipcode">
      </td>
    </tr>
    <tr>
      <th>* 주소</th>
      <td>
        <input type="text" name="addr" id="addr" readonly class="inputBox" style="width:500px"><br>
        <input type="text" name="addr2" id="addr2" class="inputBox" style="width:500px">
      </td>
    </tr>
    <tr>
      <th>자기소개</th>
      <td>
        <textarea id="intro" name="intro" style="width:500px; height:100px"></textarea>
        <div style="text-align:right; padding-right:20px;">
          <span id="wordCount">0</span>/500
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="button" value="확인" id="btnConfirm">
        <input type="button" value="취소" id="btnCancel">
      </td>
    </tr>
  </table>
</form>

</div>
</main>
<footer class="text-body-secondary py-5">

    
 <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>

</footer>


</body>
</html>	