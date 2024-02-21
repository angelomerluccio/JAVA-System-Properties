<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.TreeMap" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/css/style.css">
	<title>Java - Environmental Variables & System Properties</title>

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
