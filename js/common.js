(function ($) {

    $(document).ready(function () {

        // Accordion
        var $body = $('body');
        $body.on('click', '.b-question__visibility', function () {
            $(this).toggleClass('b-question__visibility_state_plus');
            $(this).siblings('.b-question__interactive').toggleClass('b-question__interactive_state_hidden');
        });

        // Select offer. View input on another value
        $('.b-about__select_offer').on('change', function () {
           if ($(this).val() === 'another') {
               $('.b-about__label_another-offer').addClass('b-about__label_another-offer_state_visible');
           } else {
               $('.b-about__label_another-offer').removeClass('b-about__label_another-offer_state_visible');
           }
        });

    });

}(jQuery));