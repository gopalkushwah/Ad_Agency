<%@page import="com.ramaasoft.Cookies.UserDefinedCookies"%>
<%@page import="com.ramaasoft.dao.AdminDao"%>
<%@page import="com.ramaasoft.Entities.AdminEntity"%>
<!DOCTYPE html>
<%
    //getting admin info from cookie
    AdminEntity getAdmin = (AdminEntity) UserDefinedCookies.getAdminCookies(request, "adminLogin");

    session.setAttribute("title", "Profile - get changes");
    String isAdminUpdated = (String) session.getAttribute("isAdminUpdated");
    String isAdminLogin1 = UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    if (isAdminLogin1 == null) {
        response.sendRedirect("pages-login.jsp");
    }
    if (getAdmin != null) {
        AdminEntity adminData = AdminDao.getAdmin(getAdmin.getEmail(), getAdmin.getMobile());
%>
<html lang="en">
    <!--head-->
    <%@include file="./admin_common/head.jsp" %>
    <!--head-->
    <body>

        <!-- ======= Header ======= -->
        <%@include file="./admin_common/navbar.jsp" %>
        <!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <%@include file="./admin_common/sidebar.jsp" %>
        <!-- End Sidebar-->

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Profile</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item">Users</li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">

                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                                <img src="./uploads/<%= adminData.getImage()%>" width="100px" height="100px" alt="Profile" class="rounded-circle">
                                <h2><%= adminData.getFull_name()%></h2>
                                <div class="social-links mt-2">
                                    <a href="<%= adminData.getTwitter() %>" target="_blank"  class="twitter"><i class="bi bi-twitter"></i></a>
                                    <a href="<%= adminData.getFacebook()%>" target="_blank"  class="facebook"><i class="bi bi-facebook"></i></a>
                                    <a href="<%= adminData.getInstagram()%>" target="_blank"  class="instagram"><i class="bi bi-instagram"></i></a>
                                    <a href="<%= adminData.getLinkedin()%>" target="_blank" class="linkedin"><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                                    </li>

                                </ul>
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                        <h5 class="card-title">Profile Details</h5>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getFull_name()%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Username</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getUsername()%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">User Id</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getAdmin_id()%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Registration Date</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getRegistration_date()%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Role</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getRole()%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Phone</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getMobile()%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Email</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getEmail()%></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Company</div>
                                            <div class="col-lg-9 col-md-8"><%= adminData.getCompanyname()%></div>
                                        </div>

                                    </div>


                                    <!--Edit profile-->
                                    <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                                        <!-- Profile Edit Form -->
                                        <div class="row mb-3">
                                            <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                            <div class="col-md-8 col-lg-9">
                                                <img src="./uploads/<%= adminData.getImage()%>" width="100px" height="100px" alt="Profile">
                                                <form action="../UploadAdminProfileServlet" method="post" role="form" enctype="multipart/form-data">
                                                    <div class="pt-2">
                                                        <input name="adminprofile" type="file" class="form-control" accept="image/*" id="adminprofile" hidden="true" required>
                                                        <label class="btn btn-primary btn-sm text-white"  for="adminprofile">Select Image</label>
                                                        <button type="submit" class="btn btn-danger btn-sm"><i class='bi bi-upload text-white'></i></button>
                                                    </div>
                                                </form><!-- Add Image End -->
                                            </div>
                                        </div>

                                        <form id="adminProfileUpdate">
                                            <div class="row mb-3">
                                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="fullName" type="text" class="form-control" id="fullName" value="<%= adminData.getFull_name()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="username" class="col-md-4 col-lg-3 col-form-label">Username</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="username" type="text" class="form-control" id="username" value="<%= adminData.getUsername()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="phone" type="text" class="form-control" id="phone" value="<%= adminData.getMobile()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="email" type="email" class="form-control" id="email" value="<%= adminData.getEmail()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="twitter" type="text" class="form-control" id="twitter" value="<%= adminData.getTwitter()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="facebook" type="text" class="form-control" id="facebook" value="<%= adminData.getFacebook()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="instagram" type="text" class="form-control" id="instagram" value="<%= adminData.getInstagram()%>" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="linkedin" type="text" class="form-control" id="linkedin" value="<%= adminData.getLinkedin()%>" required>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row mb-3">
                                                <label for="password" class="col-md-4 col-lg-3 col-form-label">Confirm Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="password" type="password" class="form-control" id="password" placeholder="Enter Your Password to Update Profile" required>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="button" onclick="adminProfileUpdate()" id="profileUpdateBtn"  class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form><!-- End Profile Edit Form -->

                                    </div>

                                    <div class="tab-pane fade pt-3" id="profile-change-password">
                                        <!-- Change Password Form -->
                                        <form id="changePassword">
                                            <div class="row mb-3">
                                                <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="currentPassword" type="password" class="form-control" id="currentPassword" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="newpassword" type="password" class="form-control" id="newPassword" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="renewpassword" type="password" class="form-control" id="renewPassword" required>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="button" onclick="changePassword()" class="btn btn-primary">Change Password</button>
                                            </div>
                                        </form><!-- End Change Password Form -->

                                    </div>

                                </div><!-- End Bordered Tabs -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <%@include file="./admin_common/footer.jsp" %>
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!--js files-->
        <script>
            // Wait for the document to be ready
            document.addEventListener("DOMContentLoaded", function () {
                // Get the button element
                let showAlertBtn = document.getElementById("profileUpdateBtn");
                let isAdminUpdated1 = '<%= isAdminUpdated%>';
                // Add a click event listener to the button
                showAlertBtn.addEventListener("click", function () {
                    // Display SweetAlert2 dialog
                    Swal.fire({
                        title: isAdminUpdated1,
                        timer: 3000
                    });
                });
            });
        </script>
        <script>
            function changePassword() {
                const currentPassword = document.getElementById("currentPassword").value;
                const newPassword = document.getElementById("newPassword").value;
                const renewPassword = document.getElementById("renewPassword").value;
                
                fetch("../AdminChangePassword", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: "currentPassword=" + encodeURIComponent(currentPassword) + "&newPassword=" + encodeURIComponent(newPassword) + "&renewPassword=" + encodeURIComponent(renewPassword)
                })
                .then(response => response.text())
                .then(data => {
                    Swal.fire({
                        title: data,
                        timer: 3000
                    });
                })
                .catch(error => {
                    console.error("Error inserting data:", error);
                    Swal.fire({
                        title: "Error Changing password ",
                        timer: 3000
                    });
                });
            };
            
            
            function adminProfileUpdate(){
                const fullName = document.getElementById("fullName").value;
                const username = document.getElementById("username").value;
                const phone = document.getElementById("phone").value;
                const email = document.getElementById("email").value;
                const twitter = document.getElementById("twitter").value;
                const facebook = document.getElementById("facebook").value;
                const instagram = document.getElementById("instagram").value;
                const linkedin = document.getElementById("linkedin").value;
                const password = document.getElementById("password").value;
                
                fetch("../AdminProfileUpdateServlet", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: "fullName=" + encodeURIComponent(fullName) + "&username=" + encodeURIComponent(username) + "&phone=" + encodeURIComponent(phone)+"&email=" + encodeURIComponent(email) + "&twitter=" + encodeURIComponent(twitter) + "&facebook=" + encodeURIComponent(facebook)+"&instagram=" + encodeURIComponent(instagram) + "&linkedin=" + encodeURIComponent(linkedin) + "&password=" + encodeURIComponent(password)
                })
                .then(response => response.text())
                .then(data => {
                    Swal.fire({
                        title: data,
                        timer: 3000
                    });
                })
                .catch(error => {
                    console.error("Error inserting data:", error);
                    Swal.fire({
                        title: "Error Updating Profile",
                        timer: 3000
                    });
                });
            };
        </script>
        
        <%@include file="./admin_common/commonjs.jsp" %>
        <!--js files-->

    </body>

</html>
<%}%>