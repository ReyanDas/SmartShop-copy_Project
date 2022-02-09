
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login - MyCart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<%
			 String otpstatus=(String)session.getAttribute("otp");
			
			if(otpstatus==null ){
				session.removeAttribute("otp");
			%>

				<div class="card mt-3">

					<div class="card-header custom-bg text-white">
						<h3>Login here</h3>
					</div>

					<div class="card-body">
						<%@include file="components/message.jsp"%>

						<form action="OtpLoginservlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small> 
									<input type="hidden" name="loginoperation" value="email">
									<a href="register.jsp"
									class="text-center d-block mb-2"> if you are a new user
									click here </a>
								<div class="container text-center">

									<button type="submit"
										class="btn btn-primary border-0 custom-bg ">Request
										OTP</button>
									<button type="button"
										class="btn btn-primary custom-bg border-0 ">Clear</button>
								</div>
							</div>

						</form>

					</div>


				</div>

				<%
			}else{
            
            %>

				<div class="card mt-3">

					<div class="card-header custom-bg text-white">
						<h3>Login here</h3>
					</div>

					<div class="card-body">
						<%@include file="components/message.jsp"%>

						<form action="OtpLoginservlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="<%=session.getAttribute("emailid")%>"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
								<div class="form-group">
									<label for="exampleInputPassword1">OTP</label> <input
										name="otp" type="number" class="form-control"
										placeholder="OTP" required>
								</div>
								<input type="hidden" name="loginoperation" value="otp">

								<a href="register.jsp" class="text-center d-block mb-2"> if
									you are a new user click here </a>
								<div class="container text-center">

									<button type="submit"
										class="btn btn-primary border-0 custom-bg ">Submit</button>
									<button type="button"
										class="btn btn-primary custom-bg border-0 ">Request
										OTP</button>
								</div>
							</div>

						</form>

					</div>


				</div>










				<%
			}
			
			
			%>






			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" id="otpmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enter OTP</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<form action="OtpLoginservlet" method="post">



						<div class="form-group">
							<input type="text" class="form-control" name="email"
								placeholder="Enter Email" required />

						</div>


						<div class="form-group">
							<input type="text" class="form-control" name="otp"
								placeholder="Enter OTP" />


						</div>

						<div class="cotnainer text-center">

							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>



					</form>

				</div>


			</div>
		</div>
	</div>





</body>
</html>
