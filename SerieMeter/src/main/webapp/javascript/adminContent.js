document.getElementById('posterFileInput').addEventListener(
    'change',
    function(e) {
        const file = e.target.files[0];
        if (!file)
            return;

        const reader = new FileReader();
        reader.onload = function(event) {
            const img = document.getElementById('posterImage');
            const placeholder = document
                .getElementById('uploadPlaceholder');
            const preview = document
                .getElementById('posterPreview');

            img.src = event.target.result;
            img.style.display = 'block';
            placeholder.style.display = 'none';
            preview.style.border = 'none';
        };
        reader.readAsDataURL(file);
    });