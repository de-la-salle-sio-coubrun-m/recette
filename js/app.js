window.addEventListener('load',function(){
  function hideLoader() {
    $('.loader').hide();
}

$(window).ready(hideLoader);


});

var links = document.querySelectorAll('.nav-link.dropdown-toggle');
        
if (links) {
    for (var link of links) {
        link.addEventListener('click', function () {
        var menu = document.querySelector('.dropdown').classList.contains('show');
        if ( menu == true) {
            window.location = this.getAttribute('href');
        }
        });
    }
}