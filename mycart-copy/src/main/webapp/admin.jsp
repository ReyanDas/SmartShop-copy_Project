<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.dao.*"%>
<%@page import="com.learn.mycart.entities.*"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;

} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;

	}

}
//get all users
UserDao userdao = new UserDao(FactoryProvider.getFactory());
List<User> users = userdao.getAllUsers();
//get all products
ProductDao productdao = new ProductDao(FactoryProvider.getFactory());
List<Product> products = productdao.getAllProducts();
//get all categories
CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
List<Category> categories = categorydao.getCategories();
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>


</head>
<body>

	<%@include file="components/navbarAdmin.jsp"%>

	<div class="container admin">


		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>




		<div class="row mt-3">

			<!--------------------------first col----------------------------->
			<div class="col-md-2">

				<!--first box-->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="height: 120px" class="img-fluid rounded-circle"
								src="img/seo-and-web.png" alt="user_icon">

						</div>
						<h1><%=users.size()%></h1>
						<h6 class="text-uppercase text-muted">Users</h6>

					</div>

				</div>



			</div>

			<!--------------------------second col---------------------------->

			<div class="col-md-2">


				<div class="card text-center">

					<div class="card-body">

						<div class="container">
							<img style="height: 120px;" class="img-fluid rounded-circle"
								src="img/list.png" alt="user_icon">

						</div>

						<h1><%=categories.size()%></h1>
						<h6 class="text-uppercase text-muted">Categories</h6>

					</div>

				</div>


			</div>


			<!----------------------------third col--------------------------------->
			<div class="col-md-2">


				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="height: 120px;" class="img-fluid rounded-circle"
								src="img/product.png" alt="user_icon">

						</div>

						<h1><%=products.size()%></h1>
						<h6 class="text-uppercase text-muted">Products</h6>

					</div>

				</div>


			</div>



			







		</div>

		<!--second row-->



		<div class="row mt-3">

			<!--second row first col-->



			<!--second row : second col-->





		</div>

		<table class="table table-dark">
			<thead>
				<tr class="text-center">
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col" class="text-center">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">User Type</th>
					<th class="float-center text-center">Action</th>
				</tr>
			</thead>
			<tbody>
			<%
			for(User users1:users){
			
			%>

				<tr class="text-center">
					<th scope="row"><%=users1.getUserId() %></th>
					<td><%=users1.getUserName() %></td>
					<td><%=users1.getUserEmail() %></td>
					<td><%=users1.getUserPhone() %></td>
					<td><%=users1.getUserType() %></td>
					<td>
						<button class="btn btn-primary badge rounded-pill"
							style="width: 80px;">EDIT</button>
						<button class="btn btn-danger badge rounded-pill"
							style="width: 80px;">DELETE</button>
					</td>
				</tr>
				<%
			}
				%>

			</tbody>
		</table>



	</div>



	<!--add category modal-->



	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />

						</div>


						<div class="form-group">
							<textarea style="height: 300px;" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required></textarea>

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




	<!--End add category modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

	<!--add product modal-->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Product details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--form-->

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct" />

						<!--product title-->

						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter title of product" name="pName" required />
						</div>

						<!--product description-->

						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product description" name="pDesc"></textarea>

						</div>

						<!--product price-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter price of product" name="pPrice" required />
						</div>

						<!--product discount-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product discount" name="pDiscount" required />
						</div>


						<!--product quantity-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product Quantity" name="pQuantity" required />
						</div>


						<!--product category-->

						<%
						CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> list = cdao.getCategories();
						%>


						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%>
								</option>
								<%}%>
							</select>

						</div>



						<!--product file-->

						<div class="form-group">
							<label for="pPic">Select Picture of product</label> <br> <input
								type="file" id="pPic" name="pPic" required />

						</div>


						<!--submit button-->
						<div class="container text-center">

							<button class="btn btn-outline-success">Add product</button>

						</div>



					</form>
					<!--end form-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





	<!--End product modal-->


	<%@include file="components/common_modals.jsp"%>

</body>
</html>
