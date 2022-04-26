/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function onClickBlockAccount(data) {

    if (confirm("Do you continue?")) {
        $.ajax({
            type: "post",
            url: "block-account",
            data: {
                id: data,
                flag: 3
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

function onClickUnBlockAccount(data) {

    if (confirm("Do you continue?")) {
        $.ajax({
            type: "post",
            url: "block-account",
            data: {
                id: data,
                flag: 2
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

