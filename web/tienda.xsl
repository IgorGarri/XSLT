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
<xsl:template match="/club_voleibol">
<xsl:value-of select="articulo/nombre"/>
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
		
		<main class="principal">
            <xsl:apply-templates select="tienda/articulo"/>
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
<!-- Plantilla para mostrar los árticulos de la tienda. -->
<xsl:template match="articulo">
<article>
	<section>	
		<img class="articulo" src="../img/{@foto}"/>
	</section>
	<section>		
		<h2><xsl:value-of select="precio" /> €</h2>
		<h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
		<xsl:apply-templates select="comentarios"/>
	</section>
</article>
</xsl:template>
<!-- Plantilla para mostrar todos los comentarios del articulo -->
<xsl:template match="comentarios">
	<ul>
		<li><xsl:value-of select="@fecha"/>: <xsl:value-of select="text()"/></li>
	</ul>
</xsl:template>
</xsl:stylesheet>