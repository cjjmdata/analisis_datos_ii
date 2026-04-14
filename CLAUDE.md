# CLAUDE.md

Este archivo le da contexto a Claude Code (o cualquier asistente de IA) sobre el proyecto para continuar el trabajo de forma productiva.

## Qué es este proyecto

Sitio público del curso **Análisis de Datos II (MAT2409)**, Primavera 2026, impartido por Javier (CJJM). El curso es servicio estadístico inferencial para estudiantes de carreras de negocios (International Business, Marketing, Finanzas, Administración). Tres grupos: NRCs 80558, 80597, 80624, todos con el mismo profesor y materiales.

Estamos en el **Parcial 3** (último del semestre). Lo que viene son 8 sesiones de 1.5 horas cada una.

## Contexto pedagógico crítico

El curso está siendo rediseñado parcialmente para responder al impacto de la IA en el trabajo profesional. El principio rector es:

> **"La pregunta la haces tú. La ejecución puede asistirla la IA. La verificación y la decisión son intransferibles."**

Consecuencias prácticas en el diseño de materiales:

- Los alumnos son de negocios, no de estadística. Prioridad: **juicio, interpretación, comunicación y auditoría**, no mecánica de cálculo.
- Todos los análisis se hacen en R (no Python, no Excel a mano). El temario dice explícitamente "aplicaciones con Excel y paquetería estadística" — usamos eso como cobertura institucional.
- Cada tema incluye explícitamente: qué puede decir el análisis, **qué NO puede decir**, y cómo comunicarlo a un tomador de decisiones.
- En cada slide con código, se muestra en pestañas separadas (`panel-tabset`): la pestaña "💻 Código" contiene código estático que los alumnos copian, y la pestaña "📊 Resultado" muestra la salida.

## Narrativa longitudinal

Las 8 sesiones forman un caso: **Patricia Domínguez**, clienta que heredó un departamento de 2 recámaras en Roma Norte y contrató a "la consultora" (la clase) para decidir cómo rentarlo en Airbnb.

- Sesión 1: Validación de afirmación del mercado (t una muestra) ✅
- Sesión 2: Completo vs. cuarto, superhosts, Roma vs. Condesa (t/z dos muestras) ✅
- Sesión 3: Comparación entre 4 alcaldías + asociación categórica (ANOVA + χ²) ⏳
- Sesión 4: Auditoría en vivo de un análisis defectuoso (integradora) ⏳
- Sesión 5: Modelo de precio (regresión simple) ⏳
- Sesión 6: Diagnóstico e inferencia del modelo ⏳
- Sesión 7: Modelo múltiple (controlando por) ⏳
- Sesión 8: Presentación ejecutiva + defensa oral ⏳

El perfil completo de Patricia está en `datos/perfil_patricia.md`.

## Stack técnico

- **Quarto** (sitio y presentaciones)
- **R** con tidyverse (dplyr, ggplot2, readr)
- **Revealjs** para slides, tema Flatly para sitio
- **Positron** como IDE del usuario
- Datos: **Inside Airbnb — Ciudad de México, corte 2025-09-27**

## Convenciones de código

- Todo el código en **R** (tidyverse), no base R salvo donde tenga sentido (ej. `t.test()`).
- Comentarios en **español**, claros, profesionales.
- Usar pipe nativo `|>` (no `%>%`).
- Encoding UTF-8.
- Nombres de variables en español: `precio`, `alcaldia`, `tipo_habitacion`, etc.
- No usar bullets unicode; usar el pipe de Quarto para listas.
- Factores siempre con niveles explícitos para estabilidad.

## Paleta de colores (consistente en todo el proyecto)

```
primary:   #2C3E50   (azul oscuro, texto y encabezados)
accent:    #18BC9C   (verde azulado, datos principales / Patricia)
info:      #3498DB   (azul, énfasis secundario)
warning:   #F39C12   (naranja, advertencias / IA-era)
danger:    #E74C3C   (rojo, afirmaciones bajo prueba)
light:     #ECF0F1   (gris claro, fondos)
```

Estos valores están en `estilo-sitio.scss` y `estilo-slides.scss`.

## Estructura del repositorio

