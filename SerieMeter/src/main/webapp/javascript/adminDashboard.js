/**
 * 
 */
// ---------- Auto-hide messages after 5 seconds ----------
document.addEventListener("DOMContentLoaded", function() {
	const successMsg = document.getElementById("successMsg");
	const errorMsg = document.getElementById("errorMsg");
	
	if (successMsg) {
		setTimeout(function() {
			successMsg.style.opacity = "0";
			setTimeout(function() {
				successMsg.style.display = "none";
			}, 500); // wait for fade transition
		}, 5000);
	}
	
	if (errorMsg) {
		setTimeout(function() {
			errorMsg.style.opacity = "0";
			setTimeout(function() {
				errorMsg.style.display = "none";
			}, 500);
		}, 5000);
	}
});

document.addEventListener("DOMContentLoaded", function() {
    const rows = document.querySelectorAll("#userTableBody tr");
    const loadMoreBtn = document.getElementById("loadMoreBtn");
    const rowsToShow = 10;
    let currentCount = rowsToShow;

    // Initially hide rows beyond the first batch
    rows.forEach((row, i) => {
        if (i >= rowsToShow) row.style.display = "none";
    });

    // Hide button if total rows are less than the initial batch
    if (rows.length <= rowsToShow) loadMoreBtn.style.display = "none";

    loadMoreBtn.addEventListener("click", function() {
        let nextBatch = currentCount + rowsToShow;
        
        rows.forEach((row, i) => {
            if (i >= currentCount && i < nextBatch) {
                row.style.display = ""; // Reveal row
            }
        });

        currentCount = nextBatch;

        // Hide button if we reached the end of the data
        if (currentCount >= rows.length) {
            loadMoreBtn.style.display = "none";
        }
    });
});