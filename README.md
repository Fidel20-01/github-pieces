# Piezas de GitHub para la elicitación de requisitos

## Proyecto: Módulo de gestión de pedidos y producción

Este repositorio documenta la aplicación de tres piezas clave de GitHub en el proceso de elicitación y gestión de requisitos del módulo de gestión de pedidos y producción del Open Hub Tec, desarrollado para la Panadería “Burritos” en Tlaxiaco, Oaxaca.

### Equipo ALQF
- Fidel Jiménez Sánchez — Entrevistador y eduScrum Master
- Quetzalli García García — Anotador(a)
- Ximena Leidaly González Morales — Observador(a)
- Alyn Ximena Gómez Hernández — Guardián de la ética

---

## 1. Contexto del proyecto

La Panadería “Burritos” es un negocio familiar dedicado a la elaboración de cemitas artesanales. El proyecto busca apoyar la gestión de pedidos y producción mediante una herramienta digital, reduciendo riesgos de olvido, pérdida de información y errores operativos que actualmente se manejan en libreta o por WhatsApp.

La investigación se apoyó en entrevistas con actores reales, observación de campo, un prototipo en papel y un cuestionario aplicado a compradores del centro de Tlaxiaco. El objetivo fue identificar, clasificar y redactar los requisitos funcionales (RF) y no funcionales (RNF) del módulo.

---

## 2. Objetivo del trabajo

### Objetivo general
Identificar, clasificar y redactar los requisitos funcionales y no funcionales del módulo de gestión de pedidos y producción a partir de la información recabada con actores reales.

### Objetivos específicos
- Diseñar instrumentos de elicitación orientados a las necesidades del módulo.
- Aplicarlos con actores reales y registrar evidencias.
- Redactar requisitos atómicos y verificables con la sintaxis “El sistema debe…”
- Sistematizar los requisitos en GitHub Issues.

---

## 3. Piezas de GitHub aplicadas

<div align="center">
  <table>
    <tr>
      <td align="center" width="33%">
        <h3>📘 Issue</h3>
        <p><strong>Un requisito.</strong> Tiene número, autor, estado y conversación.</p>
      </td>
      <td align="center" width="33%">
        <h3>⭐ Etiqueta</h3>
        <p><strong>El tipo (F, NF, D), la prioridad y la fuente.</strong></p>
      </td>
      <td align="center" width="33%">
        <h3>⚙️ Plantilla</h3>
        <p><strong>Un formulario que obliga a todos a escribir igual.</strong></p>
      </td>
    </tr>
  </table>
</div>

| Pieza | Concepto | Aplicación en el proyecto |
| --- | --- | --- |
| Issue | Un requisito con número, autor, estado y conversación | Cada requisito funcional o no funcional se registra como un issue con su código y estado |
| Etiqueta | El tipo (F, NF, D), la prioridad y la fuente | Se usan etiquetas para clasificar los requisitos según tipo, prioridad y origen |
| Plantilla | Un formulario que obliga a todos a escribir igual | Se utiliza una estructura uniforme para que todos los requisitos tengan la misma redacción |

### 3.1 Issue
Los issues representan cada requisito del sistema. En este proyecto se registraron requisitos como:

- RF-01: registrar un pedido con nombre del cliente, cantidad de piezas y fecha de entrega.
- RF-02: registrar el estado de pago (pagado, con anticipo o pendiente).
- RF-03: registrar el anticipo y el saldo pendiente.
- RF-04: mostrar pedidos pendientes ordenados por fecha de entrega.
- RF-09: mostrar los siete pasos de producción y el paso actual de cada tanda.
- RF-14: registrar mermas con cantidad y causa.
- RNF-03: permitir registrar pedidos y ventas sin internet y sincronizarlos al reconectarse.

Cada issue conserva la trazabilidad de la información, lo que permite justificar su inclusión en el sistema.

### 3.2 Etiqueta
Las etiquetas permiten clasificar cada requisito según:

- Tipo:
  - F: funcional
  - NF: no funcional
  - D: defecto
- Prioridad:
  - Debe
  - Debería
  - Podría
- Fuente:
  - A1, A2, A3, A4, A5

Ejemplo de etiquetado:
- `rf`
- `debe`
- `fase-2`
- `fuente:A1`

Esto facilita la priorización y la revisión del backlog del proyecto.

### 3.3 Plantilla
La plantilla de issue estandariza la redacción del requisito para que todos los documentos sigan la misma estructura. Un ejemplo aplicado al proyecto es:

