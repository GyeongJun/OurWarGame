$(function(){

	$(document).ready(init);
	$(window).on('hashchange', function() {
		hashChange();
		// on �޼ҵ��� �ι�° ���ڷ� �Լ��� ��޽� 
		// onload�� �����ϰ� �����ϹǷ� �ϴ� �̷��� �ص�.
	});

	$(window).on('load', function() {
		$(window).scrollTop(0);
		hashChange("onLoad");
	});
	


	
})

function init() {

//  Initialize management menu
	$('#notice').load("notice_manage.html");
	$('#prob').load("prob_manage.html");
	$('#user').load("user_manage.html");
	$('#hall').load("hall_manage.html");
		

}

function hashChange(caller) {
	
	var tag = window.location.hash.substr(1, window.location.hash.length);
	if( tag=="" && caller=="onLoad") {
		//window.location.hash = "Notice"
		window.location.reload();
		return ;
	}

	//$('#main').empty();
	//$('#main').load(tag + ".html");	//web.xml�� ���� �ٸ� �̸����� ��������.
	
	


}


function loadNotice(box) {
	
}