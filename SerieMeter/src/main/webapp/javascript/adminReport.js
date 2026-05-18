/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
    const rows = document.querySelectorAll(".ad-media-table tbody tr");
    const loadMoreBtn = document.getElementById("loadMoreBtn");
    const rowsToShow = 3;
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