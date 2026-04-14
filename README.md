# Análisis de Datos II — Sitio del curso

Sitio público de consulta para el curso **Análisis de Datos II (MAT2409)**. Contiene presentaciones, recursos bibliográficos y materiales de auditoría. Los aspectos administrativos se manejan por Brightspace.

## Setup inicial

### 1. Requisitos

- R 4.3+ con los paquetes: `quarto`, `tidyverse`, `janitor`, `scales`, `knitr`
- [Quarto CLI](https://quarto.org/docs/get-started/) 1.4+
- Editor: Positron, RStudio o VS Code con extensión Quarto

### 2. Descargar los datos

Ejecutar una vez:

```bash
Rscript scripts/00_descarga_datos.R
```

Esto descarga ~40 MB desde Inside Airbnb (corte 2025-09-27) y genera `datos/listings_cdmx.rds` para uso en clase.

### 3. Renderizar el sitio

```bash
quarto preview     # desarrollo
quarto render      # producción (genera _site/)
```

## Estructura del repositorio

```
.
├── _quarto.yml                ← configuración del sitio
├── estilo-sitio.scss          ← tema del sitio (Flatly + custom)
├── estilo-slides.scss         ← tema de slides Revealjs
├── index.qmd                  ← landing page
├── scripts/
│   └── 00_descarga_datos.R    ← pipeline de datos
├── datos/
│   ├── perfil_patricia.md     ← personaje narrativo del parcial
│   └── listings_cdmx.rds      ← datos limpios (generado)
├── slides/
│   ├── index.qmd              ← listing autogenerado
│   └── p3/                    ← presentaciones del parcial 3
├── recursos/                  ← bibliografía y guías
├── auditorias/                ← análisis defectuosos para práctica
└── assets/
    └── img/                   ← logos y gráficas
```

## Licencia

- Datos de Inside Airbnb: Creative Commons Attribution 4.0 International
- Materiales del curso: (definir)

## Aviso de privacidad

Este repositorio **nunca** contiene información administrativa del curso ni datos identificables de estudiantes. Todo eso vive en Brightspace.
