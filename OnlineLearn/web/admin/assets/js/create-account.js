/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showPopUp() {
    const btn = document.getElementById('demo');
    btn.addEventListener('click', function () {
        const popup = document.querySelector(".popup");
        const closePopup = document.querySelector(".popup__close");
        popup.classList.remove("hide__popup");
        closePopup.addEventListener("click", () => {
            popup.classList.add("hide__popup");
        });
    });
}

showPopUp();
