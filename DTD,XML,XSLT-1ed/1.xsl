<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="/">
        <html>
            <head> <!-- putting an id of the sonnet and author in the page title -->
                <title>Sonnet <xsl:value-of select="document/start/@id"/>, by <xsl:value-of select="document/author/name/surname"/></title>
            </head>
            <body> <!-- defining an order for information representation,
				templates below			-->
                <xsl:for-each select="document">
                    <xsl:apply-templates select="end"/>
                    <xsl:apply-templates select="start"/>
                    <xsl:apply-templates select="author"/> 
                        <xsl:apply-templates select="sonnet"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
	
	<!--Introduction part -->
    <xsl:template match="start"> 
	<span class="introduction">The following page contains a sonnet of a
<!-- selecting a nationality-->    <xsl:value-of select="@origin"/> author 
    </span></xsl:template>
    <xsl:template match="author"> <span class="introduction">
        <xsl:value-of select="name/firstName"/>  &#160;
        <xsl:text/> 
            <xsl:value-of select="name/namePreposition"/> &#160; 
        <xsl:text/> <!--selecting years of life -->
            <xsl:value-of select="name/surname"/> who was born  in
        <xsl:value-of select="yearsOfLife/yearOfBirth"/> and died in
        <xsl:text/> 
        <xsl:value-of select="yearsOfLife/yearOfDeath"/>. </span>
    </xsl:template>
	
	<!--Sonnet part -->
	<!-- adding title -->
    <xsl:template match="firstLine">
        <h1 class="title"> <xsl:value-of select="."/></h1>
    </xsl:template>
    <xsl:template match="title">
        <h1 class="title"> <xsl:value-of select="."/></h1>
    </xsl:template>
	<!--selecting all elements = 'line' and adding division-->
    <xsl:template match="sonnet//line">
     <div class ="line">
            <xsl:value-of select="."/>
     </div>
    </xsl:template>
	
	<!--adding spacing between stanzas -->
    <xsl:template match="br">
        <br class="stanza"/>    
    </xsl:template>
    <!--adding a button HOME PAGE, for HTML pages were connected to index.html -->
    <xsl:template match="end">
        <div class="HomePage">
            <a href=" ../index.html">Home Page </a>
        </div>
        <br/>
    </xsl:template>
</xsl:stylesheet>
