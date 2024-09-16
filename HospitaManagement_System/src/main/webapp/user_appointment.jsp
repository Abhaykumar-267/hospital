<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Doctor" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.point-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
	url("image/hospital.jpg");
	height: 100vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;	
}

#ab {
margin-top:13px;
}

</style>
</head>
<body>
		<%@include file="component/Navbar.jsp"%>
		
		<div class="container-fulid backImg p-5">
			<p class="text-center fs-2 text-white"></p>
		</div>
		<div class="container p-3">
			<div  class="row">
				<div class="col-md-6 p-3">
					<img alt=" " src="image/doc7.jpg">
				</div>
				
				<div class="col-md-6">
					<div class="card paint-card">
						<div class="card-body">
							<p class="text-center fs-3">User Appointment</p>
							<c:if test="${not empty errorMsg }">
								<p class="fs-4 text-center text-danger"> ${errorMsg }</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg }">
								<p class="fs-4 text-center text-success"> ${succMsg }</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							
							
							<form class="row g-3" action="addAppointment" method="post">
							
								<input type="hidden" name="userid" value="${userObj.id }">
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Full Name</label>
									<input required type="text" class="form-control" name="fullname">
								</div>
								
								<div class="col-md-6">
									<label>Gender</label>
									<div id="ab">
									<select>
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
									</div>
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Age</label>
									<input required type="number" class="form-control" name="age">
								</div>
								
								<div class="col-md-6">
										<label for="inputEmail4" class="form-label">Appointment Date</label>
										<input required type="date" class="form-control" name="appoint_date">
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label>
									<input required type="email" class="form-control" name="email">
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Phone_no.</label>
									<input maxlength="10" required type="number" class="form-control" name="phno">
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Diseases</label>
									<input required type="text" class="form-control" name="diseases">
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Doctor</label>
									<select required class="form-control" name="doct">
										<option value="">--select--</option>
										
										<%
										DoctorDao dao = new DoctorDao(DBConnect.getConn());
										List<Doctor> list = dao.getAllDoctor();
											for( Doctor d : list ) {
												%>
													<option value="<%=d.getId()%>"><%=d.getFullname()%> (<%=d.getSpecialist()%>)</option>
												<%
											}
										%>
									</select>
								</div>
					
					
								<div class="col-md-12">
									<label>Full Address</label>
									<textarea required name="address" class="form-control" rows="3"  cols=" "></textarea>
								</div>
					
								<c:if test="${empty userObj }">
									<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
								</c:if>
								<c:if test="${not empty userObj }">
									<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
								</c:if>
					
					
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
<%@include file="component/footer.jsp" %>
</body>
</html>