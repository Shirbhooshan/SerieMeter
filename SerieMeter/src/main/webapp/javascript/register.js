/* Replace avatar placeholder with the selected image preview */
		function previewAvatar(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var circle = document.querySelector('.rg-avatar-circle');
					circle.innerHTML = '<img src="'
							+ e.target.result
							+ '" '
							+ 'style="width:100%; height:100%; object-fit:cover; border-radius:50%;">';
				};
				reader.readAsDataURL(input.files[0]);
			}
		}