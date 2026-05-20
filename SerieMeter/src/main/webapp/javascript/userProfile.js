// ── Copy-email-to-clipboard logic
const copyIcon = document.querySelector('.up-copy-icon');
copyIcon.addEventListener('click', function() {

    // Read the email text from the paragraph's first text node
    const email = document.querySelector('.up-user-email').childNodes[0].textContent.trim();

    navigator.clipboard.writeText(email)
        .then(function() {
            // Swap to checkmark for 2 seconds as visual confirmation
            copyIcon.src = '${pageContext.request.contextPath}/assets/icon/check.svg';
            copyIcon.title = 'Copied!';

            setTimeout(function() {
                copyIcon.src = '${pageContext.request.contextPath}/assets/icon/copy.svg';
                copyIcon.title = '';
            }, 2000);
        })
        .catch(function() {
            alert('Failed to copy email. Please copy it manually.');
        });
});