
<!DOCTYPE html>
<%
    session.setAttribute("title", "Search Ads");
%>
<html lang="en">
    <%@include file="common/head.jsp" %>
    <body>

        <!-- ======= Start Header ======= -->
        <%@include file="./common/header.jsp" %>
        <!-- ======= End Header ======= -->

        <!-- Navbar -->
        <%@include file="./common/navbar.jsp" %>
        <!-- Navbar -->
        <main id="main" class="main">
            <!-- ======= Breadcrumbs ======= -->
            <div class="breadcrumbs">
                <div class="page-header d-flex align-items-center" style="background-image: url('');">
                    <div class="container position-relative">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-6 text-center">
                                <h2>Search ads</h2>
                                <input class="form-control me-2" type="text" id="searchInput" placeholder="Search ads..."/>
                            </div>
                        </div>
                    </div>
                </div>
                <nav>
                    <div class="container">
                        <ol>
                            <li><a href="index.html">Home</a></li>
                            <li>Search Results</li>
                        </ol>
                    </div>
                </nav>
            </div><!-- End Breadcrumbs -->
            <section id="blog" class="blog">
                <div class="container" data-aos="fade-up">
                    <div class="row gy-4 posts-list" id="resultsContainer">
                    </div>
                </div>
            </section>
        </main>

        <!-- ======= Footer ======= -->
        <%@include file="common/footer.jsp" %>
        <!-- End Footer -->

        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <div id="preloader"></div>
        <<script src="./assets/js/searchads.js"></script>
        <%@include file="./common/commonjs.jsp" %>

    </body>

</html>