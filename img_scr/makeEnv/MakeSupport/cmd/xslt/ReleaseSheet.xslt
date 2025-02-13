<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
  <xsl:variable name="lc" select="'abcdefghijklmnopqrstuvwxyz'"/>
  <xsl:variable name="uc" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  <xsl:param name="makexmlpath">makesupport.xml</xsl:param>
  <!-- Multi usecase specific variables -->
  <!-- Variable xsltusecasemodus is a boolean value 
      xsltusecasemodus == true:   A Delivery Description in multiusecase scenario will be produced
      xsltusecasemodus == false: A Delivery Description in singleusecase scenario will be produced
  -->
  <xsl:param name="xsltusecasemodus">false</xsl:param>
  <xsl:param name="usecasesconfigpath"/>
  <xsl:param name="usecasespath"/>
  <!--
**********************************************************************************************************************
ReleaseSheet.xslt
     Generates CBDxxx_DeliveryDescription.html
     Input files: version.Info and makesupport.xml
**********************************************************************************************************************
*  COPYRIGHT
**********************************************************************************************************************
 Copyright (c) by Vector Informatik GmbH. All rights reserved.

 This software is copyright protected and proprietary to Vector Informatik GmbH.
 Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
 All other rights remain with Vector Informatik GmbH.
**********************************************************************************************************************
*  REVISION HISTORY
**********************************************************************************************************************
*  Date         Version Author  Description
**********************************************************************************************************************
* 2006-03-23   1.00.00 yv      initial version
* 2006-03-24   1.00.01 uf      fixed choose element for Compiler
* 2006-03-28   1.00.02 uf      remove component sort
* 2006-07-12   1.00.03 uf      renamed to delivery description
* 2006-07-20   1.00.04 uf      components are only added if the are to be delivered
* 2006-07-28   1.00.05 uf      fix of delivered components
* 2006-09-11   1.00.06 uf      customer information added
* 2008-07-28   1.01.00 fmi     reworked stylesheet, and structure;
                               added ordered and tested derivative
