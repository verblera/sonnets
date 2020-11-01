<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Sonnet <xsl:value-of select="document/start/@id"/>, by <xsl:value-of select="document/author/name/surname"/></title>
            </head>
            <body>
                <!--Ordering information representation; templates below -->
                <xsl:for-each select="document">
                    <xsl:apply-templates select="end"/>
                    <xsl:apply-templates select="//firstLine"/>
					<xsl:apply-templates select="//title"/>
                    <xsl:apply-templates select="author"/> 
                    <xsl:apply-templates select="start"/>
                    <xsl:apply-templates select="//br"/>
                  <xsl:apply-templates select="//rhyme"/>  
                    <xsl:apply-templates select="sonnet"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
	<!-- adding a title of a sonnet-->
    <xsl:template match="//firstLine">
        <p class='title'>
        <xsl:value-of select="//firstLine"/></p>
    </xsl:template>
	<xsl:template match="//title">
        <p class='title'>
            <xsl:value-of select="//title"/></p>
    </xsl:template>
    <xsl:template match="author">
        <span class="name">
		<!--Adding name of author -->
            <xsl:value-of select="name/firstName"/>  &#160;
            <xsl:text/> 
            <xsl:value-of select="name/namePreposition"/> &#160; 
            <xsl:text/> 
            <xsl:value-of select="name/surname"/>, &#160; </span> <span>
            <!-- Adding years of life and '-' in between-->
			<xsl:value-of select="yearsOfLife/yearOfBirth"/> -
            <xsl:text/> 
                <xsl:value-of select="yearsOfLife/yearOfDeath"/>. </span>  <br/><br/>
    </xsl:template>
 <!-- Checking a type of the sonnet and adding appropriate basic info -->
    <xsl:template match="start"><div class="introduction">This sonnet seems to be of <xsl:value-of select="@type"/> type: 
        <xsl:choose>
            <xsl:when test="@type='Baudelairean'"> In French poetry, sonnets are traditionally composed in the French alexandrine line, which
                consists of twelve syllables with a caesura in the middle. <a href="https://en.wikipedia.org/wiki/Sonnet">Source: Wikipedia.org</a>
            </xsl:when>
            <xsl:when test="@type='Petrarchan'"> Italian or Petrarchan sonnet was introduced
                by 14th century Italian poet Francesco Petrarch. The rhyme scheme of a Petrarchan
                sonnet features the first eight lines, called an octet, which rhymes as
                abba–abba–cdc–dcd. The remaining six lines are called a sestet, and might
                have a range of rhyme schemes. <a href="https://literarydevices.net/sonnet/">Source: literarydevices.net</a>
            </xsl:when>
            <xsl:when test="@type='OneginStanza'"> this type refers to the verse form popularized 
                (or invented) by the Russian poet Alexander Pushkin through his novel 
                in verse Eugene Onegin. The work was mostly written in verses of 
                iambic tetrameter with the rhyme scheme aBaBccDDeFFeGG. <a href="https://en.wikipedia.org/wiki/Onegin_stanza">Source: Wikipedia.org</a></xsl:when>
            <xsl:when test="@type='Shakespearean'"> A Shakespearean sonnet is generally written in iambic pentameter,
                in which there are 10 syllables in each line.The rhyme scheme of the Shakespearian sonnet is abab–cdcd–efef–gg, which is difficult to follow. 
                Hence, only Shakespeare is known to have done it. <a href="https://literarydevices.net/sonnet/">Source: literarydevices.net</a></xsl:when>
            <xsl:otherwise> we do not have information about this type </xsl:otherwise>
        </xsl:choose>
        
      
        <!--adding a number (id) of a sonnet and its type from attributes -->
        <p>This is a metric scheme for a sonnet <xsl:value-of select="@id"/>,  <xsl:value-of select="document/author/name/surname"/>   <xsl:value-of select="@type"/> type: 
    </p></div></xsl:template>
  <xsl:template match="//br">
  <!--adding a type of stanzas from an attribute -->
      <span><xsl:value-of select="./@stanzaType"/>,&#160; </span>
  </xsl:template>
  <!-- adding a metric scheme of rhymed words 
  from attributes such as abbaabbaccdeed-->
   <xsl:template match="//rhyme"> 
      <span> <xsl:value-of select="./@sort"/> </span>
   </xsl:template>
    <xsl:template match="sonnet">
        <p>Number of lines:</p>
		<!--counting a number of lines -->
        <p class="number">        <xsl:value-of select="count(.//line)"/> </p>
    </xsl:template>
	<!-- adding a button "Home page" to index.html-->
    <xsl:template match="end">
        <div class="HomePage">
            <a href=" ../index.html">Home Page </a>
        </div>
        <br/>
    </xsl:template>
</xsl:stylesheet>
