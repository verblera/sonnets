<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Sonnet <xsl:value-of select="document/start/@id"/>, by <xsl:value-of select="document/author/name/surname"/></title>
            </head>
            <body> <!--adding basic info, templates below -->
                <xsl:apply-templates select="//end"/>
                <xsl:apply-templates select="//firstLine"/>
				 <xsl:apply-templates select="//title"/>
                <xsl:apply-templates select="//author"/> 
                <h2>Rhymes and their parts of speech</h2>
				<!--creating a table for results -->
                <table>
                    <tr>
                    <th>Rhyme</th>
                    <th>Part of Speech</th>
                        </tr>
                <xsl:for-each select="document">
                   <!--adding information into rows, corresponding templates below-->
                    <tr> <!--selecting rhymes rhymed with the first word -->
                        <td>  <xsl:apply-templates select="//rhyme[@sort='a']"/>  </td> 
                        <!-- selecting corresponding part of speech from attributes-->
						<td> <xsl:apply-templates select="//rhyme[@sort='a']/@partOfSpeech"></xsl:apply-templates></td>
                    </tr><!--selecting words rhymed with the second word -->
                    <tr> <td><xsl:apply-templates select="//rhyme[@sort='b']"/>  </td>
                         <!-- selecting corresponding part of speech from attributes-->
					   <td> <xsl:apply-templates select="//rhyme[@sort='b']/@partOfSpeech"></xsl:apply-templates></td>
                    </tr>
                    <tr> <!-- selecting words rhymed to each other (sort/group c)-->
                        <td>   <xsl:apply-templates select="//rhyme[@sort='c']"/>  </td>
                          <!-- selecting corresponding part of speech from attributes-->
						<td> <xsl:apply-templates select="//rhyme[@sort='c']/@partOfSpeech"></xsl:apply-templates></td>
                    </tr> <!-- selecting words rhymed to each other (sort/group d)-->
                    <tr> <td>  <xsl:apply-templates select="//rhyme[@sort='d']"/>  </td>
                          <!-- selecting corresponding part of speech from attributes-->
						<td> <xsl:apply-templates select="//rhyme[@sort='d']/@partOfSpeech"></xsl:apply-templates></td>
                    </tr><!-- selecting words rhymed to each other (sort/group e)-->
                    <tr> <td><xsl:apply-templates select="//rhyme[@sort='e']"/>  </td>
							  <!-- selecting corresponding part of speech from attributes-->	
					 <td> <xsl:apply-templates select="//rhyme[@sort='e']/@partOfSpeech"></xsl:apply-templates></td></tr>
                    <tr> <td><xsl:apply-templates select="//rhyme[@sort='f']"/>  </td>
                        <!-- selecting corresponding part of speech from attributes-->	
                        <td> <xsl:apply-templates select="//rhyme[@sort='f']/@partOfSpeech"></xsl:apply-templates></td></tr>
                    
                    <tr> <td><xsl:apply-templates select="//rhyme[@sort='g']"/>  </td>
                        <!-- selecting corresponding part of speech from attributes-->	
                        <td> <xsl:apply-templates select="//rhyme[@sort='g']/@partOfSpeech"></xsl:apply-templates></td></tr>
                    
                   
               
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
	<!-- adding title in the beginning -->
    <xsl:template match="//firstLine">
        <p class='title'>
            <xsl:value-of select="//firstLine"/></p>
    </xsl:template>
	<xsl:template match="//title">
        <p class='title'>
            <xsl:value-of select="//title"/></p>
    </xsl:template>
	<!-- adding basic info about author-->
    <xsl:template match="author">
        <span class="name">
            <xsl:value-of select="name/firstName"/>  &#160;
            <xsl:text/> 
            <xsl:value-of select="name/namePreposition"/> &#160; 
            <xsl:text/> 
            <xsl:value-of select="name/surname"/>, &#160; </span> 
        <xsl:value-of select="yearsOfLife/yearOfBirth"/> -
        <xsl:text/> 
        <xsl:value-of select="yearsOfLife/yearOfDeath"/>.   <br/><br/>
    </xsl:template>
    <!-- selecting rhymes where their sorts are identical
	identical sorts mean that they are rhymed among themselves-->
    <xsl:template match="//rhyme[@sort='a']"> <div class="firstRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='b']"> <div class="SecondRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='c']"> <div class="ThirdRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='d']"> <div class="FourthRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='e']">  <div class="FifthRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='f']">  <div class="SixthRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='g']">  <div class="SeventhRhyme"/>
        <xsl:value-of select="."/> &#160;
    </xsl:template>
    
	<!-- Selecting a part of Speech from attributes where another attribute 
	equals a selected valued. In this way, words rhymed are grouped together.-->
    <xsl:template match="//rhyme[@sort='a']/@partOfSpeech"> <div class="FirstPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='b']/@partOfSpeech"> <div class="SecondPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='c']/@partOfSpeech"> <div class="ThirdPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='d']/@partOfSpeech"> <div class="FourthPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='e']/@partOfSpeech"> <div class="FifthPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>
    <xsl:template match="//rhyme[@sort='f']/@partOfSpeech"> <div class="SixthPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>    
    <xsl:template match="//rhyme[@sort='g']/@partOfSpeech"> <div class="SeventPartofSpeech"/>
        <xsl:value-of select="."/>    &#160;
    </xsl:template>    
	
	<!--Adding Home Page linking to index.html -->
    <xsl:template match="end">
        <div class="HomePage">
            <a href=" ../index.html">Home Page </a>
        </div>
        <br/>
    </xsl:template>
</xsl:stylesheet>