* 2008-08-18   1.01.01 fmi     reworked contact descriptions
* 2008-10-07   1.03.00 fmi     list only components with delivered=true
* 2009-04-08   1.03.01 fmi     removed file reference
* 2009-10-09   1.03.02 fmi     removed brackets around mail addresses
* 2009-11-27   1.03.03 lo      sort by Project and Component
* 2010-11-09   1.03.04 lo      add DeliveryReason and ReleaseType
* 2010-11-10   1.03.05 lo      change order of DeliveryType and ReleaseType
* 2011-08-11   1.04.00 lo      add SAP information and redesign
* 2012-02-22   1.04.01 fmi     moved delivery reason
* 2012-11-27   1.05.00 uf      ESCAN00062189: Export the expiry date to the DeliveryDescription html
* 2013-04-23   1.05.01 uf      workaround in order to display compiler value out of SAP information
* 2013-11-21   1.06.0  mik     support of multi usecases 
*****************************************************************************-->
  <xsl:template match="/">
    <html>
      <head>
        <style type="text/css">
          * {
          font-family: Verdana, Helvetica, sans-serif;
          color:black;
          }

          body {
          background: #F7F7F7;
          margin: 0;
          padding: 0;
          }

          h1 {
          font-size: 16pt;
          color: white;
          text-align: center;
          background: #AD0829;
          padding:  20px 10px 20px 10px;
          }

          h2 {
          font-size: 14pt;
          background: #DEDEDE;
          padding:  5px 10px 5px 10px;
          margin: 40px 0px 20px 0px;
          border-bottom: thin solid;
          }

          h3 {
          font-size: 12pt;
          color: #AD0829;
          padding: 4px 10px 4px 10px;
          border-bottom: medium solid;
          }

          h4 {
          font-size: 10pt;
          font-weight:  bold;
          padding: 4px 10px 4px 10px;
          }

          table {
          width: 90%;
          border-collapse: collapse;  /* separate*/
          margin-left: auto;    /* center table horizontally */
          margin-right: auto;
          }

          th {
          text-align:   left;
          font-weight:  bold;
          background: #DEDEDE;
          }

          tr.even {
          background: #EEEEEE;
          }

          p, td, th, li {
          font-size: 10pt;
          vertical-align: top;
          padding-right: 1em;
          }

          td.highlight {
          width: 20%;
          text-align: right;
          color: #AD0829;
          }

          .small-text {
          font-size: 8pt;
          }
   
        </style>
        <title>
          Delivery Description <xsl:value-of select="CANbeddedVersionInfo/Properties/CBD"/>
        </title>
      </head>
      <body>
        <!-- define Variable indicating merging -->
        <xsl:variable name="vIsMerged">
          <xsl:choose>
            <xsl:when test="count(/CANbeddedVersionInfo/MergedPackage)&gt;0">
              <xsl:text>True</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>False</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <!-- define Variable with base address -->
        <xsl:variable name="vBaseAddress" select="/CANbeddedVersionInfo/MergedPackage[$vIsMerged='True']|/CANbeddedVersionInfo[$vIsMerged='False']"/>
        <!-- define Variable indicating SAP Info -->
        <xsl:variable name="vIsSap">
          <xsl:choose>
            <xsl:when test="count($vBaseAddress//PES_SAP_LicenseInfo)&gt;0">
              <xsl:text>True</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>False</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <h1>
          Delivery Description <xsl:value-of select="CANbeddedVersionInfo/Properties/CBD"/>
        </h1>
        <h4>Delivery Information</h4>
        <ul>
          <li>
            <a href="#customer_information">Customer Information</a>
          </li>
          <li>
            <a href="#delivery_information">Delivery Information</a>
          </li>
          <!-- if SAP Info is contained -->
          <xsl:if test="$vIsSap='True'">
            <li>
              <a href="#_License_Information">License Information</a>
            </li>
            <li>
              <a href="#_Cluster_License_Information">HLP/SLP License Information</a>
            </li>
          </xsl:if>
        </ul>
        <h4>Build Information</h4>
        <ul>
          <li>
            <a href="#tool_versions">Build Environment - Options &amp; Versions</a>
          </li>
        </ul>
        <h4>Version Information</h4>
        <ul>
          <li>
            <a href="#component_versions">Component Version Information</a>
          </li>
        </ul>
        <h2>Delivery Information</h2>
        <h3>
          <a id="customer_information">Customer Information</a>
        </h3>
        <table>
          <tr>
            <td class="highlight">Package Information:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/Customer">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/Customer"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/Customer not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">License Number:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/CBD">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/CBD"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/CBD not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">License Expiry Date:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/LicenseExpiryDate">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/LicenseExpiryDate"/>
                </xsl:when>
                <xsl:otherwise>
                  License does not expire
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">OEM:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/OEM">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/OEM"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/OEM not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">SLP:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/SLP">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/SLP"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/SLP not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">Controller:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/Controller">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/Controller"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/Controller not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <xsl:for-each select="CANbeddedVersionInfo/Properties/CanCell">
            <tr>
              <td class="highlight">CAN Cell:</td>
              <td>
                <xsl:value-of select="."/>
              </td>
            </tr>
          </xsl:for-each>
          <tr>
            <td class="highlight">Compiler:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/Compiler">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/Compiler"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/Compiler not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <xsl:if test="$xsltusecasemodus = 'false'">
            <tr>
              <td class="highlight">Ordered Derivative:</td>
              <td>
                <xsl:choose>
                  <xsl:when test="CANbeddedVersionInfo/Properties/OrderedDerivative">
                    <xsl:value-of select="CANbeddedVersionInfo/Properties/OrderedDerivative"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <i> - please insert manually -</i>
                    <xsl:message>Element /CANbeddedVersionInfo/Properties/OrderedDerivative not found in version.info!</xsl:message>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:if>
          <tr>
            <td class="highlight">Customer Contacts:</td>
            <td>
              <xsl:choose>
                <xsl:when test="/CANbeddedVersionInfo/Properties/ErrataContacts/ErrataContact">
                  <xsl:for-each select="/CANbeddedVersionInfo/Properties/ErrataContacts/ErrataContact">
                    <xsl:value-of select="Firstname"/>
                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                    <xsl:value-of select="Surname"/>
                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                    <a href="mailto:{Email}">
                      <xsl:value-of select="Email"/>
                    </a>
                    <xsl:if test="position() != last()">
                      <br/>
                    </xsl:if>
                  </xsl:for-each>
                  <p class="small-text">Contact address for Vector for all topics concerning this license. This includes questions and issue reports. Please inform Vector if this contact changes.</p>
                  <p/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/ErrataContacts/ErrataContact not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">Vector Contact:</td>
            <td>
              <xsl:choose>
                <xsl:when test="/CANbeddedVersionInfo/Properties/CustomerContact">
                  <xsl:for-each select="/CANbeddedVersionInfo/Properties/CustomerContact">
                    <xsl:value-of select="Firstname"/>
                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                    <xsl:value-of select="Surname"/>
                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                    <a href="mailto:{Email}">
                      <xsl:value-of select="Email"/>
                    </a>
                  </xsl:for-each>
                  <p class="small-text">Contact address at Vector for all questions concerning this delivery.</p>
                  <p/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/CustomerContact not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <xsl:choose>
            <xsl:when test="contains(/CANbeddedVersionInfo/Properties/NDA,'true')">
              <tr>
                <td class="highlight">Non-Disclosure:</td>
                <td>A non-disclosure agreement related to this license exists.</td>
              </tr>
            </xsl:when>
          </xsl:choose>
        </table>
        <p/>
        <h3>
          <a id="delivery_information">Delivery Information</a>
        </h3>
        <table>
          <tr>
            <td class="highlight">Delivery ID:</td>
            <td>
              <xsl:choose>
                <xsl:when test="/CANbeddedVersionInfo/DeliveryVersionNumber/Byte">
                  <xsl:for-each select="/CANbeddedVersionInfo/DeliveryVersionNumber/Byte">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                      <xsl:text>.</xsl:text>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
              <p class="small-text">This is the unique identification number of this delivery. Please always have this number and above license information ready when contacting Vector customer support.</p>
              <p/>
            </td>
          </tr>
          <xsl:if test="$xsltusecasemodus = 'false'">
            <xsl:choose>
              <xsl:when test="/CANbeddedVersionInfo/PES_SAP_LicenseInfo">
                <tr>
                  <td class="highlight">SIP Type:</td>
                  <td>
                    <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/SipType"/>
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
            </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <tr>
            <td class="highlight">SIP Version:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/SIP">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/SIP"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/SIP not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">Delivery Number:</td>
            <td>
              <xsl:choose>
                <xsl:when test="CANbeddedVersionInfo/Properties/Release">
                  <xsl:value-of select="CANbeddedVersionInfo/Properties/Release"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/Release not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">Release Type:</td>
            <td>
              <xsl:choose>
                <xsl:when test="/CANbeddedVersionInfo/Properties/ReleaseType">
                  <xsl:value-of select="/CANbeddedVersionInfo/Properties/ReleaseType"/>
                </xsl:when>
                <xsl:otherwise>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">Delivery Type:</td>
            <td>
              <xsl:choose>
                <xsl:when test="/CANbeddedVersionInfo/Properties/DeliveryType">
                  <xsl:value-of select="/CANbeddedVersionInfo/Properties/DeliveryType"/>
                </xsl:when>
                <xsl:otherwise>
                  <i> - please insert manually -</i>
                  <xsl:message>Element /CANbeddedVersionInfo/Properties/DeliveryType not found in version.info!</xsl:message>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="highlight">Delivery Reason:</td>
            <td>
              <xsl:choose>
                <xsl:when test="/CANbeddedVersionInfo/Properties/DeliveryReason">
                  <xsl:value-of select="/CANbeddedVersionInfo/Properties/DeliveryReason"/>
                </xsl:when>
                <xsl:otherwise>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <!-- Order Confirmation No -->
          <tr>
            <td class="highlight">Vector Order Confirmation Number:</td>
            <td>
              <xsl:value-of select=".//Properties/ProjectNumber"/>
            </td>
          </tr>
          <xsl:if test="$xsltusecasemodus = 'false'">
            <tr>
              <td class="highlight">Tested Derivative:</td>
              <td>
                <xsl:choose>
                  <xsl:when test="CANbeddedVersionInfo/Properties/TestedDerivative">
                    <xsl:value-of select="CANbeddedVersionInfo/Properties/TestedDerivative"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <i> - please insert manually -</i>
                    <xsl:message>Element /CANbeddedVersionInfo/Properties/TestedDerivative not found in version.info!</xsl:message>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:if>
          <!-- Serial Number -->
          <!--
          <tr>
            <td class="highlight">Vector SAP Serial Number:</td>
            <td>
              <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/Overview/SAP_SerialNo"/>
            </td>
          </tr>
      -->
          <!-- SIP Type -->
          <!--
          <tr>
            <td class="highlight">SIP Type:</td>
            <td>
              <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/SipType"/>
            </td>
          </tr>
      -->
        </table>
        <p/>
        <!-- if SAP Info is contained -->
        <xsl:if test="$vIsSap='True'">
          <xsl:for-each select="$vBaseAddress">
            <!--  Usage Restriction -->
            <xsl:call-template name="SAP_UsageRestriction"/>
            <!-- Template Cluster License Information -->
            <xsl:call-template name="SAP_ClusterLicense">
              <xsl:with-param name="pIsMerged" select="$vIsMerged"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:if>
        <p/>
        <h2>Version Information</h2>
        <h3>
          <a id="component_versions">Component Version Information</a>
        </h3>
        <table>
          <tr>
            <th>Project</th>
            <th>Component</th>
            <th>Version</th>
          </tr>
          <!-- ignore upper case in old version.info with the translate function -->
          <xsl:for-each select="/CANbeddedVersionInfo/ComponentCheck/Component[translate(@Delivered, $uc, $lc)='true']">
            <xsl:sort select="@Project"/>
            <xsl:sort select="@Component"/>
            <xsl:variable name="evenorodd">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 0">even</xsl:when>
                <xsl:otherwise>odd</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <tr class="{$evenorodd}">
              <td>
                <xsl:value-of select="@Project"/>
              </td>
              <td>
                <xsl:value-of select="@Component"/>
              </td>
              <td>
                <xsl:value-of select="@Version"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <!-- 
            make Decission between single usecase and multiusecase
            xsltusecasemodus == true: multiusecase
            xsltusecasemodus == false: single usecase
        -->
        <xsl:choose>
          <xsl:when test="$xsltusecasemodus = 'true'">
            <xsl:for-each select="document($usecasesconfigpath)/usecases/usecase">
              <xsl:variable name="usecasename" select="attributes/attribute/value[../key/text() = 'USECASE_NAME' ]"/>
              <h2>
                <xsl:choose>
                  <xsl:when test="not($usecasename)">                    
                    <xsl:message>Error: Please declare the attribute name USECASE_NAME in the configuration file</xsl:message>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat('Build Information for ',$usecasename)"/>
                  </xsl:otherwise>
                </xsl:choose>
              </h2>
              <table>
                <tr>
                  <td class="highlight">
                    <xsl:value-of select="'Ordered Derivative:'"/>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="attributes/attribute[key = 'ORDERED_DERIVATIVE']/value">
                        <xsl:value-of select="attributes/attribute[key = 'ORDERED_DERIVATIVE']/value"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <i> - was not declared in configuration file -</i>
                        <xsl:message>Error: Please declare Variable ORDERED_DERIVATIVE in config.xml </xsl:message>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td class="highlight">
                    <xsl:value-of select="'Tested Derivative:'"/>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="attributes/attribute[key = 'TESTED_DERIVATIVE']/value">
                        <xsl:value-of select="attributes/attribute[key = 'TESTED_DERIVATIVE']/value"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <i> - was not declared in configuration file -</i>
                        <xsl:message>Error: Please declare Variable TESTED_DERIVATIVE in config.xml </xsl:message>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </table>
              <h3>
                <a id="tool_versions">Build Environment - Options &amp; Versions</a>
              </h3>
              <!-- parse the selected makesupport.xml-->
              <xsl:variable name="_usecasefolder" select="concat($usecasespath,'/',$usecasename)"/>
              <xsl:variable name="_makexmlpath" select="concat($_usecasefolder,$makexmlpath)"/>
              <xsl:call-template name="Build_Options">
                <xsl:with-param name="path" select="$_makexmlpath"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <h2>Build Information</h2>
            <h3>
              <a id="tool_versions">Build Environment - Options &amp; Versions</a>
            </h3>
            <xsl:call-template name="Build_Options">
              <xsl:with-param name="path" select="$makexmlpath"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>
  <!-- ################################################################ -->
  <!-- Template for SAP Usage Restriction -->
  <xsl:template name="SAP_UsageRestriction">
    <h3>
      <a id="_License_Information"/> License Information
      </h3>
    <table>
      <!-- Der Absatz License Description wird immer ausgegeben, auch wenn in Version.Info das Element LicenseTexts fehlt -->
      <tr>
        <td class="highlight">Serial Number:</td>
        <td>
          <xsl:choose>
            <xsl:when test="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/SAP_SerialNo">
              <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/SAP_SerialNo"/>
            </xsl:when>
            <xsl:otherwise>
              <i> - please insert manually -</i>
              <xsl:message>Element /CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/SAP_SerialNo not found in version.info!</xsl:message>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td class="highlight">Licensee:</td>
        <td>
          <xsl:choose>
            <xsl:when test="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/Customer">
              <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/Customer"/>
            </xsl:when>
            <xsl:otherwise>
              <i> - please insert manually -</i>
              <xsl:message>Element /CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/Customer not found in version.info!</xsl:message>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td class="bold"/>
        <td>
          <xsl:text>This delivery contains software modules that might have different license restrictions. Details are shown in section 'License Information'. Please note that the usage of this delivery is restricted to the most constraining license included.            
          </xsl:text>
          <br/>
          <br/>
          <xsl:text>The usage of this delivery is restricted to:
          </xsl:text>
        </td>
      </tr>
      <!-- <xsl:for-each select="./*[count(.//PES_SAP_LicenseInfo/LicenseOverview/LicenseRestriction/RestrictionText)>0]"> -->
      <!-- <xsl:for-each select="./*[count(/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/LicenseRestriction/RestrictionText)&gt;0]"> -->
      <xsl:if test="./*[count(/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/LicenseRestriction/RestrictionText)&gt;0]">
        <tr>
          <td class="highlight">
            <!--<xsl:value-of select="/CANbeddedVersionInfo/Properties/CBD"/>-->
              License Scope
            </td>
          <td class="bold">
            <xsl:for-each select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/LicenseRestriction/RestrictionText">
              <xsl:text> - </xsl:text>
              <xsl:value-of select="."/>
              <br/>
            </xsl:for-each>
            <!-- Die Absaetze für Controller und Compiler sollen nicht ausgegeben werden, wenn in Version.Info keine Wert eingetragen ist -->
            <xsl:if test="not(*[/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/Controller=''])">
              <xsl:text> - Controller </xsl:text>
              <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/Controller"/>
              <br/>
            </xsl:if>
            <xsl:if test="not(*[/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/CompilerVendor=''])">
              <xsl:text> - Compiler </xsl:text>
              <xsl:value-of select="/CANbeddedVersionInfo/PES_SAP_LicenseInfo/LicenseOverview/CompilerVendor"/>
              <br/>
            </xsl:if>
            <br/>
          </td>
        </tr>
      </xsl:if>
      <tr>
        <td class="highlight"/>
        <td>
          <xsl:text>Please contact Vector Informatik whenever you need further information concerning the license conditions.
      </xsl:text>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!-- ################################################################ -->
  <!-- Template for SAP Cluster License Information -->
  <xsl:template name="SAP_ClusterLicense">
    <xsl:param name="pIsMerged"/>
    <h3>
      <a id="_Cluster_License_Information">HLP/SLP License Information</a>
    </h3>
    <table>
      <colgroup>
        <col width="15%"/>
        <col width="10%"/>
        <col width="5%"/>
        <col width="10%"/>
        <col width="60%"/>
      </colgroup>
      <tbody>
        <tr>
          <th>Cluster</th>
          <th>SNR</th>
          <th>Modules</th>
          <th>License Type</th>
          <th>License Restrictions</th>
        </tr>
        <xsl:for-each select=".//PES_SAP_LicenseInfo/LicensedClusters/LicensedClusterDetail">
          <xsl:sort select="SAP_ClusterName"/>
          <xsl:sort select="SAP_Module_SerNo"/>
          <xsl:variable name="vCBD">
            <xsl:if test="$pIsMerged='True'">
              <xsl:text>
          </xsl:text>
              <xsl:value-of select="../../..//CBD"/>
            </xsl:if>
          </xsl:variable>
          <xsl:variable name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">odd</xsl:when>
              <xsl:otherwise>even</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <tr class="{$class}">
            <td>
              <xsl:value-of select="SAP_ClusterName"/>
              <br/>
              <xsl:value-of select="$vCBD"/>
            </td>
            <td>
              <xsl:value-of select="SAP_Module_SerNo"/>
            </td>
            <td>
              <xsl:for-each select="LicensedModules/ModuleName">
                <xsl:sort select="."/>
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:value-of select="LicenseType"/>
            </td>
            <td>
              <!-- Der Absatz LicenseRestriction soll nicht ausgegeben werden, wenn in Version.Info kein Element RestrictionText eingetragen ist -->
              <xsl:if test="count(LicenseRestriction/RestrictionText) &gt; 0">
                <xsl:text>The license is restricted to</xsl:text>
                <br/>
                <xsl:for-each select="LicenseRestriction/RestrictionText">
                  <xsl:text> - </xsl:text>
                  <xsl:value-of select="."/>
                  <br/>
                </xsl:for-each>
                <!-- If the element Controller exists, additional text and the elements Controller and Compiler shall be displayed -->
                <xsl:if test="count(Controller) &gt; 0">
                  <span style="text-ident=1cm">
                    <xsl:text> - Controller </xsl:text>
                    <xsl:value-of select="Controller"/>
                    <br/>
                    <xsl:text> - Compiler </xsl:text>
                    <xsl:value-of select="Compiler"/>
                  </span>
                  <br/>
                </xsl:if>
              </xsl:if>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:template name="Build_Options">
    <xsl:param name="path"/>
    <table>
      <xsl:for-each select="document($path)/makesupport/devtoolinfo/tool">
        <xsl:if test="*/node()">
          <tr class="even">
            <td colspan="2">
              <xsl:value-of select="@type"/>
            </td>
          </tr>
          <xsl:for-each select="entry">
            <xsl:if test="node()">
              <tr>
                <td class="highlight">
                  <xsl:value-of select="@type"/>:
                    </td>
                <td>
                  <xsl:value-of select="node()"/>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>