```md
### Título
RF-01 · Registrar pedido

### Descripción
El sistema debe permitir registrar un pedido con nombre del cliente, cantidad de piezas y fecha de entrega al momento de recibirlo.

### Fuentes
A1, A2 (P18-19)

### Criterio de aceptación
El pedido no se guarda si falta un dato.

### Etiquetas
rf, debe
```

Esto garantiza que todos los requerimientos queden redactados con la misma estructura, sean verificables y puedan compararse entre sí.

---

## 4. Evidencias del proceso de elicitación

El trabajo se apoyó en varios instrumentos aplicados a actores reales:

| ID | Instrumento | Público | Propósito |
| --- | --- | --- | --- |
| I1 | Guía de entrevista semiestructurada | Productores y administración | Identificar procesos, inventario, pedidos, pagos y producción |
| I2 | Guion de entrevista a compradores | Compradores habituales | Conocer hábitos, preferencias y expectativas |
| I3 | Cuestionario | 10 compradores | Observar tendencias y percepción del servicio |
| I4 | Prototipo en papel | Panadería “Burritos” | Validar flujo y vocabulario |
| I5 | Observación de campo | Panadería “Burritos” | Contrastación del proceso real |

### Hallazgos clave
- Los pedidos grandes se gestionan por memoria o WhatsApp, lo que ocasiona riesgo de olvido y falta de control formal.
- La administración necesita un registro claro de pagos, anticipos y saldos.
- Los productores requieren controlar la producción por tanda, la capacidad del horno y las mermas.
- Los compradores desean consultar disponibilidad y precio antes de acudir, y algunos desean realizar pedidos en línea.

---

## 5. Requisitos relevantes del proyecto

### Requisitos funcionales
| ID | Requisito | Prioridad |
| --- | --- | --- |
| RF-01 | Registrar un pedido con cliente, cantidad y fecha de entrega | Debe |
| RF-02 | Registrar estado de pago | Debe |
| RF-03 | Registrar anticipo y saldo | Debe |
| RF-04 | Mostrar pedidos pendientes ordenados por fecha de entrega | Debe |
| RF-05 | Cambiar estado de pedidos | Debería |
| RF-06 | Calcular total del pedido | Debería |
| RF-07 | Registrar ventas del día | Debe |
| RF-08 | Generar nota de remisión | Debería |
| RF-09 | Mostrar pasos de producción y el paso actual | Debe |
| RF-10 | Impedir saltar pasos de producción | Debería |
| RF-14 | Registrar mermas con causa | Debería |
| RF-15 | Registrar compra de insumos | Debería |

### Requisitos no funcionales
| ID | Requisito | Prioridad |
| --- | --- | --- |
| RNF-01 | Texto de al menos 18 px y botones de 44×44 px | Debe |
| RNF-02 | Registrar pedido en menos de 2 minutos sin capacitación previa | Debe |
| RNF-03 | Registrar pedidos y ventas sin internet y sincronizar al reconectarse | Debe |
| RNF-04 | Restringir pantallas de ventas y cuentas al propietario | Debe |
| RNF-05 | Respaldar los datos automáticamente cada día | Debe |
| RNF-06 | Funcionar en celular y tablet | Debe |
| RNF-07 | Usar vocabulario de la organización | Debería |

---

## 6. Importancia de GitHub en la gestión de requisitos

La sistematización de requisitos en GitHub aporta orden, trazabilidad y colaboración. En particular:

- Los issues permiten registrar cada requisito como una unidad gestionable.
- Las etiquetas permiten clasificar y priorizar necesidades y conflictos.
- Las plantillas facilitan la estandarización y evitan inconsistencias en la documentación.
- La herramienta permite mantener el proceso de requisitos como trabajo visible y organizado para el equipo.

---

## 7. Conclusión

La elicitación de requisitos del módulo de gestión de pedidos y producción demostró que el problema principal del negocio es la ausencia de un control formal de pedidos, pagos, producción y entregas. La adopción de GitHub como herramienta de gestión permite transformar esa información en requisitos claros, trazables y priorizados.

Las piezas de GitHub — Issue, Etiqueta y Plantilla — permiten que el equipo documente cada requisito con rigor, mantenga la organización del proyecto y aplique una metodología profesional para la ingeniería de requisitos.

---

## 8. Referencias
- ISO/IEC/IEEE 29148:2018. Systems and software engineering: Life cycle processes: Requirements engineering.
- Sommerville, I. (2016). Ingeniería de software.
- Wiegers, K., & Beatty, J. (2013). Software Requirements.
- GitHub Docs. About issues.

> Este repositorio presenta una visión académica y profesional de cómo se aplican tres piezas fundamentales de GitHub en la elicitación y gestión de requisitos de un proyecto real.
