<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hoanguyenhs.mammalina.MySQLAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/parts/head.jsp"></jsp:include>
<body>
	<jsp:include page="/parts/header.jsp"></jsp:include>
	<div class="container">
		<div class="part-one">
			<div class="part-one-image" style="background-image: url('../images/menu-image.jpg'); 
			background-position: center bottom"></div>
			<div class="part-one-canvas"></div>
			<div class="part-one-text">
				<h1>Discover Our Menu<br>Let The Journey Begin</h1>
				<div class="part-one-line-cover"><div class="part-one-line"></div></div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				$(".dish").hover(
					function() {
						$(this).find(".dish-info").css({"left": "-297px"}).stop().animate({
		                    'left' : '0px'
		                });
					},
					function() {
						$(this).find(".dish-info").css({"left": "0px"}).stop().animate({
		                    'left' : '-297px'
		                });
					}
				);
			});
		</script>
		<div style="width: 900px; margin: 0 auto; color: #5F0D0C;">
			<%
				MySQLAccess sqlAccess = new MySQLAccess();
				ResultSet dishGroup = sqlAccess.execute("select * from dish_group");
				while (dishGroup.next()) {
					out.print("<div style='text-align: center; font-family: cursive; font-size: 30px;'>"
							+ dishGroup.getString("tittle") + "</div>");
					out.print("<div style='text-align: center; font-family: cursive; font-size: 12px;'><i>( "
							+ dishGroup.getString("description") + " )</i></div>");
					ResultSet dish = sqlAccess.execute("select * from dish d where d.group=" + dishGroup.getString("id"));
					while (dish.next()) {
						if (Integer.parseInt(dish.getString("group")) <= 7) {
							out.print(
									"<div class='dish' style='width: 297px; height: 180px; display: inline-block; overflow: hidden;'>");
							out.print("<div style='text-align: center; font-family: cursive; font-size: 15px;'><b>"
									+ dish.getString("name") + "</b></div>");
							out.print("<div style='width: 297px; height: 150px; background-image: url(\"../menu/"
									+ dish.getString("image")
									+ ".jpg\"); background-size: cover; background-position: 60%;'></div>");
							out.print(
									"<div style='width: 40px; height: 40px; border: 3px solid red; border-radius: 23px; color: black; position: relative;");
							out.print(
									"top: -140px; left: 241px; font-size: 20px; background-color: white; text-align: center; line-height: 40px;'>"
											+ dish.getString("value") + "</div>");
							out.print(
									"<div class='dish-info' style='width: 277px; height: 81px; background-color: rgba(186, 26, 24, 0.7);");
							out.print(
									"display: block; position: relative; top: -195px; left: -297px; text-align: center; color: white; font-size: 15px; padding: 50px 10px 20px 10px;'><i>");
							out.print(dish.getString("description") + "</i></div></div>");
						} else {
							out.print("<div style='width: 800px; margin: 0 auto;'>");
							out.print("<div style='text-align: center; font-family: cursive; font-size: 15px; float: left;'>"+dish.getString("name")+"</div>");
							out.print("<div style='text-align: center; font-family: cursive; font-size: 15px; float: right;'>"+dish.getString("value")+"</div>");
							out.print("<div style='clear: both;'></div></div>");
						}
					}
					out.print(
							"<div style='height: 15px; margin: 0 auto; overflow-y: hidden; position: relative; width: 900px;'>"
									+ "<div style='background-image: url(\"../images/black-line.png\"); "
									+ "background-position: center; background-repeat: repeat; height: 15px; width: 900px;'></div></div>");
				}
				sqlAccess.close();
			%>
		</div>
	</div>
	<jsp:include page="/parts/footer.jsp"></jsp:include>
</body>
</html>