<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />

    <xsl:template match="child">
        <xsl:choose>
            <xsl:when test="@tag = 'p'">
                <p class="{@class}"><xsl:value-of select="text()"/><xsl:apply-templates select="*"/></p>
            </xsl:when>
            <xsl:when test="@tag = 'a'">
                <a class="{@class}" href="{@href}"><xsl:value-of select="."/></a>
            </xsl:when>
            <xsl:when test="@tag = 'span'">
                <span><xsl:value-of select="text()"/></span>
            </xsl:when>
            <xsl:when test="@tag = 'ul'">
                <ul class="{@class}">
                    <xsl:apply-templates select="*"/>
                </ul>
            </xsl:when>
            <xsl:when test="@tag = 'li'">
                <li class="{@class}"><xsl:value-of select="text()"/><xsl:apply-templates select="*"/></li>
            </xsl:when>
            <xsl:when test="@tag = 'input'">
                <label class="b-question__label">
                    <input class="{@class}" type="{@type}" name="field-{parent::item/@id}_checkbox-{@name}"/>
                    <span class="b-question__label-name"><xsl:value-of select="text()"/></span>
                </label>
            </xsl:when>
            <xsl:when test="@tag = 'input'">
                <label class="b-question__label">
                    <input class="b-question__checkbox" type="checkbox" name="{@name}"/>
                    <span class="b-question__checkbox-name"><xsl:value-of select="."/></span>
                </label>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

<xsl:template match="/"> 
    <html>
    <head>
        <meta charset="UTF-8"/>
        <title>XSL</title>
        <!-- CSS -->
        <xsl:for-each select="//css/item">
            <link href="{@url}" rel="stylesheet" type="text/css" />
        </xsl:for-each>
    </head>
    <body>

        <!-- Обертка -->
        <div class="b-page">

            <!-- Шапка -->
            <header class="b-header g-clf">
                <img class="b-header__logo" src="img/logo.png"/>
                <div class="b-header__attributes">
                    <h2 class="b-header__name">
                        <xsl:value-of select="Page/Content/info/header"/>
                    </h2>
                    <div class="b-header__description">
                        <xsl:apply-templates select="Page/Content/info/description/*"/>
                    </div>
                </div>
            </header>

            <!-- Основной контент -->
            <div class="b-main g-clf">
                <!-- Список вопросов -->
                <div class="b-question">

                    <h4 class="b-question__title"><xsl:value-of select="//questions/@title"/></h4>

                    <form class="b-question__list">
                        <xsl:for-each select="//questions/item">
                            <label class="b-question__item g-clf" for="field-{@id}_answer">
                                <i class="b-question__visibility"></i>
                                <em class="b-question__number">Вопрос №<xsl:value-of select="@id"/></em>
                                <div class="b-question__interactive">
                                    <xsl:apply-templates select="*"/>
                                    <textarea class="b-question__answer b-question__field" name="field-{@id}_answer" id="field-{@id}_answer"></textarea>
                                </div>
                            </label>
                        </xsl:for-each>
                        <div class="b-about">
                            <h4 class="b-about__title">Расскажите нам о себе</h4>
                            <label class="b-about__label g-clf"><span class="b-about__partial-name">Резюме до 250 КБ</span>
                                <div class="b-about__answer">
                                    <input type="file" name="summary" class="b-about__file" />
                                </div>
                            </label>
                            <label class="b-about__label g-clf"><span class="b-about__partial-name">Ссылка на профиль в Моем Круге</span>
                                <div class="b-about__answer">
                                    <input type="text" name="moikrug" class="b-about__input b-question__field" />
                                </div>
                            </label>
                            <label class="b-about__label g-clf"><span class="b-about__partial-name">Имя, Фамилия</span>
                                <div class="b-about__answer">
                                    <input type="text" name="names" class="b-about__input b-question__field" />
                                </div>
                            </label>
                            <label class="b-about__label g-clf"><span class="b-about__partial-name">Телефон</span>
                                <div class="b-about__answer">
                                    <input type="text" name="phone" class="b-about__input b-question__field" />
                                </div>
                            </label>
                            <label class="b-about__label g-clf"><span class="b-about__partial-name b-about__partial-name_email">E-mail</span>
                                <div class="b-about__answer">
                                    <input type="email" name="email" class="b-about__input b-question__field" />
                                </div>
                            </label>
                            <label class="b-about__label g-clf"><span class="b-about__partial-name">Дополнительные сведения</span>
                                <div class="b-about__answer">
                                    <textarea name="additional" class="b-about__textarea b-question__field"></textarea>
                                </div>
                            </label>
                            <label class="b-about__label b-about__label_empty-name g-clf"><span class="b-about__our-offer">Откуда вы узнали о нашем предложении?</span>
                                <select name="where" class="b-about__select b-about__select_offer b-question__field">
                                    <option value="">Не выбрано</option>
                                    <option value="hr">От HR-менеджера Яндекс</option>
                                    <option value="yasubbotnik">Яндекс.Субботник</option>
                                    <option value="yac">Yet Another Conference</option>
                                    <option value="anotherconf">На другой конференции</option>
                                    <option value="search">Из поиска</option>
                                    <option value="recommend">По рекомендации</option>
                                    <option value="another">Другое</option>
                                </select>
                            </label>
                            <label class="b-about__label b-about__label_empty-name b-about__label_another-offer">
                                <input name="other_offer_place" class="b-about__input" />
                            </label>
                            <label class="b-about__label g-clf b-about__label_empty-name g-clf">
                                <input type="checkbox" class="b-about__checkbox" />
                                <span class="b-about__rights">Я даю свое согласие на передачу в ООО «ЯНДЕКС» резюме и/или анкеты, содержащих мои персональные данные, и согласен с тем, что они будут храниться в ООО «ЯНДЕКС» в течение 5 лет и будут обрабатываться исключительно для целей предложения мне вакансий группы компаний «ЯНДЕКС», в соответствии с Федеральным законом «О персональных данных».
                                </span>
                            </label>
                            <div class="b-about__control-buttons">
                                <button class="b-about__submit" type="submit">Отправить</button>
                                <button class="b-about__clear" type="reset">Очистить</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

            <footer class="b-footer">
                <p class="b-footer__year">ШРИ 2013. Москва</p>
            </footer>

        </div>

        <!-- JS -->
        <xsl:for-each select="//js/item">
            <script src="{@url}" type="text/javascript"></script>
        </xsl:for-each>

    </body>
    </html>
</xsl:template>


</xsl:stylesheet>