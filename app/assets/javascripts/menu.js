$(document).ready(navigation_handle);
$(document).on('page:load',navigation_handle);

function navigation_handle() {
  
  var state = 1;
  
    $(".btn-nav-bar").click(function (e) {
        e.preventDefault();
        if (state === 1) {
            $(".nav-bar").animate({
                left: 0
            });
            state = 0;
        } else {
            $(".nav-bar").animate({
                left: "-100%"
            });
            state = 1;
        }
    });
}

