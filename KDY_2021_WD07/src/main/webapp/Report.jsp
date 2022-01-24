<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
String id = request.getParameter("itemID");
String id1 = request.getParameter("iteID");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "kdy_2021_wd07";
String userid = "root";
String password = "#Group20";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monthly Delivery Report</title>
<script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
<script> 
	function generatePDF(){
	
	const element = document.getElementById("sales");
	
	html2pdf()
	.from(element)
	.save();
	}
</script>
	</script>
	
	
	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
	
	<style>.hello{background-image: url("1111.jpg")}</style>
	
	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min1.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style1.css" />
</head>
<body>


<header id="header1"><!--header-->

<img id=img src="images/shop/header.jpg" alt="" width=100% height=50/>
<img src="images/home/logo1.png" alt="" height=40/>

<!-- --------------------------------------------------------------------------------- -->		
	</header><!--/header--><br/><br/>
	
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
<!-- --------------------------------------------------------------------------------- -->  



<div class="booking-table">
	<div id="Sales">
		<div class="booking-form">
			<div class="form-header">
				<h1>Sales Report</h1>
			</div>
		</div>
				<center><table id="table" border="3">
							<tr id="dlt">
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Item ID</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Item Name</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Item Quantity</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Order Quantity</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Return Count</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Remain Item</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Percentage</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Item Price Rs.</b>&nbsp</h4></th>
									<th id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Sales Rs.</b>&nbsp</h4></th>
									
		
							</tr>
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									String sql ="SELECT *,item.ItemId, item.ItemName, item.ItemQuantity ,item.ItemPrice, sum(ordercontain.quantity), sum(ordercontain.returnCount) FROM item , ordercontain,shop where item.ItemID=shop.ITID and ordercontain.IteID=shop.ITID  group by ordercontain.IteID";
									resultSet = statement.executeQuery(sql);
									int Quantity;
									int order;
									int retn=0;
									int remain=0;
									int result=0;
									int sales=0;
									long all=0;
									long percentage =0;
									int price=0;
									int add=0;
									while(resultSet.next()){
							%>
							<tr>
									<td><h4 class="table-label"><%=resultSet.getString("ItemID") %></h4></td>
									<td><h4 class="table-label"><%=resultSet.getString("ItemName") %></h4></td>
									<td><h4 class="table-label"><%=Quantity=resultSet.getInt("ItemQuantity") %></h4></td>
									
									<td><h4 class="table-label"><%=order=resultSet.getInt("sum(ordercontain.quantity)") %></h4></td>
									<td><h4 class="table-label"><%=retn=resultSet.getInt("sum(ordercontain.returnCount)") %></h4></td>
									<%remain=Quantity-order;%>
									<td><h4 class="table-label"><%=result=remain+retn%></h4></td>
									<%sales=order-retn;%>
									<%all=sales*100;%>
									<td><h4 class="table-label"><%=percentage=all/Quantity%>%</h4></td>
									<td><h4 class="table-label"><%=price=resultSet.getInt("ItemPrice") %>.00</h4></td>
									<td><h4 class="table-label"><%=add=sales*price %>.00</h4></td>
							
							
							
							
									<%
									}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
									
									</tr>
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									String sql1 ="SELECT sum(item.ItemQuantity) FROM item";
									resultSet = statement.executeQuery(sql1);
									while(resultSet.next())
									{%>
									
							
									<tr id="dlt">
										<td id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b>Total</b>&nbsp</h4></th>
										<td id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b></b>&nbsp</h4></th>
										<td id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b><%=resultSet.getInt("sum(item.ItemQuantity)") %></b>&nbsp</h4></th>
									
									<%
									break;}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>	
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									 
									String sql1 ="SELECT sum(ordercontain.quantity),sum(ordercontain.returnCount),item.ItemPrice FROM item , ordercontain,shop where item.ItemID=shop.ITID and ordercontain.IteID=shop.ITID";
									resultSet = statement.executeQuery(sql1);
								
									while(resultSet.next())
									{%>
									
										
										<td id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b><%=resultSet.getInt("sum(ordercontain.quantity)") %></b>&nbsp</h4></th>
										<td id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b><%=resultSet.getInt("sum(ordercontain.returnCount)") %></b>&nbsp</h4></th>
										
										<td id="dlt" class="tbl-border data-align tbl-h" colspan="3"><h4 class="table-label" id="dlt">&nbsp<b>Total Sales</b></h4></th>
										
									<%
									break;}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>	
									
										
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									 
									String sql1 ="select sum((ordercontain.quantity-ordercontain.returnCount)*item.ItemPrice) FROM item , ordercontain where item.ItemID=ordercontain.IteID ";
									resultSet = statement.executeQuery(sql1);
								
									while(resultSet.next())
									{%>	
										
										<td id="dlt" class="tbl-border data-align tbl-h"><h4 class="table-label" id="dlt">&nbsp<b><%=resultSet.getInt("sum((ordercontain.quantity-ordercontain.returnCount)*item.ItemPrice)") %>.00</b>&nbsp</h4></th>
								
									<%
									break;}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>	
		
							</tr>
					
				</table>
				
    
				
				<br/><br/>
				
				
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									String sql1 ="select (sum(jayasadha.ordercontain.returnCount)/sum(jayasadha.ordercontain.quantity))*100  from jayasadha.ordercontain,jayasadha.item where jayasadha.item.ItemID=jayasadha.ordercontain.IteID";
									resultSet = statement.executeQuery(sql1);
									float percn=0;
									while(resultSet.next())
									{%>
											
											<h3>Return Percentage(relative to order) = <%=percn=resultSet.getFloat("(sum(jayasadha.ordercontain.returnCount)/sum(jayasadha.ordercontain.quantity))*100") %>%</h3>
									
									<%
									break;}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>	
				
													
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									String sql1 ="SELECT sum(item.ItemPrice) FROM item";
									resultSet = statement.executeQuery(sql1);
									while(resultSet.next())
									{%>
											
											<h3>Total Item Price = Rs.<%=resultSet.getInt("sum(item.ItemPrice)") %>.00</h3>
									
									<%
									break;}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>	
											
				
									<%
									try{
									connection = DriverManager.getConnection(connectionUrl+database, userid, password);
									statement=connection.createStatement();
									 
									String sql1 ="select sum((ordercontain.quantity-ordercontain.returnCount)*item.ItemPrice) FROM item , ordercontain where item.ItemID=ordercontain.IteID ";
									resultSet = statement.executeQuery(sql1);
								
									while(resultSet.next())
									{%>	
				
											<h3>Total Sales = Rs.<%=resultSet.getInt("sum((ordercontain.quantity-ordercontain.returnCount)*item.ItemPrice)") %>.00</h3>
									
									<%
									break;}
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>	
		</div>
		
				
	</div>


&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp
				<button class="btn" id="etbtn" onclick="generatePDF()"><i class="fa fa-download"></i> Download As PDF</button></center> 
</div>
<!-- --------------------------------------------------------------------------------- -->
	<br/><br/><br/>
		<footer ><!--Footer-->
	<img id=img src="images/shop/header3.jpg" alt="" width=100% height=50/>
		
<!-- --------------------------------------------------------------------------------- -->		
			<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2021 Jayasanda Inc. All rights reserved.</p>
					
				</div>
			</div>
		</div>
	
		
	</footer><!--/Footer-->
</body>
</html>