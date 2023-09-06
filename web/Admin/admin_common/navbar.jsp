<%@page import="com.ramaasoft.Cookies.UserDefinedCookies"%>
<%@page import="com.ramaasoft.dao.AdminDao"%>
<%@page import="com.ramaasoft.Entities.AdminEntity"%>
<%
    AdminEntity getAdmin1 = (AdminEntity) UserDefinedCookies.getAdminCookies(request, "adminLogin");
    AdminEntity adminData1 = null;
    if (getAdmin1 != null)
        adminData1 = AdminDao.getAdmin(getAdmin1.getEmail(), getAdmin1.getMobile());
%>
<header id="header" class="header fixed-top d-flex align-items-center">
    <div class="d-flex align-items-center justify-content-between">
        <a href="index.jsp" class="logo d-flex align-items-center">
            <!--<img src="./assets/img/logo.png" alt="">-->
            <span class="d-none d-lg-block">AdHeaven Admin<span class="text-danger fs-1">.</span></span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn" onclick="toggleSidebarBtn()" id="toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    <div class="search-bar">
        <form class="search-form d-flex align-items-center" method="POST" action="#">
            <input type="text" id="customSearchInput" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div> 
    <!--End Search Bar--> 
    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " onclick="searchBarToggle()" href="#" id="search-bar-toggle">
                    <i class="bi bi-search"></i>
                </a>
            </li><!-- End Search Icon-->
            <li class="nav-item dropdown pe-3">
                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="./uploads/<%= adminData1.getImage()%>" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2"><%= getAdmin1.getFull_name()%></span>
                </a><!-- End Profile Iamge Icon -->
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6><%= getAdmin1.getFull_name()%></h6>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="users-profile.jsp">
                            <i class="bi bi-person"></i>
                            <span>My Profile</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="users-profile.jsp">
                            <i class="bi bi-gear"></i>
                            <span>Account Settings</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="pages-faq.jsp">
                            <i class="bi bi-question-circle"></i>
                            <span>Need Help?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="../AdminLogoutServlet">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Sign Out</span>
                        </a>
                    </li>
                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->
        </ul>
    </nav><!-- End Icons Navigation -->
</header>
<script>
    function toggleSidebarBtn() {
        document.body.classList.toggle('toggle-sidebar');
    };
    function searchBarToggle() {
        const search_bar = document.querySelector(".search-bar");
        search_bar.classList.toggle('search-bar-show');
    };
</script>