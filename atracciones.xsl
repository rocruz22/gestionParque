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
                <title>Atracciones</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.html">Gastrobar</a>
                    <a href="atracciones.html">Atracciones</a>
                    <a href="eventos.html">Eventos</a>
                </header>

                <main>
                    <h1>ATRACCIONES</h1>
                    <table>
                        <tr>
                            <th>ATRACCIÓN</th>
                            <th>EDAD MÍNIMA</th>
                            <th>PESO MÁXIMO</th>
                        </tr>
                        
                        <!-- Aplica plantillas para cada atracción -->
                        <xsl:apply-templates select="gestionParque/atracciones/atraccion" />
                    </table>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para una atracción -->
    <xsl:template match="atraccion">
        <tr>
            <td>
                <!-- Variable para construir el enlace a Wikipedia -->
                <xsl:variable name="wikipedia_link" select="concat('https://es.wikipedia.org/wiki/', translate(nombre, ' ', '_'))" />
                <a href="{$wikipedia_link}" target="_blank">
                    <xsl:value-of select="nombre" />
                </a>
            </td>
            <td>
                <xsl:value-of select="restricciones/edadMinima" />
            </td>
            <td>
                <xsl:value-of select="restricciones/pesoMaximo" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
