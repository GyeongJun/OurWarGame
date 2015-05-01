<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	// ���� ���ϸ� ��Ż�ϴ°ɷ�
%>

<!doctype html>
<html class="no-js" lang="ko">
	<head>
		<meta charset="euc-kr" />
		
		
		
		<!-- viewport�� CSS���� �����϶�µ�...-->
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
		<link rel="stylesheet" href="css/foundation.css" />

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
		<script src="handler_manage.js"></scrip>
		

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
						<li><a href="index.html">����� ������</a></li>
						<li><a id="logout">�α׾ƿ�</a></li>
					</ul>
				</section>
			</nav>
		
	
		
		<ul class="tabs vertical" data-tab>
			<li class="tab-title">
				<a href="#notice" class="item">
					<img src="img/icon/bell.png">
					<label>��������</label>
				</a>
			</li>
			<li class="tab-title">
				<a href="#prob" class="item">
					<img src="img/icon/unknown.png">
					<label>����</label>
				</a>
			</li>
			<li class="tab-title">
				<a  href="#user" class="item">
					<img src="img/icon/users.png">
					<label>�����</label>
				</a>
			</li>
			<li class="tab-title">
				<a href="#hall" class="item">
					<img src="img/icon/unknown.png">
					<label>�?�� ���</label>
				</a>
			</li>
			<li class="tab-title">
				<a href="#panel5" class="item">
					<img src="img/icon/unknown.png">
					<label>Unknown</label>
				</a>
			</li>
		</ul>
		
		<!-- �ǿ� �����ϴ� �ڵ�� -->
		<div class="tabs-content">
			<div class="content active" id="default">
				<div class="small-12 columns">
					<h2 class="Gothic">���� �������� ���Ű��� ȯ���մϴ�.</h2><p/>
					���Ƹ��� ����Ǵ� �ΰ��� ���� �ַ� �������.<br/>
					ž�ٰ� �ʹ� �߸��ѵ� �� Ű���... <br/>
					���� IE�� ���� ���ϴ°� �ƴϾ�. IE�� �� ���� ���ϴ°���.<br/>
					���ڵ� ������ ANSI ���ڵ��� CSS ���� �ѱ��� ���� ��Ʈ ���� ��� �ȵǴ� ���� ����.<br/>
				</div>
			</div>


			<div class="content" id="notice">
				a
			<div>
			
			
			<div class="content" id="prob">
				b
			</div>
			
			
			<div class="content" id="user">
				c
			</div>
		
		
			<div class="content" id="hall">
				d
			</div>

		</div>
	</main>

				
	</body>
	
	
	
	<!-- Load foundation. �ݵ�� �������� ��ġ�ؾ��Ѵ�. -->
	<script>
		//$(document).foundation();
		$(document).foundation({
			tab: {
				callback : function (tab) {
					console.log(tab);	
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