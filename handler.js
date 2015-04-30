$(function(){

	$(document).ready(init);
	$(window).on('hashchange', function() {
		hashChange();
		// on �޼ҵ��� �ι�° ���ڷ� �Լ��� ���޽� 
		// onload�� �����ϰ� �����ϹǷ� �ϴ� �̷��� �ص�.
	});

	$(window).on('load', function() {
		$(window).scrollTop(0);
		
		// �̺�Ʈ ���
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
		$("nav.top-bar .right .dropdown").append("<li><a href=#logout>�α׾ƿ�</a></li>");
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
	$('#main').load(tag + ".html");	//web.xml�� ���� �ٸ� �̸����� ��������.
	
}



/* 
 * Ŭ���̾�Ʈ�� ��û�� ���� ������ �α����� ��û�մϴ�.
 * login �Լ��� �α��� ��ư�� ������ �� �����ϸ� loginModal�� �������̴�.
 * ���̵�� ��й�ȣ�� ������ �� üũ�� �Ѵ�.
 * ������ �α��� ������ ������.
*/
function login() {
	
	var _id = $('formLogin input:text[name="id"]').val();
	var _pw = $('formLogin input:password[name="pw"]').val();

	// ������ �α��� ��û
	var requestData = {id:_id, pw:_pw};
	$.getJSON('login.jsp', requestData, function(data, status) {
		if( data == true ) {
			window.location.reload();
			return true;
		} else {
			swal("�α��ο� �����Ͽ����ϴ�.", "���̵�� ��й�ȣ�� Ȯ�����ּ���.", "error");
			return false;
		}
		
	}).fail(function() {
		swal("�˼��մϴ�.", "�������� ���ῡ �����Ͽ����ϴ�.", "error");
		return false;
	});
	
	return false;
}



/* 
 * Ŭ���̾�Ʈ�� ��û�� ���� ������ ȸ�������� ��û�մϴ�.
 * join �Լ��� �α��� ��ư�� ������ �� �����ϸ� joinModal�� �������̴�.
 * ����ڰ� �Է��� ������ ������ üũ�� �Ѵ�.
 * ������ ���� ������ ������.
*/
function join () {
	
	
	var _id = $('#formJoin input:text[name="id"]').val();
	var _pw = $('#formJoin input:password[name="pw"]').val();
	var _name = $('#formJoin input:text[name="name"]').val();
	
	// ������ ���� ��û
	var requestData = {id:_id, pw:_pw, name:_name};
	$.getJSON('join.jsp', requestData, function(data, status) {
		if( data == true ) {
			window.location.reload();
			return true;
		} else {
			swal("���Կ� �����Ͽ����ϴ�.", "?��?", "error");
		}
		
	}).fail(function() {
		swal("�˼��մϴ�.", "�������� ���ῡ �����Ͽ����ϴ�.", "error");
		return false;
	});
	
	
	return false;
}