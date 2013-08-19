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
            var hiddenLabel = $('.b-about__label_another-offer');
            if ($(this).val() === 'another') {
                hiddenLabel.addClass('b-about__label_another-offer_state_visible');
                hiddenLabel.find('.b-about__input').addClass('b-question__field');
            } else {
                hiddenLabel.removeClass('b-about__label_another-offer_state_visible');
                hiddenLabel.find('.b-about__input').removeClass('b-question__field');
            }
        });

        // Full Indicator
        var d = $('.b-question__field'), // Elements for count
            b = {}, // New Array for edited elements
            counter = 0,
            lastValue = '',
            allElemetnsLength = d.length,
            percentBlock; // Block with percent

        $('.b-page').append($('<div class="b-percents"/>').html('Анкета заполнена на 0%'));
        percentBlock = $('.b-percents');

        d.on('change', function () {
            console.log($(this).val());
            if ($(this).val()) {
                if ($(this).get(0).nodeName !== 'SELECT' || $(this).get(0).nodeName === 'SELECT'  && !lastValue) {
                    counter++;
                }
            } else {
                counter--;
            }
            if ($(this).get(0).nodeName === 'SELECT') {
                lastValue = $(this).val();
            }
            percentBlock.html('Анкета заполнена на ' + parseInt((100 * counter) / allElemetnsLength) + '%');
        });

    });

}(jQuery));