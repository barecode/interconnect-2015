<%@page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>InterConnect 2016 - Lab 4346</title>
 <style>
 body {
  font-family: sans-serif;
 }
 .leftBar {
  width: 200px;
  height: 100vh;
  float: left;
  border-right: 3px solid rgb(57,43,102);
 }
 .icText {
  font-size: 18px;
 }
 .icBlue {
  color: rgb(43,173,206);
 }
 .wtuImage {
  background: url(images/wtu2015.png) no-repeat;
  height: 143px;
  width: 185px;
 }
 .hidden {
  display: none
 }
 td {
  padding-left: 20px;
 }
 </style>
</head>
<body>
<div>
  <div style="background-image: linear-gradient(rgb(57, 53, 102) 0%, rgb(47, 38, 73) 100%); height: 45px;">
   <a href="https://developer.ibm.com/wasdev">
    <img style="margin: 10px 0 0 10px" src="images/wasdev-wordmark.png" alt="WASdev">
   </a>
  </div>
 <div class="leftBar">
  <div style="margin-top: 10px"><span class="icText"><b>InterConnect</b> <span class="icBlue">2016</span></span></div>
  <div style="margin-top: 15px;">Lab 4346</div>
  <div>Liberty Autoscaled Clusters</div>
  <div style="position: fixed; bottom: 10px">&copy;IBM 2015</div>
 </div>
 </div> <!-- left div -->

 <div style="width: 70%; float: left; padding-left: 10px;">
  <div class="wtuImage" style="margin-top: 10px; margin-bottom: 10px;"></div>
  <%
    javax.management.MBeanServer mbs = java.lang.management.ManagementFactory.getPlatformMBeanServer();
    javax.management.ObjectName serverInfo = new javax.management.ObjectName("WebSphere:feature=kernel,name=ServerInfo");
    String serverName = "Unable to determine";
    if (mbs.isRegistered(serverInfo)) {
      serverName = (String) mbs.getAttribute(serverInfo, "Name");	
    }
    final String requestHost = request.getServerName() + ":" + request.getServerPort();
    final String localHost = request.getLocalName() + ":" + request.getLocalPort();

    String localHostClass = "";
    String directClass = "";
    String indirectClass = "";
    if (localHost.equals(requestHost)) {
      localHostClass = "hidden";
      indirectClass = "hidden";
    } else {
      directClass = "hidden";
    }
   %>


  <table>
    <caption style="margin-bottom: 10px; font-size: 18px;"><b>Request Details</b></caption>
    <tr><td><b>Request URL</b></td><td><%=request.getRequestURL()%></td></tr>
    <tr><td><b>Request Host</b></td><td><%=requestHost%></td></tr>
    <tr><td><b>Server Name</b></td><td><%=serverName%></td></tr>
    <tr class="<%=localHostClass%>"><td><b>Actual Host</b></td><td><%=localHost%></td></tr>
  </table>
  <div style="margin-top: 20px;">
    <span>Access type:</span>
    <span class="<%=directClass%>">
      Direct<br/>
      The request was sent directly to the application server which processed the request.
    </span>
    <span class="<%=indirectClass%>" >
      Proxy / load balancer<br/>
      The request host does not match the actual host which processed the request.<br/>
      The request was proxied through IHS and processed by the indicated application server.<br/><br/>
      If the actual host or server name changes across multiple requests then the application is being hosted by a cluster.
    </span>
  </div>
  <div style="position: fixed; bottom: 10px">
   This is the lab page for InterConnect 2016 lab 4346.<br/>
   It displays details about the HTTP request and the application server which processed it.</div>
 </div> <!-- right div -->
</div>
</body>
</html>
