
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function displayChangePasswordNotification() {
    let validate = true;
//    if (!validateName(false)) {
//        validate = false;
//    }
//    if (!validateEmail(false)) {
//        validate = false;
//    }
//    if (!validatePhone(false)) {
//        validate = false;
//    }
//    if (!validateTitle(false)) {
//        validate = false;
//    }
    if (validate) {
        this.onClickChangePassword();
    }
}

function onClickChangePassword(){
    const oldPassword = document.getElementById('oldPassword').value;
    const newPassword = document.getElementById('newPassword').value;
//    const email = document.getElementById('email').value;
    const reNewPassword = document.getElementById('re-newPassword').value;
    
    if (confirm("Do you continue?")) {
        $.ajax({
            type: "post",
            url: "change-password",
            data: {
                oldPassword: oldPassword,
//                email: email,
                newPassword: newPassword,
                reNewPassword: reNewPassword
            },
            success: function (resultText) {
                $('#result-change').html(resultText);
            },
            error: function (jqXHR, exception) {
                console.log('Error occured!!');
            }
        });
    }
}

