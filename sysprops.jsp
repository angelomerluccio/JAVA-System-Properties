<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.TreeMap" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="/css/style.css">
	<title>Java - Application Container | Environmental Variables | System Properties</title>

</head>

<body>
<table cellpadding="2" cellspacing="1">
	<tr class="titlebar">
		<td class="LABEL">Name</td>
		<td class="LABEL">Property</td>
	</tr>
<%
	/**
	  * Purpose of this jsp is to display helpful java enviromental varialbles.
	  * Results may vary depending on your JVM container. (i.e, Tomcat, JBOSS)
	  * 
	 */
	TreeMap props = new TreeMap(System.getProperties());
	boolean css = false;
	for (Iterator i = props.entrySet().iterator(); i.hasNext(); ) {
		Map.Entry entry = (Map.Entry)i.next();
		String key = (String)entry.getKey();
		String value = (String)entry.getValue();
%>
	<tr class="<%= css ? "rowOn" : "rowOff " %>">
			<td class="text"><%= key %></td>
			<td class="text"><%= value %></td>
		</tr>
<% css = !css;
	}
%>
</table>
</body>
</html>
