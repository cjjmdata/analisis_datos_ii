# Perfil de la clienta: Patricia Domínguez

> Documento interno del curso. Define el personaje narrativo que atraviesa las 8 sesiones del Parcial 3 de Análisis de Datos II.

## Contexto

**Patricia Domínguez** acaba de heredar un departamento en Roma Norte, Ciudad de México. No tiene experiencia en hospitalidad ni en análisis de datos, pero es una tomadora de decisiones sensata: quiere que sus decisiones de negocio se basen en evidencia, no en intuición.

Ha contratado a una consultora de análisis de datos —la de ustedes, sus alumnos— para que la ayude a tomar tres decisiones encadenadas:

1. **¿Debe listar el departamento en Airbnb o rentarlo de forma tradicional?**
2. **Si lo lista en Airbnb, ¿a qué precio?**
3. **¿Qué ingreso anual esperado debe considerar para su planeación financiera?**

A lo largo de las 8 sesiones, la consultora (la clase) va entregando a Patricia análisis progresivamente más sofisticados que refinan estas decisiones.

## Ficha de la propiedad

| Atributo | Valor |
|---|---|
| Alcaldía | Cuauhtémoc |
| Colonia | Roma Norte |
| Tipo | Departamento (propiedad completa) |
| Recámaras | 2 |
| Baños | 1.5 |
| Capacidad | 4 personas |
| Superficie aprox. | 62 m² |
| Amenidades | Wifi, cocina equipada, aire acondicionado, estacionamiento para 1 auto |
| Estado | Remodelado (2024), listo para rentar |
| Reserva inmediata | A decidir por Patricia |

## Tono profesional de la consultora

Los alumnos actúan como **analistas junior de una consultora**. Esto implica:

- Las comunicaciones son por escrito y orales, profesionales pero claras.
- Cada hallazgo debe incluir: qué encontramos, qué tan confiables somos, qué NO sabemos, y qué recomendamos.
- No se adornan los resultados: si un modelo es débil, se dice.
- Se evita jerga estadística innecesaria al comunicar con Patricia, pero se es preciso al documentar el análisis internamente.

## Mapa narrativo por sesión

| # | Pregunta que Patricia trae a la consultora | Qué le entregamos |
|---|---|---|
| 1 | "Un artículo dice que un Airbnb promedio en Roma Norte cuesta $1,800 la noche. ¿Es realista esa cifra?" | Validación con prueba de una muestra |
| 2 | "¿Cobro más rentando el depto entero o solo un cuarto? ¿Debo buscar ser superhost? ¿El fin de semana vale la pena cobrar diferente?" | Comparaciones con pruebas de dos muestras |
| 3 | "¿Mi alcaldía realmente vale la pena? Comparo Roma con Condesa, Polanco y Del Valle." | Comparación múltiple con ANOVA y asociación con χ² |
| 4 | "Mi cuñado conoce a alguien que le pasó este análisis. ¿Le hacemos caso?" | Auditoría en vivo de un análisis defectuoso |
| 5 | "¿Qué precio base me sugiere el mercado para 2 recámaras?" | Modelo lineal simple: precio ~ recámaras |
| 6 | "¿Qué tan seguro estás de esa recomendación? Quiero un rango, no un número mágico." | Diagnósticos del modelo, intervalos de confianza vs. predicción |
| 7 | "Un solo factor no basta. Combinemos todo lo que sabemos sobre el mercado." | Regresión múltiple con interpretación y controles |
| 8 | Presentación ejecutiva + Q&A | Defensa oral del equipo consultor |

## Decisiones de diseño

**Por qué Roma Norte y no otra alcaldía:** es el mercado Airbnb más denso y documentado de CDMX, lo que garantiza tamaños de muestra suficientes para cualquier prueba y contrastes significativos con otras zonas.

**Por qué una propiedad completa y no un cuarto privado:** permite explorar ambos tipos en la Sesión 2 (comparar precios entre propiedad completa y cuarto privado tiene sentido solo si Patricia puede elegir). Su depto completo es el punto de partida; el cuarto privado entra como comparación estratégica.

**Por qué 2 recámaras:** es el tamaño más representativo del mercado, lo que permite que los modelos de regresión simple (5.x) tengan un uso inmediato para decidir su precio.

**Por qué NO usamos dirección real ni listings específicos:** Patricia es un personaje pedagógico. Los análisis usan datos reales de Inside Airbnb, pero su depto es un prototipo definido por nosotros, no una propiedad en el dataset.
