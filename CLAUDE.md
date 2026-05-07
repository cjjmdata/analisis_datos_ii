# CLAUDE.md

Este archivo le da contexto a Claude Code (o cualquier asistente de IA) sobre el proyecto para continuar el trabajo de forma productiva.

## Qué es este proyecto

Sitio público del curso **Análisis de Datos II (MAT2409)**, Primavera 2026, impartido por Javier (CJJM). El curso es servicio estadístico inferencial para estudiantes de carreras de negocios (International Business, Marketing, Finanzas, Administración). Tres grupos: NRCs 80558, 80597, 80624, todos con el mismo profesor y materiales.

Estamos en el **Parcial 3** (último del semestre). Lo que viene son 8 sesiones de 1.5 horas cada una. Las evaluaciones (examen + defensa) se imparten en sesiones extra que **no están dentro del conteo de las 8 sesiones de contenido**.

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

| # | Sesión | Bloques temario | Status |
|---|---|---|---|
| 1 | Marco de pruebas de hipótesis (t una muestra) | 2.1 | ✅ |
| 2 | Pruebas de dos muestras (t/z) | 2.2, 2.3 | ✅ |
| 3 | ANOVA + χ² | 3.1–3.2, 4.1–4.3 | ⏳ |
| 4 | Regresión simple I: del problema al modelo | 5.1, 5.7 (intro) | ⏳ |
| 5 | Regresión simple II: validez, supuestos, diagnóstico | 5.2, 5.3, 5.4 | ⏳ |
| 6 | Regresión simple III: interpretación, predicción, comunicación | 5.5, 5.6, causalidad | ⏳ |
| 7 | Regresión múltiple I: construcción y "controlando por" | 6.1, 6.2, 6.3 | ⏳ |
| 8 | Regresión múltiple II: diagnóstico, interpretación, caso integrador | 6.4, 6.5, 6.6 | ⏳ |

**Evaluación (fuera del conteo de 8 sesiones)**: 2 sesiones extra reservadas para examen y defensa final del proyecto integrador.

## Decisiones pedagógicas tomadas (no reabrir sin razón fuerte)

1. **No hay sesión dedicada a "auditoría en vivo"**. La idea original (S4 como auditoría) se eliminó. Los 90 min ganados se reasignaron para que regresión simple ocupe 3 sesiones (S4, S5, S6) en lugar de 2. La razón: regresión simple es el cimiento de toda la segunda mitad del curso; si queda débil, la múltiple es desastre.

2. **Tema transversal "IA en el análisis de datos" — pendiente al cierre del curso**. Originalmente las slides de S1 incluían una mini-sección "Auditoría IA-era". Se decidió **extraerla y convertirla en un tema independiente al cierre del curso**, que integre de forma unificada: auditoría de análisis generados por IA, detección de errores de supuestos, interpretación crítica, comunicación responsable, y el principio rector del curso. **No olvidar incluirlo después de S8.** Cuando se trabajen S2-S8, no repetir mini-secciones de IA dentro de cada sesión: dejarlo para el cierre.

3. **Causalidad vs correlación es tema explícito**. Aparece sembrado en S2 (con superhost), retomado en S3 (con ANOVA y zonas), y central en S6 (regresión simple III). En S7 (múltiple I) cobra peso máximo con el concepto de "controlando por".

El perfil completo de Patricia está en `datos/perfil_patricia.md`.

## Stack técnico

- **Quarto** (sitio y presentaciones)
- **R** con tidyverse (dplyr, ggplot2, readr)
- **Revealjs** para slides, tema Flatly para sitio
- **Positron** como IDE del usuario
- Datos: **Inside Airbnb — Ciudad de México, corte 2025-09-27**

## Convenciones de código

- Todo el código en **R** (tidyverse), no base R salvo donde tenga sentido (ej. `t.test()`, `lm()`).
- Comentarios en **español**, claros, profesionales.
- Usar pipe nativo `|>` (no `%>%`).
- Encoding UTF-8.
- Nombres de variables en español: `precio`, `alcaldia`, `tipo_habitacion`, etc.
- No usar bullets unicode; usar el pipe de Quarto para listas.
- Factores siempre con niveles explícitos para estabilidad.

## Continuidad de nombres entre sesiones

Los alumnos construyen un script propio que evoluciona sesión a sesión. Cambiar el nombre de un objeto canónico entre sesiones rompe sus scripts.

**Nombres estables a lo largo de todo el curso** (su contenido evoluciona, su nombre NO):

| Nombre | Significado | Estabilidad |
|---|---|---|
| `listings` | Tabla cruda parseada de Inside Airbnb | Estable |
| `roma` | Subset de trabajo (Roma Norte + Entire + bedrooms + depurado P99.9 desde S5) | Estable S1-S8 |
| `modelo` | Modelo de trabajo (`lm` simple S4-S6, múltiple S7-S8) | Estable S4-S8 |

