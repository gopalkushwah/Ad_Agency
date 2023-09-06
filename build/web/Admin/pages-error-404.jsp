<%
String isAdminLogin1 = UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    if(isAdminLogin1==null)
        response.sendRedirect("pages-login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="admin_common/head.jsp" %>
<body>

  <main>
    <div class="container">
      <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
        <h1>404</h1>
        <h2>The page you are looking for doesn't exist.</h2>
        <a class="btn" href="index.jsp">Back to home</a>
        <img src="assets/img/not-found.svg" class="img-fluid py-5" alt="Page Not Found">
      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
      <%@include file="admin_common/commonjs.jsp" %>
</body>

</html>