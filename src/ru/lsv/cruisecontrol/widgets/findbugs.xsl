<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="html" />
	<xsl:template match="/" mode="findbugs">
		<xsl:if test="count(/cruisecontrol/BugCollection/file) > 0">
			<style>
				.findbugs-oddrow { background-color:#CCCCCC }
				.findbugs-data {
				text-align: center;
				padding: 2px;
				font-family:arial,helvetica,sans-serif; font-size:8pt;
				color:#000000; }
				.findbugs-warning {
				font-family:arial,helvetica,sans-serif; font-size:8pt;
				color:#000000; }
				.findbugs-error
				{
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				color:#FF0000;
				}
				.findbugs-fileheader
				{
				padding: 2px;
				background-color:#CCCCCC;
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				font-weight:bold; color:#000000; }
				.findbugs-sectionheader
				{
				padding:
				5px;
				text-align:center;
				background-color:#CCCCCC;
				font-family:arial,helvetica,sans-serif;
				font-size:10pt;
				font-weight:bold;
				color:#000000; }
			</style>
			<table align="center" cellpadding="2" cellspacing="0" border="1"
				width="98%">
				<tbody>
					<tr>
						<td class="findbugs-data" colspan="4">
							<h2>FindBugs results</h2>
						</td>
					</tr>
					<tr>
						<td class="findbugs-sectionheader">Type</td>
						<td class="findbugs-sectionheader">Priority</td>
						<td class="findbugs-sectionheader">Message</td>
						<td class="findbugs-sectionheader">Line</td>
					</tr>
					<xsl:for-each select="/cruisecontrol/BugCollection/file">
						<xsl:sort select="@classname" />
						<tr>
							<td colspan="4" class="findbugs-fileheader">
								<xsl:value-of select="@classname" />
							</td>
						</tr>
						<xsl:for-each select="BugInstance">
							<tr>
								<td class="findbugs-data">
									<xsl:value-of select="@type" />
								</td>
								<td class="findbugs-data">
									<xsl:value-of select="@priority" />
								</td>
								<td class="findbugs-data">
									<xsl:value-of select="@message" />
								</td>
								<td class="findbugs-data">
									<xsl:value-of select="@line" />
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates select="." mode="findbugs" />
	</xsl:template>
</xsl:stylesheet>