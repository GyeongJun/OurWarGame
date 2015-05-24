$(function(){

	$(document).ready(init);
	$(window).on('hashchange', function() {
		hashChange();
		// on 메소드의 두번째 인자로 함수명 전달시 
		// onload와 동일하게 동작하므로 일단 이렇게 해둠.
	});

	$(window).on('load', function() {
		$(window).scrollTop(0);
		hashChange("onLoad");
	});
	
	
})

function init() {

//  Initialize management menu
	
	$('#notice').empty().load("manager_page/notice_manage.html");
	$('#prob').empty().load("manager_page/problem_manage.html");
	$('#user').empty().load("manager_page/user_manage.html", function() {

		$.getScript("contextHandler.js").fail(function(jqxhr, settings, exception) {
			console.log(jqxhr, settings, exception);
		});
		
	});
	$('#hall').empty().load("hall_manage.html");
	
	
	
	/*
	if (document.addEventListener) {
        document.addEventListener('contextmenu', function(e) {
			alert(0);

			e.preventDefault();
        }, false);
    } else {
        document.attachEvent('oncontextmenu', function() {	// IE8 이하
            alert("You've tried to open context menu");
            window.event.returnValue = false;
        });
    }
	*/
 
 
}

function hashChange(caller) {
	
	var tag = window.location.hash.substr(1, window.location.hash.length);
	if( tag=="" && caller=="onLoad") {
		//window.location.hash = "Notice"
		//window.location.reload();
		return ;
	}

	//$('#main').empty();
	//$('#main').load(tag + ".html");	//web.xml을 통해 다른 이름으로 매핑하자.

}


function getProblemList() {
	$.getJSON('getProblem.jsp', function(data, status) {
		return data;
	}).fail(function() {
		return false;
	});	
}
	
function setProblemList(data) {

	for( idx in data.system ) {
		console.log(data.system[idx].con);
		
		var content = "";
		
		if( data.system[idx].solved == "y")
			content = '<li><a href="#" class="button success radius" num=';
		else 
			content = '<li><a href="#" class="button secondary radius" num=';
		
		content +=  data.system[idx].num + 
		'>'+ data.system[idx].con + '<br/>' + data.system[idx].point + '</a></li>'
		$("#SystemGrid").append(content);
		
		console.log(content);		
	}

}