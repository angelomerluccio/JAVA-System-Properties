<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.TreeMap" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="/css/style.css">
	<title>Java - Application Container | Environmental Variables | System Properties</title>
</head>

<body style="padding:25px" bgcolor="#FFFFFF">

	<div id="header" class="header" style="position:relative; margin:O auto; visibility:visible">

		<div class="form-row">
			<div class="col-md-12">
				<div class="alert alert-warning">
					<strong>Java / JVM - Application Container - System Properties</strong>
				</div>
			</div>
		</div>

		<div class="form-row">
			<div class="col-md-6">
				<div class="alert alert-success">Name</div>
			</div>
			<div class="col-md-6">
				<div class="alert alert-success">Property</div>
			</div>
		</div>

		<% 
			TreeMap props=new TreeMap(System.getProperties()); 
			boolean css=false; 
			for (Iterator i=props.entrySet().iterator(); i.hasNext(); ) { 
				Map.Entry entry=(Map.Entry) i.next (); 
				String key=(String)entry getKey(); 
				String value=(String)entry getValue(); 
		%>
			<div class="form-row">
				<div class="col-md-6">
					<div class="alert alert-info"><%= key %></div>
				</div>
				<div class="col-md-6">
					<div class="alert alert-info"><%= value %></div>
				</div>
			</div>
			<% 
		} 
		//------------------------------------------------------------------------------- 
		// if you want to register a driver outside of the context.xml 
		// Class driverClass=Class.forName("oracle.jdbc.driver.OracleDriver") 
		// DriverManager.registerDriver((Driver) driverClass.newInstance());
		//------------------------------------------------------------------------------- 
	%>
	</div>
	</div>

	<br /><br />

	<div class="form-row">
		<div class="col-md-12">
			<div class="alert alert-warning">
				<strong>JDBC Drivers</strong>
			</div>
		</div>
	</div>



	<table cellpadding="2" cellspacing="1">
		<tr class-"titlebar">
			<% 
			// Print out all loaded JDBC drivers. 
			Enumeration e=java.sql.DriverManager.getDrivers(); 
			while(e.hasMoreElements()) { 
				Object driverAsObject=e.nextElement(); 
			%>

				<div class="form-row">
					<div class="col-md-6 mb-3">
						<div class="alert alert-info">JDBC Driver</div>
					</div>
					<div class="col-md-6 mb-3">
						<div class="alert alert-info">
							<%= driverAsObject %>
						</div>
					</div>
				</div>
			<% } %>
	</table>

	<br><br>
	<div class="form-row">
		<div class="col-md-12">
			<div class-"alert alert-warning"><strong>HTTP Headers</strong></div>
		</div>
	</div>


	<div class="form-row">
		<div class="col-md-6">
			<div class="alert alert-success">Header Name</div>
		</div>
		<div class="col-md-6">
			<div class="alert alert-success">Header Value(s)</div>
		</div>
	</div>

	<% 
		Enumeration headerNames=request.getHeaderNames(); 
		while(headerNames.hasMoreElements()) { 
			String paramName=(String)headerNames.nextElement(); 
	%>
		<div class="form-row">
			<div class="col-md-6 mb-3">
				<div class="alert alert-info">
					<%= paramName %>
				</div>
			</div>
			<div class="col-md-6 mb-3">
				<div class="alert alert-info" <%=request.getHeader(paramName) %></div>
			</div>
		</div>

	<% } %>

</body>
</html>
