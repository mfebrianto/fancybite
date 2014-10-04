var fancybite = {};

fancybite.init = function(){
    $('.full-black-overlay').hide();
    $('#cart').show();
};

fancybite.openDetail = function(){
    $('.full-black-overlay').show();
    $('#cart').hide();
};

(function($) {
    $(document).ready(function(){

        fancybite.init();


        $('.menu-click').click(function(){
            alert('clicked');
            $.get('/frontpage/1');
        });
    });
})(jQuery);