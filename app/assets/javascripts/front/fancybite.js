var fancybite = {};

fancybite.init = function(){
    $('.full-black-overlay').hide();
    $('.order-detail').hide();
    $('#cart').show();
};

fancybite.openDetail = function(){
    $('.full-black-overlay').show();
    $('#cart').hide();
    $('.order-detail').show();
};

(function($) {
    $(document).ready(function(){

        fancybite.init();


        $('.menu-click').click(function(){
            $.get('/frontpage/1');
        });

        $('.full-black-overlay').click(function(){
            fancybite.init();
        })
    });
})(jQuery);