<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.io.IOException,javax.servlet.http.*,java.lang.*"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeoBank</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
</head>

<body background="./background.jpg">


    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <h2>NeoBank</h2>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <ul class="navbar-nav me-auto mb-2 mb-lg-1">
                    <li class="nav-item">
                        <a class="btn btn-outline-success" href="./Homepage.jsp">Home</a>
                    </li>




                </ul>
                <form class="d-flex" action="<%=request.getContextPath()%>/logOut" onsubmit="event.preventDefault()" id="log-from" method="post">
                    <button type="submit" class="btn btn-outline-danger" onclick="Logout()" onsubmit="event.preventDefault()">Log out</button>
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
                                    <a href="./Homepage.jsp" class="list-group-item list-group-item-action"
                                        aria-current="true">
                                        Home
                                    </a>
                                    <a href="./ministatement.jsp" class="list-group-item list-group-item-action">Mini
                                        Statement</a>
                                    </a>
                                    <a href="./FundTransfer.jsp" class="list-group-item list-group-item-action active" >Fund
                                        Transfer</a>

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

                                            <h2>Fund Transfer</h2>
                                            <% 
                                            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                                            System.out.println(session.getAttribute("custId")==null);
                                            if(session.getAttribute("custId")==null)
                                            	request.getRequestDispatcher("login.jsp").forward(request, response);  
                                            %>


                                            <!-- write form code here  -->


                                            <form  method="post" id="transfer" >
                                                <div class="mb-3" >
                                                  <label for="account_name" class="form-label">Name</label>
                                                  <input type="text" class="form-control" id="account_name" aria-describedby="emailHelp">
                                                
                                                </div>
                                                <div class="mb-3">
                                                  <label for="account_no" class="form-label">Customer ID</label>
                                                  <input type="text" class="form-control" id="customid">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="ifsc" class="form-label">Amount</label>
                                                    <input type="text" class="form-control" id="amount">
                                                  </div>
                                                <button type="submit" class="btn btn-primary" name="button-ok">Transfer</button>
                                              </form>

<%
if (request.getParameter("button-ok") != null) {
    final String jdbc_driver = "com.mysql.cj.jdbc.Driver";
    final String db_url = "jdbc:mysql://127.0.0.1:3306/apnabank";
    final String user = "root";
    final String pass = "Mudasser@123";
    System.out.println("All OK");
    
    String cust = session.getAttribute("custId").toString();
    String recvCust = request.getParameter("customid");
    String amountParam = request.getParameter("amount");
    int amount = 0; 

    if (amountParam != null && !amountParam.isEmpty()) {
        try {
            amount = Integer.parseInt(amountParam);
        } catch (NumberFormatException e) {
         
            e.printStackTrace(); 
        }
    }
    if (recvCust != null && cust != null) {
        try {
            Class.forName(jdbc_driver);
            Connection conn = DriverManager.getConnection(db_url, user, pass);
            Statement stmt = conn.createStatement();
            
            String sqlrecv = "SELECT annualincome FROM customers WHERE customerId = " + recvCust;
            ResultSet rs = stmt.executeQuery(sqlrecv);
            
            if (rs.next()) {
                int recvIncome = Integer.parseInt(rs.getString(1));
                String sql1 = "UPDATE customers SET annualincome = " + (recvIncome + amount) + " WHERE customerId = " + recvCust;
                stmt.executeUpdate(sql1);
                
                String sqlsend = "SELECT annualincome FROM customers WHERE customerId = " + cust;
                rs = stmt.executeQuery(sqlsend);
                
                if (rs.next()) {
                    int amt = Integer.parseInt(rs.getString(1));
                    String sql2 = "UPDATE customers SET annualincome = " + (amt - amount) + " WHERE customerId = " + cust;
                    stmt.executeUpdate(sql2);
                }
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("FundTransfer.jsp");
}

%>












                                            <!-- write form code here -->

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
                                        window.location.assign("./FundTransfer.jsp");
                                    }
                                }
                                function warning(){

                                    var acname = document.getElementById('account_name').value;
                                    var acno = document.getElementById("account_no").value;
                                    var Ifsc = document.getElementById('ifsc').value;
                                    if(acname.length == 0 || acno.length == 0 || Ifsc.length == 0){
                                        alert("Fields can not be empty");
                                        window.location.assign("./FundTransfer.jsp");
                                    }
                                    else{
                                    var get = confirm("Do you want to submit?");
                                    if (get) {
                                        document.forms['transfer'].submit();
                                    } else {
                                        window.location.assign("./FundTransfer.jsp");
                                    }
                                }
                                }

                            </script>




</body>

</html>