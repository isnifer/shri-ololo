var myApp = angular.module("myApp", []);

myApp.controller('Shri', function ($scope) {

    $scope.header = 'Анкета второй Школы разработки интерфейсов в Москве';
    $scope.description = '<p class="b-description__text">Яндекс открывает набор во вторую Школу разработки интерфейсов в Москве.</p>' +
        '<p class="b-description__text">Для поступления необходимо заполнить анкету с тестовыми заданиями. Приём заявок закрывается 19 августа в 23:59 по московскому времени. По результатам теста мы пригласим в Школу 30-40 человек.</p>' +
        '<p class="b-description__text">Подробности о Школе читайте на <a class="b-description__link" href="http://events.yandex.ru/shri/">этой странице</a></p>';
    $scope.questionTitle = 'Заполните анкету';


    $scope.questions = [
        {
            id : 1,
            text : '<p class="b-question__text">Год рождения.</p>'
        }, {
            id : 2,
            text : '<p class="b-question__text">Город, в котором вы живёте.</p>'
        },
        {
            id : 3,
            text : '<p class="b-question__text">Вуз, факультет, специальность, кафедра.</p>'
        },
        {
            id : 4,
            text : '<p class="b-question__text">Год окончания вуза.</p>'
        },
        {
            id : 5,
            text : '<p class="b-question__text">Уровень владения английским языком:</p>' +
                '<label class="b-question__label"><input class="b-question__checkbox" type="checkbox" name="field-5_checkbox-low"><span class="b-question__label-name">начальный</span></label>' +
                '<label class="b-question__label"><input class="b-question__checkbox" type="checkbox" name="field-5_checkbox-middle"><span class="b-question__label-name">средний</span></label>' +
                '<label class="b-question__label"><input class="b-question__checkbox" type="checkbox" name="field-5_checkbox-high"><span class="b-question__label-name">свободное владение</span></label>'
        },
        {
            id : 6,
            text : '<p class="b-question__text">Чего вы ожидаете от участия в Школе?</p>'
        },
        {
            id : 7,
            text : '<p class="b-question__text">Откуда вы о нас узнали?</p>'
        },
        {
            id : 8,
            text : '<p class="b-question__text">Сколько времени вы были бы готовы уделять стажировке или работе в Яндексе?</p>'
        },
        {
            id : 9,
            text : '<p class="b-question__text">Расскажите о вашем опыте разработки. Нам будет интересно всё — как серьезный интерфейс, так и просто домашняя страничка.</p>'
        },
        {
            id : 10,
            text : '<p class="b-question__text">Если вы где-нибудь работали, расскажите, какие у вас были должностные обязанности и был ли опыт работы в команде.</p>'
        },
        {
            id : 11,
            text : '<p class="b-question__text">Перечислите, какими программными продуктами вы пользуетесь в своей работе — от редактора до специализированных утилит (Intellij Idea, Node.js, Uglify.js, GNU Make). Для каждого инструмента укажите, какие задачи вы с помощью него решаете и почему выбрали именно его.</p>'
        },
        {
            id : 12,
            text : '<p class="b-question__text">Пользуетесь ли вы командной строкой? Какими командами вы пользуетесь и какие задачи вы решаете с их помощью? С какими программами вы преимущественно или полностью взаимодействуете через интерфейс командной строки?</p>'
        },
        {
            id : 13,
            text : '<p class="b-question__text">Напишите на JavaScript функцию, которая выводит список всех чисел, которые равны сумме факториалов своих цифр. Пример такого числа: </p>' +
                '<p class="b-question__text">4! + 0! + 5! + 8! + 5! = 40585</p>' +
                '<p class="b-question__text"><span>В качестве ответа на вопрос пришлите ссылку на </span><a class="b-question__link" href="http://jsfiddle.net/">http://jsfiddle.net/</a><span> с вашим кодом или на ваш репозиторий на </span><a class="b-question__link" href="https://github.com/">https://github.com/</a></p>'
        },
        {
            id : 14,
            text : '<p class="b-question__text">Вы — пилот грузового межгалактического корабля. Ваша работа — перевозка грузов с одной планету на другую. Грузоподъемность вашего корабля ограничена, поэтому за один рейс вы можете перевезти не более N кг полезного груза. Ваш корабль умеет сообщать свое состояние (местоположение и степень загруженности), а также летать в любую точку пространства. Каждая планета может содержать на себе груз, который можно взять. Также на каждой планете груз можно оставить .</p>' +
                '<p class="b-question__text">Задание:</p>' +
                '<p class="b-question__text">Даны незавершенные интерфейсы корабля и планеты. Напишите недостающий код.</p>' +
                '<p class="b-question__text">Полное условие задачи доступно на <a class="b-question__link" href="https://github.com/yandex-shri/introtask-space">https://github.com/yandex-shri/introtask-space</a></p>' +
                '<p class="b-question__text"><span>В качестве ответа на вопрос пришлите ссылку на </span><a class="b-question__link" href="http://jsfiddle.net/">http://jsfiddle.net/</a><span> с вашим кодом или на ваш репозиторий на </span><a class="b-question__link" href="https://github.com/">https://github.com/</a></p>'
        },
        {
            id : 15,
            text : '<p class="b-question__text">Сверстайте форму-анкету с нашими заданиями для кандидатов. Страница должна работать в следующих браузерах: MSIE (8, 9, 10), Google Chrome (26, 27), Firefox (20, 21), Opera (12.15, 12.14), Яндекс.Браузер 1.5. По возможности используйте приёмы безопасной деградации CSS. Страница должна содержать интерактив, реализованный с помощью JS и jQuery. Это может быть:</p>' +
                '<ul class="b-question__list b-question__list_inner">' +
                '<li class="b-question__item">проверка полноты и правильности заполнения полей (где это возможно);</li>' +
                '<li class="b-question__item">возможность свернуть и развернуть разделы (аккордеон);</li>' +
                '<li class="b-question__item">индикатор заполнения анкеты;</li>'+
                '<li class="b-question__item">что-нибудь ещё.</li>' +
                '</ul>' +
                '<p class="b-question__text">Подумайте над тем, как эти данные будут отправляться на сервер.</p>' +
                '<p class="b-question__text">Будет плюсом, если вы сверстаете страницу, используя БЭМ.</p>' +
                '<p class="b-question__text">Дополнительные задания:</p>' +
                '<p class="b-question__text"><span>Разработку необходимо вести на </span><a class="b-question__link" href="https://github.com/">https://github.com/</a><span>. В качестве ответа на вопрос пришлите ссылку на проект.</span></p>'
        }
    ];

});