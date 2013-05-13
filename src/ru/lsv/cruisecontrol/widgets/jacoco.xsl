<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="html" />
	<xsl:template match="/" mode="jacoco">
		<xsl:if test="count(/cruisecontrol/report/group) > 0">
			<style>
				.jacoco-oddrow { background-color:#CCCCCC }
				.jacoco-data {
				text-align: center;
				padding: 2px;
				font-family:arial,helvetica,sans-serif; font-size:8pt;
				color:#000000; }
				.jacoco-warning {
				font-family:arial,helvetica,sans-serif; font-size:8pt;
				color:#000000; }
				.jacoco-error
				{
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				color:#FF0000;
				}
				.jacoco-fileheader
				{
				padding: 2px;
				background-color:#CCCCCC;
				font-family:arial,helvetica,sans-serif;
				font-size:8pt;
				font-weight:bold; color:#000000; }
				.jacoco-sectionheader
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
						<td class="jacoco-data">
							<h2>Jacoco results</h2>
						</td>
					</tr>
					<tr>
						<td class="jacoco-sectionheader">Package / Class / Method</td>
						<td class="jacoco-sectionheader">Instructions (cover / miss)</td>
						<td class="jacoco-sectionheader">Branches (cover / miss)</td>
						<td class="jacoco-sectionheader">Lines (cover / miss)</td>
						<td class="jacoco-sectionheader">Cxty (cover / miss)</td>
						<td class="jacoco-sectionheader">Methods (cover / miss)</td>
						<td class="jacoco-sectionheader">Class (cover / miss)</td>
					</tr>
					<xsl:for-each select="/cruisecontrol/report/group">
						<xsl:sort select="@name" />
						<tr>
							<td colspan="7" class="jacoco-fileheader">
								<xsl:value-of select="@name" />
							</td>
						</tr>
						<td class="jacoco-fileheader">
							Total
						</td>
						<td class="jacoco-data">
							<xsl:for-each select="counter[@type='INSTRUCTION']">
								<xsl:value-of
									select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
								%(
								<xsl:value-of select="@covered" />
								/
								<xsl:value-of select="@missed" />
								)
							</xsl:for-each>
						</td>
						<td class="jacoco-data">
							<xsl:for-each select="counter[@type='BRANCH']">
								<xsl:value-of
									select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
								%(
								<xsl:value-of select="@covered" />
								/
								<xsl:value-of select="@missed" />
								)
							</xsl:for-each>
						</td>
						<td class="jacoco-data">
							<xsl:for-each select="counter[@type='LINE']">
								<xsl:value-of
									select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
								%(
								<xsl:value-of select="@covered" />
								/
								<xsl:value-of select="@missed" />
								)
							</xsl:for-each>
						</td>
						<td class="jacoco-data">
							<xsl:for-each select="counter[@type='COMPLEXITY']">
								<xsl:value-of
									select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
								%(
								<xsl:value-of select="@covered" />
								/
								<xsl:value-of select="@missed" />
								)
							</xsl:for-each>
						</td>
						<td class="jacoco-data">
							<xsl:for-each select="counter[@type='METHOD']">
								<xsl:value-of
									select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
								%(
								<xsl:value-of select="@covered" />
								/
								<xsl:value-of select="@missed" />
								)
							</xsl:for-each>
						</td>
						<td class="jacoco-data">
							<xsl:for-each select="counter[@type='CLASS']">
								<xsl:value-of
									select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
								%(
								<xsl:value-of select="@covered" />
								/
								<xsl:value-of select="@missed" />
								)
							</xsl:for-each>
						</td>
						<xsl:for-each select="package">
							<xsl:sort select="@name" />
							<tr>
								<td class="jacoco-fileheader">
									&nbsp;&nbsp;&nbsp;Package
									<xsl:value-of select="@name" />
								</td>
								<td class="jacoco-data">
									<xsl:for-each select="counter[@type='INSTRUCTION']">
										<xsl:value-of
											select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
										%(
										<xsl:value-of select="@covered" />
										/
										<xsl:value-of select="@missed" />
										)
									</xsl:for-each>
								</td>
								<td class="jacoco-data">
									<xsl:for-each select="counter[@type='BRANCH']">
										<xsl:value-of
											select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
										%(
										<xsl:value-of select="@covered" />
										/
										<xsl:value-of select="@missed" />
										)
									</xsl:for-each>
								</td>
								<td class="jacoco-data">
									<xsl:for-each select="counter[@type='LINE']">
										<xsl:value-of
											select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
										%(
										<xsl:value-of select="@covered" />
										/
										<xsl:value-of select="@missed" />
										)
									</xsl:for-each>
								</td>
								<td class="jacoco-data">
									<xsl:for-each select="counter[@type='COMPLEXITY']">
										<xsl:value-of
											select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
										%(
										<xsl:value-of select="@covered" />
										/
										<xsl:value-of select="@missed" />
										)
									</xsl:for-each>
								</td>
								<td class="jacoco-data">
									<xsl:for-each select="counter[@type='METHOD']">
										<xsl:value-of
											select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
										%(
										<xsl:value-of select="@covered" />
										/
										<xsl:value-of select="@missed" />
										)
									</xsl:for-each>
								</td>
								<td class="jacoco-data">
									<xsl:for-each select="counter[@type='CLASS']">
										<xsl:value-of
											select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
										%(
										<xsl:value-of select="@covered" />
										/
										<xsl:value-of select="@missed" />
										)
									</xsl:for-each>
								</td>
							</tr>
							<xsl:for-each select="class">
								<xsl:sort select="@name" />
								<tr>
									<td class="jacoco-fileheader">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<xsl:value-of select="@name" />
									</td>
									<td class="jacoco-data">
										<xsl:for-each select="counter[@type='INSTRUCTION']">
											<xsl:value-of
												select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
											%(
											<xsl:value-of select="@covered" />
											/
											<xsl:value-of select="@missed" />
											)
										</xsl:for-each>
									</td>
									<td class="jacoco-data">
										<xsl:for-each select="counter[@type='BRANCH']">
											<xsl:value-of
												select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
											%(
											<xsl:value-of select="@covered" />
											/
											<xsl:value-of select="@missed" />
											)
										</xsl:for-each>
									</td>
									<td class="jacoco-data">
										<xsl:for-each select="counter[@type='LINE']">
											<xsl:value-of
												select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
											%(
											<xsl:value-of select="@covered" />
											/
											<xsl:value-of select="@missed" />
											)
										</xsl:for-each>
									</td>
									<td class="jacoco-data">
										<xsl:for-each select="counter[@type='COMPLEXITY']">
											<xsl:value-of
												select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
											%(
											<xsl:value-of select="@covered" />
											/
											<xsl:value-of select="@missed" />
											)
										</xsl:for-each>
									</td>
									<td class="jacoco-data">
										<xsl:for-each select="counter[@type='METHOD']">
											<xsl:value-of
												select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
											%(
											<xsl:value-of select="@covered" />
											/
											<xsl:value-of select="@missed" />
											)
										</xsl:for-each>
									</td>
									<td class="jacoco-data">
										<xsl:for-each select="counter[@type='CLASS']">
											<xsl:value-of
												select="format-number(@covered div (@covered + @missed) * 100,'##0.##')" />
											%(
											<xsl:value-of select="@covered" />
											/
											<xsl:value-of select="@missed" />
											)
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates select="." mode="jacoco" />
	</xsl:template>
</xsl:stylesheet>