$(document).ready(function() {

    NProgress.start();
    NProgress.done();

    $(document).on('page:fetch',   function() { NProgress.start(); });
    $(document).on('page:change',  function() { NProgress.done(); });
    $(document).on('page:restore', function() { NProgress.remove(); });
 
  $("#pictures").owlCarousel({
    autoPlay: 4000,
    slideSpeed: 600,
    paginationSpeed: 800,
    singleItem: true,
    transitionStyle: "fade"
  });

  $("#services").owlCarousel({
    autoPlay: 4000,
    slideSpeed: 600,
    paginationSpeed: 800,
    singleItem: true,
    stopOnHover: true,
    transitionStyle: "fade"
  });

  $( "#nav-links li a" ).click(function() {
    $("#nav-links li a").removeClass("selected");
    $(this).addClass("selected");
  });

  $("#sidebar-slides").owlCarousel({
    singleItem: true,
    lazyLoad : true,
    navigation : true
  });
});