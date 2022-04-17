/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function displayPostNotification() {
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
        this.onClickEditProfile();
    }
}

function onClickEditProfile() {
    const name = document.getElementById('name').value;
    const mobile = document.getElementById('mobile').value;
    const email = document.getElementById('email').value;
    const address = document.getElementById('address').value;
    const gender = document.getElementById('gender').value;

    if (confirm("Do you continue?")) {
        $.ajax({
            type: "post",
            url: "edit-profile",
            data: {
                name: name,
                mobile: mobile,
                email: email,
                address: address,
                gender: gender
            },
            success: function (resultText) {
                $('#result').html(resultText);
            },
            error: function (jqXHR, exception) {
                console.log('Error occured!!');
            }
        });
    }
}