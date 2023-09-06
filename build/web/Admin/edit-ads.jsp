<%@page import="com.ramaasoft.dao.AdsDao"%>
<%@page import="com.ramaasoft.Entities.AdsEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("title", "Edit ads");
    String isAdminLogin1 = UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    if(isAdminLogin1==null)
        response.sendRedirect("pages-login.jsp");
        
    int adsIdPara = Integer.parseInt(request.getParameter("adsid"));
    AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
    AdsEntity ads = AdsDao.getAllAdsByAdsId(adsIdPara,admin.getAdmin_id());
%>
<!DOCTYPE html>
<html>
    <%@include file="admin_common/head.jsp" %>
    <body>
        <!-- ======= Header ======= -->
        <%@include file="./admin_common/navbar.jsp" %>
        <!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <%@include file="./admin_common/sidebar.jsp" %>
        <!-- End Sidebar-->
        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Edit Ads</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="your-ads.jsp">Your Ads</a></li>
                        <li class="breadcrumb-item active">Edit Ads</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Add Image</h5>
                                <p class="alert alert-info" role="alert">You can select image of ratio 1024 * 768 px</p>
                                <div >
                                    <form class="mb-3 mt-3" action="../UploadAdsImageServlet" method="POST" enctype="multipart/form-data">
                                        <%                                            
                                            String adsImageUpdate = (String) session.getAttribute("adsImageUpdate");
                                            if (adsImageUpdate == "Image Updated Successfully..." || adsImageUpdate!=null) {
                                        %>
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                <%= adsImageUpdate%>
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        <%
                                            session.removeAttribute("adsImageUpdate");
                                        } else if(adsImageUpdate!=null){%>  
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                <%= adsImageUpdate%>
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        <% 
                                            session.removeAttribute("adsImageUpdate");
                                        }else{%>  
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            Please Select and Upload Image
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                        <%}%>                                        
                                        <div hidden="true">
                                            <input type="text" name="ad_id" value="<%=ads.getAd_id()%>" >
                                        </div>
                                        <div class="text-center">
                                            <label class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-start-5" for="adsImage">Select Image</label>
                                            <input type="file" hidden="true" accept="image/*" name="adsImage" id="adsImage">
                                            <input type="submit" hidden="true" id="submitfile" onclick="uploadAdsImageServlet()">
                                            <label class="custom-reg-btn pt-2 pb-2 ps-2 pe-3 rounded-end-5" for="submitfile"><i class="bi bi-arrow-up"></i></label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Add Ads for users</h5>

                                <!-- No Labels Form -->
                                <form class="row g-3" id="adminAdUpdate">
                                    <div class="col-md-12 border-bottom pb-1">
                                        <label for="ad_id" class="form-label text-success fw-bold">Ad Id</label>
                                        <input type="text" value="<%=ads.getAd_id()%>" readonly class="form-control" id="ad_id" placeholder="Enter Ad Title">
                                    </div>
                                    <div class="col-md-12 border-bottom pb-1">
                                        <label for="ad_title" class="form-label text-success fw-bold">Ad Title</label>
                                        <input type="text" value="<%=ads.getAd_title()%>" class="form-control" id="ad_title" placeholder="Enter Ad Title">
                                    </div>
                                    <div class="col-md-12 border-bottom pb-1">
                                        <label for="ad_description" class="form-label text-success fw-bold">Ad Description</label>
                                        <input type="text" value="<%=ads.getAd_description()%>" id="ad_description" class="form-control" placeholder="Enter Ad Description">
                                    </div>
                                    <div class="col-md-12 border-bottom pb-1">
                                        <label for="ad_url" class="form-label text-success fw-bold">Ad Url</label>
                                        <input type="text" value="<%=ads.getAd_url()%>" class="form-control" id="ad_url" placeholder="Enter ad url">
                                    </div>
                                    <div class="col-12 border-bottom pb-1">
                                        <label for="ad_platform" class="form-label text-success fw-bold">Ad Platform</label>
                                        <input type="text" value="<%=ads.getAd_platform()%>" class="form-control" id="ad_platform" placeholder="Enter ad platform name">
                                    </div>
                                    <div class="col-12 border-bottom pb-1">
                                        <label for="ad_budget" class="form-label text-success fw-bold">Ad Budget</label>
                                        <input type="text" value="<%=ads.getAd_budget()%>" class="form-control" id="ad_budget" placeholder="Enter ad budget">
                                    </div>
                                    <div class="col-md-12 border-bottom pb-1">
                                        <label for="ad_status" class="form-label text-success fw-bold">Ad Status</label>
                                        <select id="ad_status" class="form-select">
                                            <option value="<%=ads.getAd_status()%>"  selected><%=ads.getAd_status()%></option>
                                            <option value="Choose Ad Status">Choose Ad Status </option>
                                            <option value="Active" id="Display">Active</option>
                                            <option value="Out Of Stock" id="Video">Out Off Stock</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 border-bottom pb-1">
                                        <label for="ad_type" class="form-label text-success fw-bold">Ad Type</label>
                                        <select id="ad_type" class="form-select">
                                            <option value="<%=ads.getAd_type()%>"  selected><%=ads.getAd_type()%></option>
                                            <option value="Choose ad type" >Choose ad type </option>
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
                                    <div class="col-md-12 pb-1">
                                        <label for="ad_format" class="form-label text-success fw-bold">Ad Format</label>
                                        <select id="ad_format" class="form-select">
                                            <option value="<%=ads.getAd_format()%>"  selected><%=ads.getAd_format()%></option>
                                            <option value="Choose Ad Format">Choose Ad Format</option>
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
                                    <div class="text-center">
                                        <button type="button" class="btn btn-outline-success" onclick="adminAdUpdate()">Submit</button>
                                        <a href="../DeleteAdsServlet?adsid=<%= ads.getAd_id() %>" class="btn btn-outline-danger"><i class="bi bi-trash"></i></a>
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

            function adminAdUpdate() {
                const ad_title = document.getElementById("ad_title").value;
                const ad_description = document.getElementById("ad_description").value;
                const ad_budget = document.getElementById("ad_budget").value;
                const ad_platform = document.getElementById("ad_platform").value;
                const ad_type = document.getElementById("ad_type").value;
                const ad_format = document.getElementById("ad_format").value;
                const ad_url = document.getElementById("ad_url").value;
                const ad_status = document.getElementById("ad_status").value;
                const ad_id = <%=adsIdPara%>;

                const data = {
                    ad_title: ad_title,
                    ad_description: ad_description,
                    ad_budget: ad_budget,
                    ad_platform: ad_platform,
                    ad_type: ad_type,
                    ad_format: ad_format,
                    ad_url: ad_url,
                    ad_status: ad_status,
                    ad_id: ad_id
                };
                const formData = new URLSearchParams();
                for (const key in data) {
                    formData.append(key, data[key]);
                }
                //          console.log(formData.toString());
                if (ad_type === "Choose ad type" || ad_format === "Choose Ad Format" || ad_status === "Choose Ad Status") {
                    Swal.fire({
                        position: 'top',
                        icon: 'error',
                        title: "Please choose anyone from others",
                        confirmButtonColor: '#ff0000',
                        timer: 3000
                    });
                } else {
                    fetch("../AdsUpdateServlet", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/x-www-form-urlencoded"
                        },
                        body: formData.toString()
                    })
                            .then(response => response.text())
                            .then(data => {
                                Swal.fire({
                                    position: "top",
                                    title: data,
                                    confirmButtonColor: "#013220",
                                    timer: 3000
                                });
                            }).catch(error => {
                        Swal.fire({
                            position: "top",
                            title: "Error Updating Data " + error,
                            confirmButtonColor: "#00ff00",
                            timer: 3000
                        });
                    });
                }
            }
        </script>
        <%@include file="./admin_common/commonjs.jsp" %>
        <!--js files-->

    </body>
</html>
