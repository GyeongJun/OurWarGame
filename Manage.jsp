<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	// 인증 못하면 광탈하는걸로
%>

<!doctype html>
<html class="no-js" lang="ko">
	<head>
		<meta charset="utf-8" />
		
		
		<!-- viewport를 CSS에서 구현하라는데...-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<title>Index | WarGame</title>

		<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<!-- Load foundation and jquery library -->
		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>

		<!-- check html5 browser -->
		<script src="js/vendor/modernizr.js"></script>

		<!-- Load foundation css -->
		<link rel="stylesheet" href="contextStyle.css" />
		<link rel="stylesheet" href="css/foundation.css" />
		

		<!-- Bootstrap Core CSS -->
		<link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- MetisMenu CSS -->
		<link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!-- Custom Fonts -->
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->


		<!-- JS extension for Topbar -->	
		<script src="js/foundation/foundation.dropdown.js"></script>
		<script src="js/foundation/foundation.topbar.js"></script>
		<script src="js/foundation/foundation.alert.js"></script>
		
		
		<!-- Define custom css and hook foundation css -->		
		<link rel="stylesheet" href="common.css" />
		<link rel="stylesheet" href="manage_layout.css" />
		
		
		
		<!-- Load sweet alert -->
		<script src="sweetalert-master/lib/sweet-alert.min.js"></script>
		<link rel="stylesheet" href="sweetalert-master/lib/sweet-alert.css">
		
	<!-- Load event handler -->
		<script src="handler_manage.js"></script>
		

	</head>

	<body>
	
	<main class="fixed">
		<!-- TOPBAR -->		
		<nav class="top-bar" data-topbar role="navigation">
			<ul class="title-area">
				<li class="name">
					<h1><a>K.KNOCK</a></h1>
				</li>

			</ul>

			<section class="top-bar-section">
			<!-- Right Nav Section -->
				<ul class="right">
					<li><a href="index.html">사용자 페이지</a></li>
					<li><a id="logout">로그아웃</a></li>
				</ul>
			</section>
		</nav>

		
	
		
		<ul class="tabs vertical" data-tab>
			<li class="tab-title">
				<a href="#notice" class="item">
					<img src="img/icon/bell.png">
					<label>공지사항</label>
				</a>
			</li>
			<li class="tab-title">
				<a href="#prob" class="item">
					<img src="img/icon/unknown.png">
					<label>문제</label>
				</a>
			</li>
			<li class="tab-title">
				<a  href="#user" class="item">
					<img src="img/icon/users.png">
					<label>사용자</label>
				</a>
			</li>
			<li class="tab-title">
				<a href="#hall" class="item">
					<img src="img/icon/unknown.png">
					<label>명예의 전당</label>
				</a>
			</li>
			<li class="tab-title">
				<a href="#panel5" class="item">
					<img src="img/icon/unknown.png">
					<label>Unknown</label>
				</a>
			</li>
		</ul>
		
		<!-- 탭에 대응하는 코드들 -->
		<div class="tabs-content">
			<div class="content active" id="default">
				<div>
					<h2 class="Gothic">관리자 페이지에 오신것을 환영합니다.</h2><p/>
					동아리가 연상되는 두가지 색을 주로 사용하자.<br/>
					탑바가 너무 야리한데 좀 키울까... <br/>
					내가 IE를 지원 안하는게 아니야. IE가 날 지원 안하는거지.<br/>
				</div>
			</div>


			<div class="content" id="notice">
				
			</div>
			
			
			<div class="content" id="prob">
				
			</div>
			
			
			<div class="content" id="user">
				
			</div>
		
		
			<div class="content" id="hall">
				
			</div>

		</div>
	</main>
	
	<nav id="context-menu" class="context-menu">
		<ul class="context-menu__items">
			<li class="context-menu__item">
				<a href="#" class="context-menu__link" data-action="View"><i class="fa fa-eye"></i> View Task</a>
			</li>
			<li class="context-menu__item">
				<a href="#" class="context-menu__link" data-action="Edit"><i class="fa fa-edit"></i> Edit Task</a>
			</li>
			<li class="context-menu__item">
				<a href="#" class="context-menu__link" data-action="Delete"><i class="fa fa-times"></i> Delete Task</a>
			</li>
		</ul>
	</nav>

				
	</body>
	
	
	
	<!-- Load foundation. 반드시 마지막에 위치해야한다. -->
	<script>
		//$(document).foundation();
		$(document).foundation({
			tab: {
				callback : function (tab) {
					//console.log(tab);	
				}
			}
		});
			
			
		function getProblemList() {
			$.getJSON('getProblem.jsp', function(data, status) {
				return data;
			}).fail(function() {
				return false;
			});	
		}
	</script>
	
</html>