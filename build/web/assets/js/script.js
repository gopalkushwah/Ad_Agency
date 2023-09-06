/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const name = document.getElementById("name");
const mobile = document.getElementById("mobile");
const password = document.getElementById("password");
const cpassword = document.getElementById("cpassword");
const area = document.getElementById("area");
const city = document.getElementById("city");
const state = document.getElementById("state");
const address = document.getElementById("address");
const email = document.getElementById("email");

const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
function isEmailValid() {
    if (emailRegex.test(email.value)) {
        document.getElementById("isEmail").innerHTML = '';
        email.classList.add("is-valid");
        email.classList.remove("is-invalid");
    } else {
        document.getElementById("isEmail").innerHTML = 'Enter valid Email';
        email.classList.add("is-invalid");
        email.classList.remove("is-valid");

    }
}
const passwordRegex = /^(?=.*[A-Z]{1})(?=.*[a-z]{1})(?=.*[!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>\/?]{1})(?=.*\d{1}).{7,25}$/;

function isPasswordValid() {
    if (passwordRegex.test(password.value)) {
        isSameValid();
        document.getElementById("isPassword").innerHTML = '';
        password.classList.add("is-valid");
        password.classList.remove("is-invalid");

    } else {
        document.getElementById("isPassword").innerHTML = 'Password must have 2 (Uppercase,lowercase,digit and symbol)';
        password.classList.add("is-invalid");
        password.classList.remove("is-valid");

    }
}
function isConfPasswordValid() {
    if (passwordRegex.test(cpassword.value)) {
        isSameValid();
        document.getElementById("isConPassword").innerHTML = '';
        cpassword.classList.add("is-valid");
        cpassword.classList.remove("is-invalid");

    } else {
        document.getElementById("isConPassword").innerHTML = 'Password must have 2 (Uppercase,lowercase,digit and symbol)';
        cpassword.classList.add("is-invalid");
        cpassword.classList.remove("is-valid");

    }
}
function isSameValid() {
    if ((cpassword.value === password.value) && password.value.length > 7) {
        document.getElementById("isConPassword").innerHTML = '';
        cpassword.classList.add("is-valid");
        cpassword.classList.remove("is-invalid");

    } else {
        document.getElementById("isConPassword").innerHTML = 'Password and Confirm password should be same';
        cpassword.classList.add("is-invalid");
        cpassword.classList.remove("is-valid");

    }
}
const mobileRegex = /[6-9]\d{8}$/;
function isMobileValid() {
    if (mobileRegex.test(mobile.value)) {
        document.getElementById("isMobile").innerHTML = '';
        mobile.classList.add("is-valid");
        mobile.classList.remove("is-invalid");

    } else {
        document.getElementById("isMobile").innerHTML = 'Mobile Number length should be 10 and start with 6,7,8,9';
        mobile.classList.add("is-invalid");
        mobile.classList.remove("is-valid");

    }
}

//let messageCountSpan = document.getElementById("messageCount");
function messageCount(min, max, element) {
    let inputArea = document.getElementById(element);
//                messageCountSpan.innerHTML = inputArea.value.length;
    if (inputArea.value.length > max || inputArea.value.length < min) {
        inputArea.classList.add("is-invalid");
        inputArea.classList.remove("is-valid");
    } else {
        inputArea.classList.remove("is-invalid");
        inputArea.classList.add("is-valid");

    }
}

const fullNameRegex = /^[A-Za-z]+ [A-Za-z]+$/;

function isFullNameRegex(){
    if (fullNameRegex.test(name.value)) {
        document.getElementById("isName").innerHTML = '';
        name.classList.add("is-valid");
        name.classList.remove("is-invalid");

    } else {
        document.getElementById("isName").innerHTML = 'Name can only have two words!';
        name.classList.add("is-invalid");
        name.classList.remove("is-valid");

    }
}