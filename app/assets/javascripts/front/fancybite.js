var fancybite = {};

fancybite.init = function(){
    $('.full-black-overlay').hide();
    $('.menu-item-detail').hide();
    $('.order-detail').hide();
    $('#cart').show();
};

fancybite.openDetail = function(){
    $('.full-black-overlay').show();
    $('#cart').hide();
    $('.menu-item-detail').show();
};

fancybite.openOrderDetail = function(){
    $('.full-black-overlay').show();
    $('#cart').hide();
    $('.order-detail').show();
};

fancybite.number_of_order_on_basket = function(number_of_order){
    $('#cart-content').text(number_of_order);
};

(function($) {
    $(document).ready(function(){

        fancybite.init();


        $('.menu-click').click(function(){
            $.get('/frontpage/' + this.id);
        });

        $('.full-black-overlay').click(function(){
            fancybite.init();
        });
    });
})(jQuery);