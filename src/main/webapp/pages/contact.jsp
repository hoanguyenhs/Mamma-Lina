<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<jsp:include page="/parts/head.jsp"></jsp:include>
<body>
	<script>
		$(document).ready(function() {
			$('#datepicker').datepicker();
			
			$("#close-error1").click(function(){
				$("#error1").css("display", "none");
			});
			
			$("#close-error2").click(function(){
				$("#error2").css("display", "none");
			});
			
			var error = $("#error2").html();
			if (error.indexOf("null") != -1) {
				$("#error2").css("display", "none");
			} else {
				$("#error2").css("display", "block");
			}
			
			$("#contact-form").validate({
				rules:{
					name:{required: true},
					phone:{required: true, minlength: 9, maxlength: 11, digits: true},
					email:{required: true, email: true},
					message:{required: true},
				},
				messages:{
					name:{
						required: "Please enter your full name.",
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
					message:{
						required: "Please enter your message.",
					},
				},
				errorLabelContainer: "#error1",
				wrapper: "li"
			});
		});
	</script>
	<jsp:include page="/parts/header.jsp"></jsp:include>
	<div class="container">
		<div id="big-image" style="overflow-y: hidden; height: 325px; position: relative;">
			<div id="part-five-image" style="background-image: url('../images/contact-image.jpg'); width: 100%;
			background-position: center center; background-repeat: no-repeat; background-size: cover; height: 300px;"></div>
			<div id="canvas" style="background-color: rgba(59, 44, 56, 0.4); background-repeat: no-repeat; height: 300px;
    		position: absolute; top: 0; width: 100%;"></div>
			<div class="part-five-text" style="position: relative; top: -160px;">
				<h1>Contact Us</h1>
			</div>
		</div>
		<div id="error1" style="width: 900px; position: relative; margin: 0 auto; background-color: #d9534f;
		padding: 10px; margin-bottom: 10px; border-radius: 10px; font-size: 15x; color: #FFF; display: none;">
			<div id="close-error1" style="float: right; text-decoration: none; color: #FFF; cursor: pointer; cursor: hand;
			position: relative;">
				X&nbsp;&nbsp;
			</div>
		</div>
		<div id="error2" style="width: 900px; position: relative; margin: 0 auto; background-color: #d9534f;
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
		<form id="contact-form" method="POST" action="${pageContext.request.contextPath}/ContactServlet">
			<div id="contact" style="position: relative; width: 900px; margin: 0 auto; height: 350px;">
				<div id="left" style="float: left; width: 450px;">
					<div style="font-size: 20px; margin-bottom: 7px; color: #5F0D0C">
						Name
					</div>
					<input type="text" name="name" style="width: 440px; font-size: 20px; height: 58px; padding: 5px; margin-bottom: 7px">
					<div style="font-size: 20px; margin-bottom: 7px; color: #5F0D0C">
						Phone
					</div>
					<input type="text" name="phone" style="width: 440px; font-size: 20px; height: 58px; padding: 5px; margin-bottom: 7px">
					<div style="font-size: 20px; margin-bottom: 7px; color: #5F0D0C">
						Email
					</div>
					<input type="text" name="email" style="width: 440px; font-size: 20px; height: 58px; padding: 5px; margin-bottom: 7px">
				</div>
				<div id="right" style="float: right; width: 450px;">
					<div style="font-size: 20px; margin-bottom: 7px; color: #5F0D0C">
						Message
					</div>
					<textarea name="message" style="width: 450px; font-size: 20px; height: 250px; padding: 5px; margin-bottom: 7px;
					resize: none;"></textarea>
					<input id="contact-submit" type="submit" style="width: 200px; font-size: 15px; height: 50px; padding: 5px; margin-bottom: 7px;
					float: right; color: #5F0D0C; border: 1px solid #5F0D0C;" value="Submit">
				</div>
				<div style="clear: both;"></div>
			</div>
		</form>
	</div>
	<jsp:include page="/parts/footer.jsp"></jsp:include>
</body>
</html>