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
<!-- Creamos la variable $Nentrenador para seleccionar que información mostrar. -->
<xsl:variable name="Nentrenador" select="'Julio Velasco'"/>
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

            <xsl:apply-templates select="equipo[entrenador/nombre=$Nentrenador]"/>
			
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
<!-- Plantilla para mostrar los jugadores y la dirección URL del entrenador. -->
<xsl:template match="equipo">
    <h1><a href="{entrenador/url}"><xsl:value-of select='entrenador/nombre'/></a></h1>
    <article class="equipos">
		<h4><xsl:value-of select="nombre"/></h4>
        <xsl:apply-templates select="jugadores/jugador[@titular='si']"/>
	</article>
</xsl:template>
<!-- Plantilla para mostrar todos los jugadores sin usar for-each. -->
<xsl:template match="jugador">
    <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
</xsl:template>
</xsl:stylesheet>