```
.
├── CLAUDE.md                          ← este archivo
├── README.md                          ← setup público
├── _quarto.yml                        ← config del sitio (excluye analisis/ y scripts/)
├── estilo-sitio.scss                  ← tema del sitio
├── estilo-slides.scss                 ← tema de slides
├── index.qmd                          ← landing
├── scripts/
│   └── 00_descarga_datos.R            ← pipeline de datos (una sola ejecución)
├── datos/
│   ├── perfil_patricia.md             ← personaje narrativo
│   ├── listings_cdmx.rds              ← datos limpios (generado)
│   └── resultados_sXX.rds             ← resultados guardados por sesión (generado)
├── slides/
│   ├── index.qmd                      ← listing autogenerado
│   └── p3/                            ← presentaciones de Parcial 3
│       ├── 01_marco_pruebas_hipotesis.qmd       ✅
│       ├── 02_pruebas_dos_muestras.qmd          ✅
│       ├── 03_anova_chi2.qmd                    ⏳
│       ├── 04_auditoria_pruebas.qmd             ⏳
│       ├── 05_regresion_simple.qmd              ⏳
│       ├── 06_diagnostico_inferencia.qmd        ⏳
│       ├── 07_regresion_multiple.qmd            ⏳
│       └── 08_caso_integrador.qmd               ⏳
├── analisis/                          ← NO SE PUBLICA (excluido en _quarto.yml)
│   ├── _metadata.yml                  ← fuerza draft: true
│   ├── 01_patricia_articulo_1800.qmd  ✅  (notebook S1)
│   └── 02_patricia_comparaciones.qmd  ✅  (notebook S2)
├── recursos/                          ⏳ (pendiente)
├── auditorias/                        ⏳ (pendiente)
└── assets/
    └── img/                           ← logo, favicon
```

## Reglas de frontera público/privado

El repo es **público** (o lo será). **NUNCA** agregar:

- Exámenes con claves de respuesta
- Hojas de respuestas
- Pipelines de calificación
- Datos de estudiantes o listas de alumnos
- Fechas específicas del semestre en curso
- Rúbricas con ponderaciones institucionales
- Cualquier contenido administrativo

Si alguien pide agregar algo así: **rechazar**, explicar que eso vive en Brightspace, y redirigir a materiales públicos.

## Reglas de evaluación crítica

El usuario (Javier) prefiere:

- **Pushback sustantivo**: si algo tiene un problema metodológico, pedagógico o de diseño, decirlo claramente. No validar por complacencia.
- **Comentarios concisos**: no extenderse sin ser pedido.
- **Código comentado** de forma simple, precisa y profesional.
- **Buenas prácticas** (tidyverse, nombres claros, factores estables).

## Patrón de trabajo actual

Cada sesión se produce en dos archivos paralelos:

1. `slides/p3/XX_tema.qmd` — presentación pública, con `panel-tabset` de código/resultado
2. `analisis/XX_patricia_YYY.qmd` — notebook interno que ejecuta el análisis completo con datos reales

El notebook interno sirve para:
- Obtener los números reales que alimentan la narrativa de las slides
- Validar que el código funciona antes de clase
- Eliminar placeholders en los textos interpretativos
- Ser (eventualmente) compartido como modelo de respuesta

**Regla de oro**: si una slide tiene un número específico (ej. "$2,450 promedio"), ese número debe estar justificado por la ejecución del notebook interno. Si hay un placeholder, dejarlo marcado claramente con `TODO: confirmar con notebook`.

## Mejoras pendientes detectadas

1. **Sesión 1 tiene números placeholder** (ej. "897 propiedades", "$2,450"). Deben reemplazarse con código inline `` `r ... ` `` una vez que se haya corrido `scripts/00_descarga_datos.R` y `analisis/01_patricia_articulo_1800.qmd`.

2. **Verificar el campo `alcaldia`** al primer `render`. Inside Airbnb puede poner "Roma Norte" como colonia O la alcaldía ("Cuauhtémoc"). El notebook interno tiene una sección de diagnóstico para esto.

3. **Falta `styles.css`** referenciado en `_quarto.yml` (pero es opcional).

4. **Faltan páginas índice** de `recursos/` y `auditorias/`. Están declaradas en navbar pero no existen.

5. **Falta el logo** en `assets/img/logo.png`. Mientras no exista, comentar la línea `logo:` del YAML de los slides.

## Comandos útiles

```bash
# Instalar dependencias de R (solo primera vez)
Rscript -e 'install.packages(c("dplyr","readr","stringr","janitor","ggplot2","scales","knitr"))'

# Descargar y preparar datos (solo primera vez)
Rscript scripts/00_descarga_datos.R

# Renderizar notebook de análisis (valida la sesión)
quarto render analisis/01_patricia_articulo_1800.qmd

# Preview del sitio durante desarrollo
quarto preview

# Render completo para producción
quarto render
```

## Contacto con el usuario

Javier trabaja en Positron. Prefiere iterar rápido con feedback crítico. No le agrada que le validen acríticamente ideas débiles. Escribe en español. El conocimiento previo que tiene sobre el proyecto está en su memoria de Claude (este archivo lo condensa para Claude Code).
