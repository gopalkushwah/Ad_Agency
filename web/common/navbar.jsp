<%@page import="com.ramaasoft.dao.UserDao"%>
<%@page import="com.ramaasoft.Entities.UserEntity"%>
<%

    UserEntity user2 = (UserEntity) session.getAttribute("user");
    UserEntity user3 = new UserEntity();
    if (user2 != null) {
        user3 = UserDao.getUser(user2.getEmail(), user2.getMobile());
    }
    String url = request.getRequestURI();

%>
<header id="header" class="header d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="index.jsp" class="logo d-flex align-items-center">
            <h1>Ad Heaven<span>.</span></h1>
        </a>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="index.jsp#hero">Home</a></li>
                    <%                    if (url.equals("/Ad_Agency/signup.jsp") != true && url.equals("/Ad_Agency/login.jsp") != true) {
                    %>
                <li><a href="index.jsp#about">About</a></li>
                <li><a href="index.jsp#services">Services</a></li>
                <li><a href="index.jsp#team">Team</a></li>
                <li><a href="index.jsp#contact">Contact</a></li>
                <li><a href="search-ads.jsp">Search</a></li>
                    <%}
                        String isLoginNav = (String) session.getAttribute("isLogin1");
                        if (isLoginNav == null) {
                    %>
                <li class="dropdown"><a href="#">Login</a>
                    <ul>
                        <li><a style="cursor:pointer;" onclick="showLoading('login.jsp')">Login as User</a></li>
                        <li><a style="cursor:pointer;" onclick="showLoading('Admin/pages-login.jsp')">Login as Seller</a></li>
                    </ul>
                <li class="dropdown"><a href="#">SignUp</a>
                    <ul>
                        <li><a style="cursor:pointer;" onclick="showLoading('signup.jsp')">Signup as User</a></li>
                        <li><a style="cursor:pointer;" onclick="showLoading('Admin/signup.jsp')">Signup as Seller</a></li> 
                    </ul>
                </li>
                <% } else {%>
                <li><a href="./show-ads.jsp?page=1">Show Ads</a></li>
                <li><a href="./mybookings.jsp"><i class="bi bi-cart"></i></a></li>
                    <%if (user3.getId() == null) {%>
                <li class="dropdown"><a href="#"><span><i class="fa-solid fa-user"></i></span></a>
                    <ul>
                        <li><a href="profile.jsp">Update Profile</a></li>
                        <li><a href="change_password.jsp">Change Password</a></li>
                        <li><a href="LogoutServlet">Logout</a></li>
                    </ul>
                </li>
                <% } else {%>
                <li class="dropdown"><a href="#"><img src="./upload/<%=user3.getProfile_image()%>"  alt="profile" width="50px" height="50px" style="border-radius: 50%;"/></a>
                    <ul>
                        <li><a href="profile.jsp">Update Profile</a></li>
                        <li><a href="change_password.jsp">Change Password</a></li>
                        <li><a href="LogoutServlet">Sign Out</a></li>
                    </ul>
                </li>
                <%}
                    }%>
            </ul>
        </nav><!-- .navbar -->
        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
    </div>
</header><!-- End Header -->

<script>
    function showLoading(link) {
//        let timerInterval
        Swal.fire({
            title: 'Please wait for a second',
            timer: 3000,
            timerProgressBar: true,
            didOpen: () => {
                Swal.showLoading();
            }
        }).then((result) => {
            window.location.href = link;
            /* Read more about handling dismissals below */
//            if (result.dismiss === Swal.DismissReason.timer) {
//                console.log('I was closed by the timer')
//            }
        })
    }
    ;
</script>