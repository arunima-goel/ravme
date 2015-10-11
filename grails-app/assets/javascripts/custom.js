$( document ).ready(function() {

	/* Add/Remove Active Class */
    $("ul.second-nav li").click(function() {  
        $(this).addClass('selected').siblings().removeClass('selected');
    });

    /* Smooth Scrolling Effect */
    $(document).on('click', '.nav-link', function(e) {
    	e.preventDefault();
        $('html, body').animate({
            scrollTop: $( $.attr(this, 'href') ).offset().top}, 500);
    })

});
