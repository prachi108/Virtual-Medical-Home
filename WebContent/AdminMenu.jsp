
<style>
menu{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% "Arial", Arial;
font-size:14px;
font-weight:bold;

}
.menu ul{
background:#333333;
height:35px;
list-style:none;
margin:0;
padding:0;
font-size:14px;
font-weight:bold;
}
.menu li{
float:left;
padding:0px;
}
.menu li a{
background:#333333 url("http://i47.tinypic.com/qp53sw.jpg") bottom right no-repeat;
color:#cccccc;
display:block;
font-weight:normal;
line-height:35px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}
.menu li a:hover, .menu ul li:hover a{
background: #2580a2 url("http://i49.tinypic.com/13zbc53.jpg") bottom center no-repeat;
color:#FFFFFF;
text-decoration:none;
}
.menu li ul{
background:#333333;
display:none;
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:225px;
z-index:200;
/*top:1em;
/*left:0;*/
}
.menu li:hover ul{
display:block;

}
.menu li li {
background:url('http://i45.tinypic.com/nvxxqg.jpg') bottom left no-repeat;
display:block;
float:none;
margin:0px;
padding:0px;
width:225px;
}
.menu li:hover li a{
background:none;

}
.menu li ul a{
display:block;
height:35px;
font-size:12px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}
.menu li ul a:hover, .menu li ul li:hover a{
background:#2580a2 url('http://i50.tinypic.com/66elwh.jpg') center left no-repeat;
border:0px;
color:#ffffff;
text-decoration:none;
}
.menu p{
clear:left;
}
</style>


<div>
<table width="100%" >
  <tr>
    <td align="left">Welcome :- <%=session.getAttribute("id")%>(<%=session.getAttribute("userType")%>)</td>
    <td align="right">Last Login Date:- <%=session.getAttribute("lastLoginDate")%>	</td>
  </tr>
</table>

</div>
<div class="menu">
<ul>
<li><a href="AdminHome.jsp">Home</a></li>
<li><a href="#">Specialization</a>
    <ul>
    <li><a href="Specialization.jsp">Add</a></li>
    <li><a href="SpecializationList.jsp">List</a></li>
    </ul>
</li>
<li><a href="#">Registration</a>
    <ul>
    <li><a href="PatientAdd.jsp">Patient Registration</a></li>
    <li><a href="DoctorAdd.jsp">Doctor Registration</a></li>
    <li><a href="KioskAdd.jsp">Kiosk Registration</a></li>
    <li><a href="AdminAdd.jsp">Administration Registration</a></li>
    </ul>
</li>
<li><a href="#">User Information</a>
    <ul>
    <li><a href="PatientList.jsp">Patient Information</a></li>
    <li><a href="DoctorList.jsp">Doctor Information</a></li>
    <li><a href="KioskList.jsp">Kiosk Information</a></li>
    <li><a href="AdminList.jsp">Administration Information</a></li>
    </ul>
</li>
<li><a href="AdminComplaintResponse.jsp?status=all">Complaints</a></li>
<li><a href="AdminViewAppointmentList.jsp">Appointment</a></li>
<li><a href="AdminFeedback.jsp">Feedback</a></li>
<li><a href="Logout.jsp">Logout</a></li>
</ul>
</div>

