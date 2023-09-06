<%--<%@page language="java" errorPage="pages-error-404.jsp" %>--%>
<!DOCTYPE html>
<%
    session.setAttribute("title", "Add Data");
    String isAdminLogin1 = UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    if(isAdminLogin1==null)
        response.sendRedirect("pages-login.jsp");
%>
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
      <h1>Add Data</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="Admin/index.jsp">Home</a></li>
          <li class="breadcrumb-item active">Add Data</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <section class="section">
      <div class="row">
          <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Add Ads for users</h5>
              <form class="row g-3" id="adminAds" >
                <div class="col-md-12">
                    <label class="form-label fw-bold fs-5" for="ad_title">Title</label>
                    <input type="text" class="form-control border-secondary box-shadow" id="ad_title" placeholder="Enter Ad Title *" required>
                </div>
                <div class="col-md-12">
                    <label class="form-label fw-bold fs-5" for="ad_description">Description</label>
                    <input type="text" id="ad_description" class="form-control border-secondary box-shadow" placeholder="Enter Ad Description *" required>
                </div>
                <div class="col-12">
                    <label class="form-label fw-bold fs-5" for="ad_platform">Platform Name</label>
                    <input type="text" class="form-control border-secondary box-shadow" id="ad_platform" placeholder="Enter ad platform name *" required>
                </div>
                <div class="col-12">
                    <label class="form-label fw-bold fs-5" for="ad_budget">Cost <span class="text-secondary" style="font-size: 12px;">cost will be considered for 1 month</span></label>
                    <input type="text" class="form-control border-secondary box-shadow" id="ad_budget" placeholder="Enter ad cost *" required>
                </div>
                <div class="col-md-12">
                  <select id="ad_type" class="form-select border-secondary box-shadow" required>
                    <option value="Choose ad type"  selected>Choose ad type *</option>
                    <option value="Display" id="Display">Display</option>
                    <option value="Video" id="Video">Video</option>
                    <option value="Search" id="Search">Search</option>
                    <option value="Social Media" id="Social_Media">Social Media</option>
                    <option value="Print" id="Print">Print</option>
                    <option value="Radio" id="Radio">Radio</option>
                    <option value="Television" id="Television">Television</option>
                    <option value="Outdoor" id="Outdoor">Outdoor</option>
                    <option value="Native" id="Native">Native</option>
                    <option value="Influencer" id="Influencer">Influencer</option>
                    <option value="Email" id="Email">Email</option>
                    <option value="Interactive" id="Interactive">Interactive</option>
                    <option value="Rich Media" id="Rich_Media">Rich Media</option>
                    <option value="Product Placement" id="Product_Placement">Product Placement</option>
                  </select>
                </div>
                <div class="col-md-12">
                    <select id="ad_format" class="form-select border-secondary box-shadow" required>
                    <option value="Choose Ad Format" selected>Choose Ad Format *</option>
                    <option value="Banner">Banner</option>
                    <option value="Image">Image</option>
                    <option value="Video">Video</option>
                    <option value="Text">Text</option>
                    <option value="Carousel">Carousel</option>
                    <option value="Sponsored Post">Sponsored Post</option>
                    <option value="Audio">Audio</option>
                    <option value="Infomercial">Infomercial</option>
                    <option value="Billboard">Billboard</option>
                    <option value="Poster">Poster</option>
                    <option value="Transit">Transit</option>
                    <option value="Native" >Native</option>
                    <option value="Influencer">Influencer</option>
                    <option value="Email">Email</option>
                    <option value="Quiz">Quiz</option>
                    <option value="Game">Game</option>
                  </select>
                </div>
                <hr>
                <div class="text-center">
                    <button type="button" class="btn btn-outline-success" onclick="adminAdInsert()">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
              </form><!-- End No Labels Form -->
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

  <script>
      function adminAdInsert(){
          const ad_title = document.getElementById("ad_title").value;
          const ad_description = document.getElementById("ad_description").value;
          const ad_budget = document.getElementById("ad_budget").value;
          const ad_platform = document.getElementById("ad_platform").value;
          const ad_type = document.getElementById("ad_type").value;
          const ad_format = document.getElementById("ad_format").value;
          const data = {
              ad_title : ad_title,
              ad_description : ad_description,
              ad_budget : ad_budget,
              ad_platform : ad_platform,
              ad_type : ad_type,
              ad_format : ad_format,
          };
          const formData = new URLSearchParams();
          for (const key in data) {
            formData.append(key, data[key]);
          };
        if(ad_type==="Choose ad type" || ad_format==="Choose Ad Format"){
              Swal.fire({
                  position: 'top',
                  icon: 'error',
                  title:"Please choose anyone from others",
                  confirmButtonColor: '#ff0000',
                  timer:3000
              });
          }else{
              fetch("../InsertAdsServlet",{
                  method:"POST",
                  headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: formData.toString()
                 })
                .then(response => response.text())
                .then(data =>{
                    Swal.fire({
                        position: 'top',
                        title:data,
                        timer:3000
                    });
              }).catch(error => {
                  Swal.fire({
                      position: 'top',
                      icon: 'error',
                      title:error,
                      confirmButtonColor: '#ff0000',
                      timer:3000
                  });  
              });
          }
      }
  </script>
  <!--js files-->
  <%@include file="./admin_common/commonjs.jsp" %>
  <!--js files-->

</body>

</html>