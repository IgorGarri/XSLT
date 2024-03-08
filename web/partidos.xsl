<?xml version="1.0" encoding='utf-8'?>
<!-- 
 * 
 * Nombre: Igor Garrido Agudo 
 * Fecha: 07/03/2024 
 * Modulo: Lenguaje de marcas y sistemas de gestión de la información. 
 * UD4
 * Tarea: LMSGI04 Tarea de evaluación 02. XSLT
 * Autoevaluación: https://docs.google.com/document/d/19hxAFfH2XxSQXj7nyAv0WwUW4usx6D4bUv85Euy0O0Y/edit?usp=sharing
 * Publicación internet:
 * 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>
				<!-- Llamada para usar la plantilla si se cumple la condición de @ciudad y aparezca en orden. -->
				<xsl:apply-templates select="partido[lugar/@ciudad='Lima']">
                    <xsl:sort select="fecha" order="descending" data-type="date"/>
                </xsl:apply-templates>
				
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
<!-- Plantilla para mostar los datos en forma de tabla y aplicar el estilo si se cumple la condición -->
<xsl:template match="partido">
    <tr>
        <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
        <td><xsl:value-of select="fecha"/></td>
        <xsl:choose>
            <xsl:when test="equipos/visitante/@puntuacion>equipos/local/@puntuacion">
            <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
            </xsl:when>
            <xsl:otherwise>
            <td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
            </xsl:otherwise>
        </xsl:choose>
        
    </tr>
</xsl:template>
</xsl:stylesheet>
