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
        </xsl:choose>
    </xsl:template>

<xsl:template match="/"> 
    <html>
    <head>
        <meta charset="UTF-8"/>
        <title>Authors</title>
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

                    <ul class="b-question__list">
                        <xsl:for-each select="//questions/item">
                            <li class="b-question__item">
                                <em class="b-question__number">Вопрос №<xsl:value-of select="@id"/></em>
                                <div class="b-question__interactive">
                                    <xsl:apply-templates select="*"/>
                                    <!--<xsl:if test="checkboxes">
                                        <xsl:for-each select="checkboxes/item">
                                            <label class="b-question__label">
                                                <input class="b-question__checkbox" type="checkbox" name="{@name}"/>
                                                <span class="b-question__checkbox-name"><xsl:value-of select="."/></span>
                                            </label>
                                        </xsl:for-each>
                                    </xsl:if>-->
                                    <textarea class="b-question__answer" name="field-{@id}_answer"></textarea>
                                </div>
                            </li>
                        </xsl:for-each>
                    </ul>

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