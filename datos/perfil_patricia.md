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

Las 8 sesiones son **contenido**. Las evaluaciones (examen y defensa del proyecto integrador) se imparten en sesiones extra que **no están dentro de este conteo**.

| # | Pregunta que Patricia trae a la consultora | Qué le entregamos |
|---|---|---|
| 1 | "Un artículo dice que un Airbnb promedio en Roma Norte cuesta $1,800 la noche. ¿Es realista esa cifra?" | Prueba t de una muestra |
| 2 | "¿Cobro más rentando el depto entero o solo un cuarto? ¿Debo buscar ser superhost? ¿Las zonas vecinas son comparables?" | Pruebas de dos muestras (t y proporciones) |
| 3 | "Quiero comparar Roma, Condesa, Polanco y Del Valle a la vez. Y saber si el tipo de propiedad se relaciona con la zona." | ANOVA unidireccional + χ² de contingencia |
| 4 | "Los grupos ya los comparamos. Ahora quiero una forma de estimar el precio a partir de las características de una propiedad." | Regresión simple I: del problema al modelo (ajuste, interpretación básica) |
| 5 | "¿Puedo confiar en ese modelo? ¿Los supuestos que asume son razonables para mi mercado?" | Regresión simple II: validez, supuestos, diagnóstico |
| 6 | "Dame el número y su margen de error. Y explícame si esto se puede leer como causa o solo como asociación." | Regresión simple III: interpretación, predicción, causalidad vs. asociación |
| 7 | "Un solo factor no alcanza. Quiero estimar el precio controlando por varias cosas a la vez." | Regresión múltiple I: construcción y "controlando por" |
| 8 | "Entrega final: un modelo que pueda defender y una recomendación concreta sobre cómo listar." | Regresión múltiple II: diagnóstico, interpretación, caso integrador |

## Decisiones de diseño

**Por qué Roma Norte y no otra alcaldía:** es el mercado Airbnb más denso y documentado de CDMX, lo que garantiza tamaños de muestra suficientes para cualquier prueba y contrastes significativos con otras zonas.

**Por qué una propiedad completa y no un cuarto privado:** permite explorar ambos tipos en la Sesión 2 (comparar precios entre propiedad completa y cuarto privado tiene sentido solo si Patricia puede elegir). Su depto completo es el punto de partida; el cuarto privado entra como comparación estratégica.

**Por qué 2 recámaras:** es el tamaño más representativo del mercado, lo que permite que los modelos de regresión simple (5.x) tengan un uso inmediato para decidir su precio.

**Por qué NO usamos dirección real ni listings específicos:** Patricia es un personaje pedagógico. Los análisis usan datos reales de Inside Airbnb, pero su depto es un prototipo definido por nosotros, no una propiedad en el dataset.
