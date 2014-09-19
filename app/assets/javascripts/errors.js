var error_and_notice_messages= {


    show_errors: function(text){
        $('#at_error').text(text);
        $('#at_error').fadeIn('fast');
        $('#at_error').delay(5000).fadeOut('slow');
    },

    show_notice: function(text){
        $('#at_notice').text(text);
        $('#at_notice').fadeIn('fast');
        $('#at_notice').delay(5000).fadeOut('slow');
    }


};

$(document).ready(function() {

});