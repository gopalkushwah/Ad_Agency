<%--<%@page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="pages-error-404.jsp" %>--%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="./admin_common/head.jsp" %>
<body>

  <!-- ======= Header ======= -->
    <%@include file="./admin_common/navbar.jsp" %>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@include file="./admin_common/sidebar.jsp" %>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Blank Page</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Blank</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Example Card</h5>
              <p>This is an examle page with no contrnt. You can use it as a starter for your custom pages.</p>
            </div>
          </div>

        </div>

        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Example Card</h5>
              <p>This is an examle page with no contrnt. You can use it as a starter for your custom pages.</p>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  
  <!-- ======= Footer ======= -->
  <%@include file="./admin_common/footer.jsp" %>
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
<%@include file="./admin_common/commonjs.jsp" %>
  <!--js files-->

    </body>
</html>