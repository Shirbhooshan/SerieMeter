var slides = document.querySelectorAll('.sm_hero_slide');
var dots = document.querySelectorAll('#heroDots span');
var current = 0;

/* Switching to slide i and update the dots */
function goToSlide(i) {
    slides[current].classList.remove('active');
    if (dots[current])
        dots[current].classList.remove('active');

    current = i;

    slides[current].classList.add('active');
    if (dots[current])
        dots[current].classList.add('active');
}

/* Auto advances every 4 seconds */
if (slides.length > 1) {
    setInterval(function() {
        goToSlide((current + 1) % slides.length);
    }, 4000);
}

