
<%
String status = (String) session.getAttribute(" ");
String status1 = "Hello";

if(status1 !=null){

if (status1.equals("Hello")) {
	
	
	
	

%>



<div class="form-group">
	<label for="exampleInputPassword1">OTP</label> <input name="otp"
		type="number" class="form-control" placeholder="OTP">
</div>

<%
session.removeAttribute("OTP");

}
}
%>