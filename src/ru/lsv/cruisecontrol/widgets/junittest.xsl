<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="html" />
	<xsl:template match="/" mode="junittest">
		<xsl:if test="count(/cruisecontrol/testsuites/testsuite) > 0">
			<style>
				.junit-oddrow { background-color:#CCCCCC }
				.junit-data {
				text-align: center;
				padding: 2px;
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				color:#000000;
				}
				.junit-message-header {
				font-weight:bold;
				font-size:9pt;
				}
				.junit-warning {
				text-align: left;
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				color:#FF0000;
				}
				.junit-error {
				text-align: left;
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				color:#FF0000;
				}
				.junit-fileheader {
				padding: 2px;
				background-color:#CCCCCC;
				font-family:arial,helvetica,sans-serif;
				font-size:10pt;
				font-weight:bold; color:#000000;
				}
				.junit-sectionheader {
				padding: 5px;
				text-align:center;
				background-color:#CCCCCC;
				font-family:arial,helvetica,sans-serif;
				font-size:10pt;
				font-weight:bold;
				color:#000000;
				}
			</style>
			<table align="center" cellpadding="2" cellspacing="0" border="1"
				width="98%">
				<tbody>
					<tr>
						<td colspan="3" class="junit-data">
							<h2>Tests suites</h2>
							<h2>Total errors: <xsl:value-of select="count(/cruisecontrol/testsuites/testsuite/testcase/error)" />, failures: <xsl:value-of select="count(/cruisecontrol/testsuites/testsuite/testcase/failure)" /></h2>
						</td>
					</tr>
					<tr>
						<td class="junit-sectionheader">Testsuite / testcase</td>
						<td class="junit-sectionheader">Package / class name</td>
						<td class="junit-sectionheader">Error / Failure</td>
					</tr>
					<xsl:for-each select="/cruisecontrol/testsuites/testsuite">
						<xsl:sort select="@package" />
						<tr>
							<td class="junit-fileheader">
								<xsl:value-of select="@name" />
							</td>
							<td class="junit-fileheader">
								<xsl:value-of select="@package" />
							</td>
							<td class="junit-fileheader">
								Tests:
								<xsl:value-of select="@tests" />
								<br />
								Errors:
								<xsl:value-of select="@errors" />
								<br />
								Failures:
								<xsl:value-of select="@failures" />
							</td>
						</tr>
						<xsl:for-each select="testcase">
							<xsl:sort select="@classname" />
							<tr>
								<td class="junit-data">
									<xsl:value-of select="@name" />
								</td>
								<td class="junit-data">
									<xsl:value-of select="@classname" />
								</td>
								<td class="junit-data">
									<xsl:if test="count(error) > 0">
										<div class="junit-error junit-message-header">Error:</div>
										<div class="junit-error">
											<xsl:value-of select="error" />
										</div>
									</xsl:if>
									<xsl:if test="count(failure) > 0">
										<div class="junit-warning junit-message-header">Failure:</div>
										<div class="junit-warning">
											<xsl:value-of select="failure" />
										</div>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates select="." mode="junittest" />
	</xsl:template>
</xsl:stylesheet>