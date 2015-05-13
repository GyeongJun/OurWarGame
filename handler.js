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
		
		if(data.menuList == null) {
			$('.pre-login').removeClass('hide'); 		// show
			return ;			// Login fail
		}
		
		// 로그인 시 메뉴 추가.
		var name = data.name;
		var menuList = data.menuList;
		
		$("nav.top-bar .right .dropdown").empty();
		$("nav.top-bar .right .dropdown").append("<li><a href=#logout>로그아웃</a></li>");
		for( idx in menuList ) {
			var menu 	= menuList[idx].menu;
			var url 	= menuList[idx].url;
			$("nav.top-bar .right .dropdown").append("<li><a href=" + url + ">" + menu + "</a></li>");
		}
		$('.pre-login').addClass('hide'); 		// hide
		$('.post-login').removeClass('hide'); 	// show
		
	}).fail(function() {
		// 최초에 이게 뜨는 현상이 있음.
		alert("Failed getJSON func");
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
	
	var _id = $('#formLogin input:text[name="id"]').val();
	var _pw = $('#formLogin input:password[name="pw"]').val();

	// 서버에 로그인 요청
	var requestData = {id:_id, pw:_pw};
	$.getJSON('login.jsp', requestData, function(data, status) {
		if( data.result == "true" ) {
			window.location.reload();
			return true;
		} else {
			swal("로그인에 실패하였습니다.", "아이디와 비밀번호를 확인해주세요.", "error");
			return false;
		}
		
	}).fail(function(data, status) {
		alert(data.reuslt);
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
		if( data.result == "true" ) {
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

/* 
 * 로그아웃 페이지로 리다이렉션 시킨다.
 * 로그아웃 페이지에선 세션을 지운 후 index 페이지로 리다이렉션 시킨다.
*/
function logout () {
	$(location).attr('href',"logout.jsp");
}