<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    
    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8" />
                <meta name="description" content="Página principal" />
                <title>Gastrobar - Entrantes</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.html">Gastrobar</a>
                    <a href="atracciones.html">Atracciones</a>
                    <a href="eventos.html">Eventos</a>
                </header>

                <main id="gastrobar">
                    <h1>ENTRANTES</h1>
                    
                    <!-- Aplica plantillas para todos los platos de categoría "Entrante" -->
                    <xsl:apply-templates select="gestionParque/gastrobar/platos/plato[@categoria='Entrante']" />
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para un plato -->
    <xsl:template match="plato">
        <article class="articulo">
            <!-- Mostrar imagen del plato -->
            <img class="imagen" src="../img/{foto}" alt="{nom_plato}" />

            <!-- Mostrar ícono de "New" si el código empieza por "A" -->
            <xsl:if test="starts-with(@codigo, 'A')">
                <img class="novedad-icono" src="../img/icono-novedad.png" alt="New" />
            </xsl:if>

            <!-- Mostrar nombre y precio del plato -->
            <h2><xsl:value-of select="nom_plato" /></h2>
            <h3><xsl:value-of select="precio" />€</h3>
        </article>
    </xsl:template>
</xsl:stylesheet>
