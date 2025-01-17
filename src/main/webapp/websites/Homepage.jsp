<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    %>
    <%@page import="java.sql.*,java.io.IOException,javax.servlet.http.HttpServletResponse"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"></script>
</head>
<body>


<body background="./background.jpg">
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <h2>NeoBank</h2>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav me-auto mb-2 mb-lg-1">
          <li class="nav-item">
            <a class="btn btn-outline-success" href="./Homepage.jsp">Home</a>
          </li>




        </ul>
        <form class="d-flex" action="<%=request.getContextPath()%>/logOut" onclick="Logout()"  id="log-from" method="post">
          <button type="submit" class="btn btn-outline-danger" >Log out</button>
        </form>
      </div>
    </div>
  </nav>
  <div class="col-4">
    <div class="container">

      <div class="row align-items-center vh-100">
        <div class="col-5 mx-auto">

          <div class="card shadow border">


            <div class="card" style="width: 15rem; height: 25rem;">



              <div class="card-body">

                <div class="list-group">
                
                  <from action="Homepage.jsp">
                  <a href="./Homepage.jsp" class="list-group-item list-group-item-action active" aria-current="true">
                    Home
                  </a>
                  </from>
                  <from action="ministatement.jsp">
                  <a href="./ministatement.jsp" class="list-group-item list-group-item-action" name="">Mini Statement</a>
                  </from>
                  <a href="./FundTransfer.jsp" class="list-group-item list-group-item-action">Fund Transfer</a>
                </div>


              </div>
            </div>
          </div>
        </div>




        <div class="col-5">
          <div class="container">

            <div class="row align-items-center vh-100">
              <div class="col-5 mx-auto">

                <div class="card shadow border">


                  <div class="card" style="width: 55rem; height: 25rem;">



                    <div class="card-body">

                      <!-- write form code here  -->

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
System.out.println(session.getAttribute("custId")==null);
if(session.getAttribute("custId")==null)
	request.getRequestDispatcher("login.jsp").forward(request, response);

String custid = session.getAttribute("custId").toString();
long id = Long.parseLong(custid);
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/apnabank","root","Mudasser@123");
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from customers where customerId =" + id);
while(rs.next()){
	
%>








                      <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Loan Amount</th>
                            <th scope="col">Balance</th>
                          </tr>
                        </thead>
                        <tbody class="table-group-divider">
                          <tr>
                            <th scope="row"><%=rs.getString(2) %></th>
                            <td>0</td>
                            <td><%=rs.getString(16) %></td>
                          </tr>

                        </tbody>
                      </table>


<% 
}
}
catch(Exception e){
	e.printStackTrace();
}


%>
                      <!-- write form code here  -->




                    </div>
                  </div>
                </div>
              </div>

              <script>
                function Logout() {
                  var get = confirm("Log Out?");
                  if (get) {
                   window.location.assign("./login.jsp");
                   document.forms['log-from'].submit();
                  } else {
                   window.location.assign("./HomePage.jsp");
                  }
                }

              </script>



</body>
</html>