/**
 * 
 */
	function togglePassword() {
		var passwordField = document.getElementById("passInput");
		var eyeIcon = document.getElementById("eyeIcon");

		if (passwordField.type === "password") {
			passwordField.type = "text";
			eyeIcon.src = "assets/icon/eye-black.svg";
		} else {
			passwordField.type = "password";
			eyeIcon.src = "assets/icon/eye.svg";
		}
	}