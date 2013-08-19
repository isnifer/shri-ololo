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

        // RegExp Validation email
        var emailValidate = function(email) {
            var expression = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return expression.test(email);
        };

        // Form on submit. Validation some fields
        $('.b-question__list').on('submit', function (e) {
            var emailValue = $('.b-about__partial-name_email').val(),
                selectField = $('.b-about__select_offer');
            if (!emailValue || emailValidate(emailValue)) {
                e.preventDefault();
                console.log('Email не заполнен или неверен');
            }
            if (!selectField.val() || selectField.val() === 'another' && !selectField.find('.b-about__input').val()) {
                e.preventDefault();
                console.log('Не заполнен селект');
            }
        });

    });

}(jQuery));