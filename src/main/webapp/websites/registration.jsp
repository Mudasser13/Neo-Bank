<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="registration.css">
</head>
<body>

<div class="wrapper">
        <div class="title">
          Registration Form

          <form action="<%=request.getContextPath()%>/registrationDataCollection" method="POST" onsubmit="event.preventDefault()" id="reg-from">
        </div>
        <div class="form">
           <div class="inputfield">
              <label>First Name</label>
              <input type="text" class="input" name="first_name">
           </div>  
           <div class="inputfield">
              <label>Middle Name</label>
              <input type="text" class="input"  name="middle_name">
           </div>
            <div class="inputfield">
              <label>Last Name</label>
              <input type="text" class="input" name="last_name">
           </div>  
           <div class="inputfield">
              <label>Password</label>
              <input type="password" class="input"  name="password">
           </div>  
          <div class="inputfield">
              <label>Confirm Password</label>
              <input type="password" class="input" name="confirm_password">
           </div> 
           <div class="inputfield">
              <label>Phone Number</label>
              <input type="text" class="input" name="phno">
           </div> 
           <div class="inputfield">
              <label>Email Address</label>
              <input type="email" class="input" name="emailId">
           </div> 
           <div class="inputfield">
              <label>Dob</label>
              <input type="date" class="input" name="Dob">
           </div> 
            <div class="inputfield">
              <label>Gender</label>
              <div class="custom_select">
                <select name="gender">
                  <option value="">Select</option>
                  <option value="male">Male</option>
                  <option value="female">Female</option>
                </select>
              </div>
           </div> 
            <div class="inputfield">
              <label>Father Name</label>
              <input type="text" class="input" name="father_name">
           </div> 
           <div class="inputfield">
              <label>Mother Name</label>
              <input type="text" class="input" name="Mother_name">
           </div> 
          
          <div class="inputfield">
              <label>Aadhar</label>
              <input type="text" class="input" name="aadhar">
           </div> 
          <div class="inputfield">
              <label>Pan Card</label>
              <input type="text" class="input" name="PanCard">
           </div> 
           <div class="inputfield">
              <label>Maritalstatus</label>
              <div class="custom_select">
              <select name="Maritalstatus">
              <option value="">Select</option>
              <option value="Unmarried">UnMarried</option> 
              <option value="Married">Married</option>
              </select>
              </div>
              </div>
          <div class="inputfield">
              <label>Occupation</label>
              <input type="text" class="input" name="occupation">
           </div> 
           <div class="inputfield">
              <label>Initial Deposit</label>
              <input type="text" class="input" name="AnnualIncome">
           </div> 
           <div class="inputfield">
              <label>PWD</label>
              <input type="text" class="input" name="pwd">
           </div> 
          <div class="inputfield">
            <input type="submit" value="Register" class="btn" onclick="fromSubmit()">
          </div>
       <!--  </div> -->
        <!-- <div class="signup">
        <span class="signup">Already have an account?
         <label for="check">Login</label>
         <input type="submit" value="Login" class="btn" onclick="./login.jsp">
        </span> -->
        <div class="signup">
  			<span class="signup">Already have an account?
    		<a href="./login.jsp" id="register">Login</a>
  			</span>
		</div>
      </div>
    </div>
    

  </form>


<script>

function fromSubmit(){
    
  var con = confirm("Do you want to submit?");
  if(con){
    document.forms['reg-from'].submit()
  }else{
    window.location.assign("./registration.jsp");
  }
     

}



</script>





</body>
</html>