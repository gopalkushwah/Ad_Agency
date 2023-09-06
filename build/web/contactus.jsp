<section id="contact" class="contact">
    <div class="container" data-aos="fade-up">
        <div class="section-header">
            <h2>Contact</h2>
            <p>We are thrilled to connect with you. Whether you're seeking innovative marketing solutions, creative campaigns, or expert consultation, our team is here to help you achieve your goals. </p>
        </div>
        <div class="row gx-lg-0 gy-4">
            <div class="col-lg-4">
                <div class="info-container d-flex flex-column align-items-center justify-content-center">
                    <div class="info-item d-flex">
                        <i class="bi bi-geo-alt flex-shrink-0"></i>
                        <div>
                            <h4>Location:</h4>
                            <p>Indrapuri Sector A , Bhopal , Near Ramaasoft PVT</p>
                        </div>
                    </div><!-- End Info Item -->
                    <div class="info-item d-flex">
                        <i class="bi bi-envelope flex-shrink-0"></i>
                        <div>
                            <h4>Email:</h4>
                            <p>info@adagency.com</p>
                        </div>
                    </div><!-- End Info Item -->
                    <div class="info-item d-flex">
                        <i class="bi bi-phone flex-shrink-0"></i>
                        <div>
                            <h4>Call:</h4>
                            <p>+91 9977665544</p>
                        </div>
                    </div><!-- End Info Item -->

                    <div class="info-item d-flex">
                        <i class="bi bi-clock flex-shrink-0"></i>
                        <div>
                            <h4>Open Hours:</h4>
                            <p>Mon-Sat: 9AM - 9PM</p>
                        </div>
                    </div><!-- End Info Item -->
                </div>

            </div>

            <div class="col-lg-8">
                <form role="form" class="php-email-form">
                    <div class="row">
                        <div class="col-md-6 form-group" hidden>
                            <label for="admin_id">Your Type</label>
                            <input type="text" value="User" name="id" id="type" class="form-control is-valid" placeholder="Your Id" required readonly>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="mobile">Your Name</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <label for="mobile">Your Email</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                        </div>
                    </div>
                    <div class="col-md-12 form-group">
                        <label for="mobile">Your Mobile</label>
                        <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Your Mobile" required>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="subject" onkeydown="messageCount(10, 50, 'subject')" id="subject" placeholder="Subject" required>
                    </div>
                    <div class="form-group mt-3">
                        <textarea class="form-control" name="message" id="message" onkeydown="messageCount(20, 500, 'message')" rows="7" placeholder="Message" required></textarea>
                        Character Count : <span id="messageCount"></span>
                    </div>
                    <div class="text-center"><button type="button" class="btn btn-dark " onclick="sendMessage()">Send Message</button></div>
                </form>
            </div><!-- End Contact Form -->
        </div>
    </div>
</section>

<script>
    let messageCountSpan = document.getElementById("messageCount");
    function messageCount(min, max, element) {
        messageCountSpan.innerHTML = document.getElementById(element).value.length;
        if (inputArea.value.length > max || inputArea.value.length < min) {
            inputArea.classList.add("is-invalid");
            inputArea.classList.remove("is-valid");
        } else {
            inputArea.classList.remove("is-invalid");
            inputArea.classList.add("is-valid");

        }
    }
</script>

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
                            }
                            ;
                            fetch('ContactUsServlet', {
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