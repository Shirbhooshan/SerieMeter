// Toggle password field between hidden and visible
// Also swaps the eye icon between eye.svg (hidden) and eye-black.svg (visible)
function epTogglePass(inputId, iconId) {
    const field = document.getElementById(inputId);
    const icon  = document.getElementById(iconId);

    if (field.type === 'password') {
        field.type = 'text';
        icon.src = '${pageContext.request.contextPath}/assets/icon/eye-black.svg';
    } else {
        field.type = 'password';
        icon.src = '${pageContext.request.contextPath}/assets/icon/eye.svg';
    }
}

// Show a live preview of the selected profile image before uploading
function epPreviewImage(event) {
    const file = event.target.files[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = function () {
        document.getElementById('ep-img-preview').src = reader.result;
    };
    reader.readAsDataURL(file);
}

// ---------- Auto-hide error message after 5 seconds ----------
document.addEventListener("DOMContentLoaded", function () {
    const errorMsg = document.getElementById("errorMsg");

    if (errorMsg) {
        setTimeout(function () {
            errorMsg.style.opacity = "0";
            setTimeout(function () {
                errorMsg.style.display = "none";
            }, 500); // wait for fade transition to complete
        }, 5000);
    }
});