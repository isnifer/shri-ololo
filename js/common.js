(function ($) {

    $(document).ready(function () {

        // Accordion
        var $body = $('body');
        $body.on('click', '.b-question__visibility', function () {
            $(this).toggleClass('b-question__visibility_state_plus');
            $(this).siblings('.b-question__interactive').toggleClass('b-question__interactive_state_hidden');
        });

    });

}(jQuery));