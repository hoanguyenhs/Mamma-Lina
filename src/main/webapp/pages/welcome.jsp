<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<jsp:include page="/parts/head.jsp"></jsp:include>
<body>
	<script>
		$(document).ready(function() {
			$("#datepicker").datepicker();
			$("#timepicker").timepicker();
		
			function checkHeight() {
				if( $("#error1").css("display").toLowerCase() == "block") {
					var height = $(".part-two").height();
					var plus = $("#error1").height();
					$(".part-two").height(height + plus + 25);
				} else {
					$(".part-two").height(280);
				}
			}
			
			$("#close-error1").click(function(){
				$("#error1").css("display", "none");
				$(".part-two").height(280);
			});
			
			$("#close-error2").click(function(){
				$("#error2").css("display", "none");
				$(".part-two").height(280);
			});
			
			var error = $("#error2").html();
			if (error.indexOf("null") != -1) {
				$("#error2").css("display", "none");
				$(".part-two").height(280);
			} else {
				$('html, body').animate({
					scrollTop: $(".part-two").offset().top - 40
				}, 2000);
				
				$("#error2").css("display", "block");
				$(".part-two").height(320);
			}
			
			$("#submit").click(function(){
				$("#booking-form").validate({
					rules:{
						name:{required: true},
						phone:{required: true, minlength: 9, maxlength: 11, digits: true},
						email:{required: true, email: true},
						date:{required: true},
						time:{required: true}
					},
					messages:{
						name:{
							required: "Please enter your name.",
						},
						phone:{
							required: "Please enter your phone number.",
							minlength: "Please enter your phone number with 9 digits as minimum.",
							maxlength: "Please enter your phone number with 11 digits as maximum.",
							digits: "Please enter your phone number with digits only."
						},
						email:{
							required: "Please enter your email.",
							email: "Please enter a valid email.",
						},
						date:{
							required: "Please select a booking date.",
						},
						time:{
							required: "Please select a booking time.",
						},
					},
					invalidHandler: function(form, validator) {
				        var errors = validator.numberOfInvalids();
				        if (errors) {
				        	$(".part-two").height(280);
				            var height = $(".part-two").height();
							$(".part-two").height(280 + (errors * 22));
				        }
				    },
					errorLabelContainer: "#error1",
					wrapper: "li",
					highlight: function(element) {
		            	$(element).addClass("highlight");
	              	},
	              	unhighlight: function(element) {
	                 	$(element).removeClass("highlight");
	              	},
				});
			});
		});
	</script>
	<jsp:include page="/parts/header.jsp"></jsp:include>
	<div class="container">
		<div class="part-one">
			<div class="part-one-image"></div>
			<div class="part-one-canvas"></div>
			<div class="part-one-text">
				<h1>It's An Italiano<br/>
				Spaghetti Adventure</h1>
				<div class="part-one-line-cover"><div class="part-one-line"></div></div>
			</div>
		</div>
		<div class="part-two">
			<h1>Book A Table</h1>
			<div id="error1" style="width: 900px; position: relative; margin: 0 auto; background-color: #404040; top: 30px;
			padding: 10px; margin-bottom: 10px; border-radius: 10px; font-size: 15x; color: #FFF; display: none;">
				<div id="close-error1" style="float: right; text-decoration: none; color: #FFF; cursor: pointer; cursor: hand;
				position: relative;">
					X&nbsp;&nbsp;
				</div>
			</div>
			<div id="error2" style="width: 900px; position: relative; margin: 0 auto; background-color: #404040; top: 30px;
			padding: 10px; margin-bottom: 10px; border-radius: 10px; font-size: 15x; color: #FFF; display: none;">
				<%
					out.print(session.getAttribute("message"));
				%>
				<div id="close-error2" style="float: right; text-decoration: none; color: #FFF; cursor: pointer; cursor: hand;
				position: relative;">
					X&nbsp;&nbsp;
				</div>
				<div style="clear: both;"></div>
			</div>
			<form id="booking-form" method="POST" action="${pageContext.request.contextPath}/WelcomeServlet">
				<table class="part-two-table"> 
					<tr>
						<td width="300">Full Name</td>
						<td width="300">Phone</td>
						<td width="300">Email</td>
					</tr>
					<tr>
						<td width="300"><input name="name" class="part-two-textbox" type="text"></td>
						<td width="300"><input name="phone" class="part-two-textbox" type="text"></td>
						<td width="300"><input name="email" class="part-two-textbox" type="text"></td>
					</tr>
					<tr>
						<td width="300">Date</td>
						<td width="300">Time</td>
						<td width="300"></td>
					</tr>
					<tr>
						<td width="300"><input id="datepicker" name="date" class="part-two-textbox" type="text"></td>
						<td width="300"><input id="timepicker" name="time" class="part-two-textbox" type="text"></td>
						<td width="300"><input id="submit" type="submit" class="part-two-button" value="Book"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="part-three">
			<div class="part-three-image"></div>
			<div class="part-three-canvas"></div>
			<div class="part-three-text">
				<h1>FOR PERSONAL TASTE</h1>
				<h2>Let the food melt in your mouth!</h2>
			</div>
		</div>
		<div class="part-four">
			<div class="part-four-left">
				<h1>Discover Our Menu</h1><br>
				<div class="part-four-line-cover"><div class="part-four-line"></div></div>
				<div class="part-four-text"><br>
					Discover our new Menu with a large range of meals, each meals is combine by experience and passion and 
					by using the best pasta in the world "Pata De Ceco", it is the number one pasta in Italy,
					we bring the Italian taste mix up with local ingredients into your meals.<br><br>
					When you come in a specific Restaurant as ours, we know you expect to find a different taste and style. 
					Therefore we try our best and allays it can be improved. We are here to bring something different.<br><br>
				</div><br>
				<a class="part-four-button" href="#">OUR MENU</a>
			</div>
			<div class="part-four-right">
				<div class="part-four-right-up"></div><br>
				<div class="part-four-right-down"></div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="part-five">
			<div class="part-five-image"></div>
			<div class="part-five-canvas"></div>
			<div class="part-five-text">
				<h1>"One cannot think well, love well, sleep well, if one has not dined well."</h1>
				<h2>John Doe</h2>
			</div>
		</div>
	</div>
	<jsp:include page="/parts/footer.jsp"></jsp:include>
</body>
</html>