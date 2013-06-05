<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="html" />
	<xsl:template match="/" mode="lint">
		<xsl:if test="count(/cruisecontrol/issues/issue) > 0">
			<style>
				.lint-oddrow { background-color:#CCCCCC }
				.lint-data {
				text-align: center;
				padding: 2px;
				font-family:arial,helvetica,sans-serif; font-size:8pt;
				color:#000000; }
				.lint-warning {
				font-family:arial,helvetica,sans-serif; font-size:8pt;
				color:#000000; }
				.lint-error
				{
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				color:#FF0000;
				}
				.lint-fileheader
				{
				padding: 2px;
				background-color:#CCCCCC;
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				font-weight:bold; color:#000000; }
				.lint-sectionheader
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
						<td class="lint-data" colspan="5">
							<h2>Lint results</h2>
						</td>
					</tr>
					<tr>
						<td class="lint-sectionheader">Location</td>
						<td class="lint-sectionheader">Id</td>
						<td class="lint-sectionheader">Severity</td>
						<td class="lint-sectionheader">Message</td>
						<td class="lint-sectionheader">Summary</td>
					</tr>
					<xsl:for-each select="/cruisecontrol/issues/issue">
						<xsl:sort select="location/@file" />
						<tr>
							<td colspan="4" class="lint-fileheader">
								<xsl:value-of select="location/@file" />
							</td>
						</tr>
						<tr>
							<td class="lint-data">
								line=<xsl:value-of select="location/@line" />, column=<xsl:value-of select="location/@column" />
							</td>
							<td class="lint-data">
								<xsl:value-of select="@id" />
							</td>
							<td class="lint-data">
								<xsl:value-of select="@severity" />
							</td>
							<td class="lint-data">
								<xsl:value-of select="@message" />
							</td>
							<td class="lint-data">
								<xsl:value-of select="@summary" />
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates select="." mode="lint" />
	</xsl:template>
</xsl:stylesheet>