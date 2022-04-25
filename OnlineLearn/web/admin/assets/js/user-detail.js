/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function submitUpdate() {
    const id = document.getElementById("id").value;
    const name = document.getElementById("name").value;
//    var category = document.getElementById("category");
    const mobile = document.getElementById("mobile").value;
    const address = document.getElementById("address").value;
    var getSelectedValue = document.querySelector(
            'input[name="gender"]:checked');
    var tempCategory = "";
    if (getSelectedValue != null) {
        tempCategory = getSelectedValue.value;
    } else {
        tempCategory = "You have not selected any season";
    }
    
    
    if (confirm("Do you continue?")) {
        $.ajax({
            type: "post",
            url: "update-user-admin",
            data: {
                id: id,
                name: name,
                mobile: mobile,
                address: address,
                gender: tempCategory
            },
            success: function (resultText) {
//                $('#result-change').html(resultText);
                alert(resultText);
                location.reload();
            },
            error: function (jqXHR, exception) {
                console.log('Error occured!!');
            }
        });
    }
}
