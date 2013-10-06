<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:test="http://www.w3.org/1999/xhtml"
>

<xsl:template match="/">
	<datasheet>
		<xsl:apply-templates select="//test:table/test:tbody/test:tr/test:td/test:table[@class='formlisting']"/>
	</datasheet>
</xsl:template>

<xsl:template match="test:table">

	<datarow><xsl:apply-templates select="*/test:tr[count(test:td)=3]/test:td[position()=2]"/></datarow>
	<datarow><xsl:apply-templates select="*/test:tr[count(test:td)=3]/test:td[position()=3]"/></datarow>

</xsl:template>

<xsl:template match="test:td">
	<data><xsl:value-of select="node()"/></data>
</xsl:template>
</xsl:stylesheet>
