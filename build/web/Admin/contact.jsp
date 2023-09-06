<%--<%@page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="pages-error-404.jsp" %>--%>
<!DOCTYPE html>
<%
    AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
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
      <h1>Contact</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Contact</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section contact">

      <div class="row gy-4">

        <div class="col-xl-6">

          <div class="row">
            <div class="col-lg-6">
              <div class="info-box card">
                <i class="bi bi-geo-alt"></i>
                <h3>Address</h3>
                <p>Indrapuri Sector A , <br>Bhopal , Near Ramaasoft PVT</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="info-box card">
                <i class="bi bi-telephone"></i>
                <h3>Call Us</h3>
                <p>+91 9988776655<br>+91 8877665544</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="info-box card">
                <i class="bi bi-envelope"></i>
                <h3>Email Us</h3>
                <p>info@adagency.com<br>contact@adagency.com</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="info-box card">
                <i class="bi bi-clock"></i>
                <h3>Open Hours</h3>
                <p>Monday - Friday<br>9:00AM - 09:00PM</p>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-6">
          <div class="card p-4">
            <form class="php-email-form">
              <div class="row gy-4">

                <div class="col-md-6" hidden>
                    <label for="admin_id">Your Type</label>
                    <input type="text" value="Seller" name="id" id="type" class="form-control is-valid" placeholder="Your Id" required readonly>
                </div>

                <div class="col-md-6">
                    <label for="name">Your Name</label>
                  <input type="text" value="<%= admin.getFull_name()%>" name="name" id="name" class="form-control is-valid" placeholder="Your Name" required readonly>
                </div>

                <div class="col-md-6 ">
                    <label for="email">Your Email</label>
                  <input type="email" value="<%= admin.getEmail()%>" class="form-control is-valid" name="email" id="email" placeholder="Your Email" required readonly>
                </div>
                <div class="col-md-12 ">
                    <label for="mobile">Your Mobile</label>
                  <input type="text" value="<%= admin.getMobile() %>" class="form-control is-valid" name="mobile" id="mobile" placeholder="Your Mobile" required readonly>
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" onkeydown="messageCount(10,50,'subject')" name="subject" id="subject" placeholder="Subject" required>
                </div>

                <div class="col-md-12">
                    <textarea class="form-control" onkeydown="messageCount(20,500,'message')" name="message" id="message" rows="6" placeholder="Message" required></textarea>
                  Character Count : <span id="messageCount"></span>
                </div>

                <div class="col-md-12 text-center">
                    <button type="button" onclick="sendMessage()">Send Message</button>
                </div>

              </div>
            </form>
          </div>

        </div>

      </div>

    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  
  <!-- ======= Footer ======= -->
  <%@include file="./admin_common/footer.jsp" %>
  <!-- End Footer -->
  <script>
      let messageCountSpan = document.getElementById("messageCount");
      function messageCount(min,max,element){
          let inputArea = document.getElementById(element);
          messageCountSpan.innerHTML = inputArea.value.length;
          if(inputArea.value.length > max || inputArea.value.length < min){
              inputArea.classList.add("is-invalid");
              inputArea.classList.remove("is-valid");
          }else{
              inputArea.classList.remove("is-invalid");
              inputArea.classList.add("is-valid");
              
          }
      }
  </script>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <script>
    function sendMessage() {
        const user_type = document.getElementById("type").value;
        const mobile_number = document.getElementById("mobile").value;
        const contact_name = document.getElementById("name").value;
        const contact_email = document.getElementById("email").value;
        const contact_us_subject = document.getElementById("subject").value;
        const contact_message = document.getElementById("message").value;
        
        const mobileReg = /^[6-9]\d{9}$/;
        const emailReg = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

        if (contact_name.length > 0) {
            if (mobileReg.test(mobile_number)) {
                if (emailReg.test(contact_email)) {
                    if (contact_us_subject.length >= 10 && contact_us_subject.length <= 50) {
                        if (contact_message.length >= 20 && contact_message.length <= 500) {
                            const data = {
                                contact_name: contact_name,
                                contact_email: contact_email,
                                contact_us_subject: contact_us_subject,
                                contact_message: contact_message,
                                user_type: user_type,
                                mobile_number: mobile_number,
                            };
                            const formData = new URLSearchParams();
                            for (const key in data) {
                                formData.append(key, data[key]);
                            };
                            fetch('../ContactUsServlet', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded'
                                },
                                body: formData.toString()
                            })
                                    .then(response => response.text())
                                    .then(data => {
                                        Swal.fire({
                                            title: data,
                                            timer: 3000
                                        });
                                    }).catch(error => {
                                Swal.fire({
                                    title: error,
                                    timer: 3000
                                });
                            });
                        } else {
                            Swal.fire({
                                title: "Message length should be > 20 and < 500",
                                timer: 3000
                            });
                        }
                    } else {
                        Swal.fire({
                            title: "Subject length should be > 10 and < 50",
                            timer: 3000
                        });
                    }

                } else {
                    Swal.fire({
                        title: "Please enter valid email",
                        timer: 3000
                    });
                }
            } else {
                Swal.fire({
                    title: "Please enter valid mobile number",
                    timer: 3000
                });
            }
        } else {
            Swal.fire({
                title: "Please Write your full name",
                timer: 3000
            });
        }
        
    
    }

</script>
<%@include file="./admin_common/commonjs.jsp" %>
  <!--js files-->

    </body>
</html>