**Variantes auxiliares**: cualquier objeto temporal o comparativo debe llevar sufijo claramente auxiliar.

- ✅ `modelo_orig`, `modelo_aux`, `modelo_anterior`, `modelo_sin_x`, `roma_aux`
- ❌ `modelo_full`, `modelo_clean`, `modelo_v2`, `modelo_final`, `roma_full` ← suenan al "principal" y confunden al alumno

**Verificación al inicio de cada sesión**: el setup chunk debe asegurar (`stopifnot`) que los nombres canónicos heredados tienen las mismas dimensiones y coeficientes que la sesión previa publicó. Si falla, no continuar — investigar primero.

**Regla técnica adicional para slides**: dentro de celdas de tablas `kable()` no usar `$` literal como prefijo de moneda — Reveal/MathJax lo interpreta como delimitador matemático y corrompe el render. Usar números planos y poner unidades en los labels (`Precio (MXN)`).

**Caso histórico (S5)**: `roma_full` se introdujo como nombre intermedio que sonaba canónico. Los scripts de los alumnos se rompieron. Pendiente para postmortem: renombrar a `roma_aux` o eliminar el binding intermedio.

## Paleta de colores (consistente en todo el proyecto)

```
primary:   #2C3E50   (azul oscuro, texto y encabezados)
accent:    #18BC9C   (verde azulado, datos principales / Patricia)
info:      #3498DB   (azul, énfasis secundario)
warning:   #F39C12   (naranja, advertencias)
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
│       ├── 04_regresion_simple_1.qmd            ⏳ (del problema al modelo)
│       ├── 05_regresion_simple_2.qmd            ⏳ (validez, supuestos, diagnóstico)
│       ├── 06_regresion_simple_3.qmd            ⏳ (interpretación, predicción, causalidad)
│       ├── 07_regresion_multiple_1.qmd          ⏳ (construcción, controlando por)
│       └── 08_regresion_multiple_2.qmd          ⏳ (diagnóstico, interpretación, caso)
├── analisis/                          ← NO SE PUBLICA (excluido en _quarto.yml)
│   ├── _metadata.yml                  ← fuerza draft: true
│   ├── 01_patricia_articulo_1800.qmd  ✅  (notebook S1)
│   └── 02_patricia_comparaciones.qmd  ✅  (notebook S2)
├── recursos/                          ⏳ (pendiente)
├── auditorias/                        ⏳ (pendiente — material para tema IA al cierre)
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

**Regla de oro**: si una slide tiene un número específico (ej. "$2,450 promedio"), ese número debe obtenerse directamente de los resultados del análisis o de la base de datos (deben ser dinámicos, para que se actualicen cuando cambie la base). NO usar placeholder.

## Mejoras pendientes detectadas

1. **Verificar el campo `alcaldia`** al primer `render`. Inside Airbnb puede poner "Roma Norte" como colonia O la alcaldía ("Cuauhtémoc"). El notebook interno tiene una sección de diagnóstico para esto.

2. **Falta `styles.css`** referenciado en `_quarto.yml` (pero es opcional).

3. **Faltan páginas índice** de `recursos/` y `auditorias/`. Están declaradas en navbar pero no existen.

4. **Falta el logo** en `assets/img/logo.png`. Mientras no exista, comentar la línea `logo:` del YAML de los slides.

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

## Deploy

El sitio se publica en **GitHub Pages** usando la estrategia de **freeze local** (Opción B):

- **URL**: https://cjjmdata.github.io/analisis_datos_ii/
- **Disparador**: cada push a `main` ejecuta `.github/workflows/publish.yml`
- **Cómo funciona**: CI no ejecuta código R. Usa los resultados pre-computados en `_freeze/` (versionado en el repo). Solo Quarto genera el HTML a partir de los freeze existentes.
- **Flujo de trabajo**:
  1. Renderizar localmente (`quarto render` o `quarto preview`)
  2. Hacer commit de los cambios + `_freeze/`
  3. Push a `main` → GitHub Actions publica automáticamente

```bash
# Preview local (no requiere push)
quarto preview

# Render completo local (genera _freeze/ actualizado)
quarto render

# Verificar que _freeze/ tiene cambios después del render
git status
```

- **Monitorear builds**: en GitHub → Actions → "Publish site to GitHub Pages"
- **Si el build falla**: revisar los logs del job en Actions. Las causas comunes son archivos referenciados que no existen o YAML malformado.
- **Importante**: si agregas slides con nuevos chunks R, debes renderizar localmente primero para que `_freeze/` capture los resultados. Sin esto, CI falla.

## Contacto con el usuario

Javier trabaja en Positron. Prefiere iterar rápido con feedback crítico. No le agrada que le validen acríticamente ideas débiles. Escribe en español. El conocimiento previo que tiene sobre el proyecto está en su memoria de Claude (este archivo lo condensa para Claude Code).
