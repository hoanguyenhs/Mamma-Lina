<div class="header">
	<div class="header-container">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/header-logo.png" width="70px"/>
			<span class="logo-text">
				Ristorante Italiano
			</span>
		</div>
		<script>
			$(document).ready(function(){
				var url = document.URL;
				if (url.indexOf("welcome") != -1) {
					$("#item1").addClass("active");
					$("#item2").removeClass("active");
					$("#item3").removeClass("active");
					$("#item4").removeClass("active");
				} else if (url.indexOf("menu") != -1) {
					$("#item1").removeClass("active");
					$("#item2").addClass("active");
					$("#item3").removeClass("active");
					$("#item4").removeClass("active");
				} else if (url.indexOf("about") != -1) {
					$("#item1").removeClass("active");
					$("#item2").removeClass("active");
					$("#item3").addClass("active");
					$("#item4").removeClass("active");
				} else if (url.indexOf("contact") != -1) {
					$("#item1").removeClass("active");
					$("#item2").removeClass("active");
					$("#item3").removeClass("active");
					$("#item4").addClass("active");
				}
			});
		</script>
		<div class="menu">
			<div id="item1" class="menu-item">
				<a href="${pageContext.request.contextPath}/WelcomeServlet">Welcome</a>
			</div>
			<div id="item2" class="menu-item">
				<a href="${pageContext.request.contextPath}/pages/menu.jsp">Menu</a>
			</div>
			<div id="item3" class="menu-item">
				<a href="${pageContext.request.contextPath}/pages/about.jsp">About</a>
			</div>
			<div id="item4" class="menu-item">
				<a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</div>