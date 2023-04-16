(function ($) {
    ("use strict");
    //slick slider
    //slick_slider_2021
    /*
    var slickSlider2021 = $(".slick_slider_2021");
    if (slickSlider2021.length) {
        $('.slick_slider_2021').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            responsive: [{
                breakpoint: 768,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '0px',
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '0px',
                    slidesToShow: 1
                }
            }
            ]
        });
    }
    */

    //slick_slider_2022
    /*
    var slickSlider2022 = $(".slick_slider_2022");
    if (slickSlider2022.length) {
        $('.slick_slider_2022').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            responsive: [{
                breakpoint: 768,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '0px',
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '0px',
                    slidesToShow: 1
                }
            }
            ]
        });
    }
    */

    //slick_slider_2023
    var slickSlider2023 = $(".slick_slider_2023");
    if (slickSlider2023.length) {
        $('.slick_slider_2023').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            responsive: [{
                breakpoint: 991,
                settings: {
                    arrows: false,
                }
            },
            {
                breakpoint: 768,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '0px',
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '0px',
                    slidesToShow: 1
                }
            }
            ]
        });
    }

    //RoadMapV2 Slide

    var sliderFor = $(".slider-for");
    if (sliderFor.length) {
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.slider-nav'
        });
    }
    var sliderNav = $(".slider-nav");
    if (sliderNav.length) {
        $('.slider-nav').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            asNavFor: '.slider-for',
            dots: true,
            focusOnSelect: true
        });
    }

    $('a[data-slide]').click(function (e) {
        e.preventDefault();
        var slideno = $(this).data('slide');
        $('.slider-nav').slick('slickGoTo', slideno - 1);
    });


    //Our Partnar Show hidep 
    var our_partners_content_sect = $(".our_partners_content_sect");
    if (our_partners_content_sect.length) {
        $('.show-more-btn-sect button').click(function () {
            $('.show-more-btn-sect button').toggleClass('active');
        });

        $(document).ready(function () {
            $(".show-more-btn-sect button").click(function () {
                $(".our_partners_content_sect .overlay").fadeToggle();
                $(".our_partners_content_sect .our_partners_list li.hidden").fadeToggle();
            });
        });
    }

    //FAQ js
    var faq_content_sect = $(".faq_content_sect");
    if (faq_content_sect.length) {
        // Get all Accordion and Panel
        let accHeading = document.querySelectorAll(".accordion");
        let accPanel = document.querySelectorAll(".accordion-panel");

        for (let i = 0; i < accHeading.length; i++) {
            // Execute whenever an accordion is clicked 
            accHeading[i].onclick = function () {
                if (this.nextElementSibling.style.maxHeight) {
                    hidePanels(); // Hide All open Panels 
                } else {
                    showPanel(this); // Show the panel
                }
            };
        }

        // Function to Show a Panel
        function showPanel(elem) {
            hidePanels();
            elem.classList.add("active");
            elem.nextElementSibling.style.maxHeight = elem.nextElementSibling.scrollHeight + "px";
        }

        // Function to Hide all shown Panels
        function hidePanels() {
            for (let i = 0; i < accPanel.length; i++) {
                accPanel[i].style.maxHeight = null;
                accHeading[i].classList.remove("active");
            }
        }
    }

})(jQuery);

// RoadMap Tab 
var roadmap_v2_section = $(".roadmap_v2_section");
if (roadmap_v2_section.length) {
    function openCity(evt, TabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(TabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
}

// Proect Tab 
var project_pools_sect = $(".project_pools_sect");
if (project_pools_sect.length) {
    function openProject(evt, TabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("project_v2_tab_content");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("project_v2_tab_links");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(TabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("OpenProject").click();
}