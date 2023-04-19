//FAQ JS
// Get all Accordion and Panel
let accHeading = document.querySelectorAll(".accordion");
let accPanel = document.querySelectorAll(".accordion-panel");

for (let i = 0; i < accHeading.length; i++) {
    // Execute whenever an accordion is clicked 
    accHeading[i].onclick = function() {
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

//Our Projct Tab js 
function openProject(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("project_v2_tab_content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("project_v2_tab_links");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("OpenProject").click();