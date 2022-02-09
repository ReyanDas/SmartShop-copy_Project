
<%@page import="com.learn.mycart.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-lg  navbar-dark  custom-bg">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> <img alt="logo"
			src="img/smartshoplogo.png" height="40">


		</a>


		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
					
					<li class="nav-item active" ><a class="nav-link" data-toggle="modal"
					data-target="#add-category-modal" href="#"
					>Add Category <span class="sr-only">(current)</span></a></li>
					
					<li class="nav-item active" ><a class="nav-link" data-toggle="modal"
					data-target="#add-product-modal" href="#"
					>Add Product <span class="sr-only">(current)</span></a></li>


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="users.jsp">Show all Users</a> <a
							class="dropdown-item" href="#">Show all Categories</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" data-toggle="modal"
					data-target="#add-category-modal">Show all Orders</a>
					</div></li>

			</ul>

			<ul class="navbar-nav ml-auto">


				<li class="nav-item active">
				
				</li>



				<%
				if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register </a></li>


				<%
				} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="<%=user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%=user1.getUserName()%>
				</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">Logout </a></li>



				<%
				}
				%>




			</ul>

		</div>

	</div>
</nav>