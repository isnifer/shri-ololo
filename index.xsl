<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />

    <xsl:template match="a">
        <a class="{@class}" href="{@href}"><xsl:value-of select="."/></a>
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

        <header class="b-header">
            <h2 class="b-header__name"><xsl:value-of select="Page/Content/info/header"/></h2>
            <div class="b-header__description"><xsl:value-of select="Page/Content/info/description" disable-output-escaping="yes"/></div>
        </header>

        <div class="b-question">
            
            <ul class="b-question__list">
                <xsl:for-each select="//questions/item">
                    <li class="b-question__item">
                        <p class="b-question__number">Вопрос №<xsl:value-of select="@id"/></p>
                        <div class="b-question__interactive">
                            <xsl:for-each select="text/p">
                                <xsl:copy-of select="."/>
                            </xsl:for-each>
                            <!--<xsl:if test="checkboxes">
                                <xsl:for-each select="checkboxes/item">
                                    <label class="b-question__label">
                                        <input class="b-question__checkbox" type="checkbox" name="{@name}"/>
                                        <span class="b-question__checkbox-name"><xsl:value-of select="."/></span>
                                    </label>
                                </xsl:for-each>
                            </xsl:if>-->
                            <textarea class="b-question__answer"></textarea>
                        </div>
                    </li>
                </xsl:for-each>
            </ul>

        </div>

        <!-- JS -->
        <xsl:for-each select="//js/item">
            <script src="{@url}" type="text/javascript"></script>
        </xsl:for-each>

    </body>
    </html>
</xsl:template>


</xsl:stylesheet>