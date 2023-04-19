//circle progress js
$('.progress.progress-1').circleProgress({
    max: 100,
    value: 78,
    animation: 'easeInOutCubic',
    animationDuration: 2000,
});
$('.progress.progress-2').circleProgress({
    max: 100,
    value: 88,
    animation: 'easeInOutCubic',
    animationDuration: 2000,
});
$('.progress.progress-3').circleProgress({
    max: 100,
    value: 90,
    animation: 'easeInOutCubic',
    animationDuration: 2000,
});

/*-------------------------
Project clasic js
-------------------------*/
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("my_slides");
    let dots = document.getElementsByClassName("dot");
    if (n > slides.length) {
        slideIndex = 1
    }
    if (n < 1) {
        slideIndex = slides.length
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}