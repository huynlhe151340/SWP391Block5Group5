/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var sourceBase64 = null;
function changeImage(event) {
    var reader = new FileReader();
    reader.onload = function () {
        var output = document.getElementById('img-avatar');
        output.src = reader.result;
        sourceBase64 = output.src;
    };
    reader.readAsDataURL(event.target.files[0]);
}

function onClickAddPost() {
    const title = document.getElementById("title").value;
    const author = document.getElementById("author").value;
//    var category = document.getElementById("category");
    const detail = document.getElementById("detail").value;
    const uploadImage = document.getElementById("upload-photo").value;
    var getSelectedValue = document.querySelector(
            'input[name="category"]:checked');
    var tempCategory = "";
    if (getSelectedValue != null) {
        tempCategory = getSelectedValue.value;
    } else {
        tempCategory = "You have not selected any season";
    }
    
    var splitImage = uploadImage.split('\\');
//    alert(splitImage[splitImage.length-1]);
    
    if (confirm("Do you continue?")) {
        $.ajax({
            type: "post",
            url: "create-post",
            data: {
                title: title,
                author: author,
                detail: detail,
                category: tempCategory,
                image: splitImage[splitImage.length-1]
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
