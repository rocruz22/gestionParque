<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    
    <!-- Variable para definir el año deseado -->
    <xsl:variable name="year" select="'2024'" />


    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8" />
                <meta name="description" content="Eventos del año" />
                <title>Eventos del <xsl:value-of select="$year" /></title>

            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.html">Gastrobar</a>
                    <a href="atracciones.html">Atracciones</a>
                    <a href="eventos.html">Eventos</a>
                </header>

                <main>
                    <h1>Eventos del <xsl:value-of select="$year" /></h1>
                    
                    <!-- Filtrar y ordenar eventos -->
                    <xsl:for-each select="gestionParque/eventos/evento[starts-with(fechaHora, $year)]">
                        <xsl:sort select="substring(fechaHora, 6, 2)" data-type="number" order="descending" />
                        <xsl:sort select="substring(fechaHora, 9, 2)" data-type="number" order="ascending" />

                        <!-- Mostrar evento -->
                        <article class="eventos">
                            <h4>
                                <xsl:value-of select="descripcion" /> - 
                                <xsl:value-of select="count(comentarios/comentario)" /> Comentarios
                            </h4>
                            <ul>
                                <!-- Mostrar cada comentario -->
                                <xsl:for-each select="comentarios/comentario">
                                    <li><xsl:value-of select="." /></li>
                                </xsl:for-each>
                            </ul>
                        </article>
                    </xsl:for-each>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
