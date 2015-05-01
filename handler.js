$(function(){

	$(document).ready(init);
	$(window).on('hashchange', function() {
		hashChange();
		// on 메소드의 두번째 인자로 함수명 전달시 
		// onload와 동일하게 동작하므로 일단 이렇게 해둠.
	});

	$(window).on('load', function() {
		$(window).scrollTop(0);
		
		// 이벤트 등록
		$('#formLogin').on('valid.fndtn.abide', login);
		$('#formJoin').on('valid.fndtn.abide', join);
		
		hashChange("onLoad");
	});

})

function init() {

	// Initialize user menu
	$.getJSON('getUserMenu.jsp', function(data, status) {
		if(data.length == 0) return ;			// Login fail
		$("nav.top-bar .right .dropdown").empty();
		for( idx in data ) {
			var link 	= data[idx].link;
			var name 	= data[idx].name;
			$("nav.top-bar .right .dropdown").append("<li><a href=" + link + ">" + name + "</a></li>");
		}
		$("nav.top-bar .right .dropdown").append("<li><a href=#logout>로그아웃</a></li>");
		$('.pre-login').addClass('hide'); 		// hide
		$('.post-login').removeClass('hide'); 	// show
		
	}).fail(function() {
		//alert("Failed getJSON func");
	});

}

function hashChange(caller) {
	
	var tag = window.location.hash.substr(1, window.location.hash.length);
	if( tag=="" && caller=="onLoad") {
		window.location.hash = "Notice"
		window.location.reload();
		return ;
	}

	$('#main').empty();
	$('#main').load(tag + ".html");	//web.xml을 통해 다른 이름으로 매핑하자.
	
}



/* 
 * 클라이언트의 요청에 따라 서버에 로그인을 요청합니다.
 * login 함수는 로그인 버튼이 눌렸을 때 동작하며 loginModal에 종속적이다.
 * 아이디와 비밀번호를 가져와 값 체크를 한다.
 * 서버에 로그인 쿼리를 던진다.
*/
function login() {
	
	var _id = $('formLogin input:text[name="id"]').val();
	var _pw = $('formLogin input:password[name="pw"]').val();

	// 서버에 로그인 요청
	var requestData = {id:_id, pw:_pw};
	$.getJSON('login.jsp', requestData, function(data, status) {
		if( data == true ) {
			window.location.reload();
			return true;
		} else {
			swal("로그인에 실패하였습니다.", "아이디와 비밀번호를 확인해주세요.", "error");
			return false;
		}
		
	}).fail(function() {
		swal("죄송합니다.", "서버로의 연결에 실패하였습니다.", "error");
		return false;
	});
	
	return false;
}



/* 
 * 클라이언트의 요청에 따라 서버에 회원가입을 요청합니다.
 * join 함수는 로그인 버튼이 눌렸을 때 동작하며 joinModal에 종속적이다.
 * 사용자가 입력한 값들을 가져와 체크를 한다.
 * 서버에 가입 쿼리를 던진다.
*/
function join () {
	
	
	var _id = $('#formJoin input:text[name="id"]').val();
	var _pw = $('#formJoin input:password[name="pw"]').val();
	var _name = $('#formJoin input:text[name="name"]').val();
	
	// 서버에 가입 요청
	var requestData = {id:_id, pw:_pw, name:_name};
	$.getJSON('join.jsp', requestData, function(data, status) {
		if( data == true ) {
			window.location.reload();
			return true;
		} else {
			swal("가입에 실패하였습니다.", "?까?", "error");
		}
		
	}).fail(function() {
		swal("죄송합니다.", "서버로의 연결에 실패하였습니다.", "error");
		return false;
	});
	
	
	return false;
}