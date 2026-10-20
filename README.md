# Piezas de GitHub

## Backlog de requisitos del proyecto “Libreta Raíz digital”

Este repositorio funciona como tablero de gestión de requisitos para el módulo de pedidos y producción de la Panadería “Burritos”, vinculado directamente al Documento de Especificación de Requisitos de Software (DRS) de la Práctica 8.

- Cliente: Panadería “Burritos”, Tlaxiaco, Oaxaca
- Producto: Libreta Raíz digital
- Equipo: ALQF
- Documento base: `Practica8.m`
- Enfoque: trazabilidad de requisitos en GitHub Issues, con prioridad MoSCoW, procesos BPMN, casos de uso UML y validación con la organización

---

## 1. Relación con el documento base

El contenido del repositorio está alineado con los siguientes elementos del DRS:

- Requisitos funcionales: RF-01 a RF-22
- Reglas de negocio: RN-01 a RN-05
- Requisitos no funcionales: RNF-01 a RNF-10
- Procesos de negocio: PR-01 a PR-05
- Casos de uso: CU-01 a CU-12
- Objetivos del producto: O1, O2, O3

---

## 2. Tablero Kanban de requisitos

| Backlog | En análisis | En revisión | Aceptado |
| --- | --- | --- | --- |
| RF-01 Registrar pedido | RF-03 Anticipo y saldo | RF-09 Mostrar pasos de producción | RF-07 Ventas del día |
| RF-02 Estado de pago | RF-05 Estado de pedido | RF-13 Registrar horneadas | RF-04 Pedidos pendientes |
| RF-06 Calcular total | RF-11 Capacidad de horneada | RF-14 Registrar mermas | RF-16 Existencias bajas |
| RF-08 Nota de remisión | RF-12 Horneadas necesarias | RF-15 Compras de insumos | RF-17 Precio y disponibilidad |
| RF-10 Secuencia de pasos | RF-18 Solicitar pedido en línea | RF-19 Confirmación al comprador |  |
| RF-20 Punto de entrega | RF-21 Origen artesanal |  |  |
| RNF-03 Sincronización sin internet | RNF-04 Seguridad por rol |  |  |
| RNF-01 Usabilidad | RNF-02 Registro en menos de 2 minutos |  |  |

> El tablero anterior es una representación del flujo de trabajo recomendado para GitHub Projects. Los estados reales se gestionan en la sección de Issues y Projects del repositorio.

---

## 3. Requisitos priorizados

| ID | Título | Prioridad | Fuente | PR / CU |
| --- | --- | --- | --- | --- |
| RF-01 | Registrar pedido con cliente, piezas y fecha de entrega | Debe | A1, A2 (P18-19) | PR-01 / CU-01 |
| RF-02 | Registrar estado de pago | Debe | A1, A2 (P21), A4 | PR-01, PR-03 / CU-03 |
| RF-03 | Registrar anticipo y saldo pendiente | Debe | A1, A2 (P21) | PR-03 / CU-03 |
| RF-04 | Mostrar pedidos pendientes ordenados por fecha | Debe | A1 (visita 2) | PR-01 / CU-02 |
| RF-05 | Cambiar el estado de un pedido | Debería | A1, A2 | PR-01 / CU-03 |
| RF-06 | Calcular total del pedido | Debería | A2 (P22) | PR-01 / CU-01 |
| RF-07 | Registrar ventas del día y mostrar total diario | Debe | A2 (P29) | PR-03 / CU-05 |
| RF-08 | Generar nota de remisión | Debería | A4 | PR-03 / CU-04 |
| RF-09 | Mostrar los siete pasos de producción | Debe | A1 | PR-02 / CU-06 |
| RF-10 | Impedir saltar pasos de producción | Debería | A1 | PR-02 / CU-06 |
| RF-11 | Configurar capacidad máxima por horneada | Debería | A1 | PR-02 / CU-07 |
| RF-12 | Calcular número de horneadas necesarias | Debería | A1 | PR-02 / CU-07 |
| RF-13 | Registrar horneadas con inicio y fin | Debería | A1 | PR-02 / CU-07 |
| RF-14 | Registrar mermas | Debería | A2 (P12, P17), A1 | PR-04 / CU-08 |
| RF-15 | Registrar compras de insumos | Debería | A2 (P10), A1 | PR-04 / CU-09 |
| RF-16 | Avisar existencias bajas | Debería | A2 (P11) | PR-04 / CU-09 |
| RF-17 | Mostrar precio y disponibilidad para comprador | Podría | A3 (P13) | PR-05 / CU-10 |
| RF-18 | Solicitar pedido en línea | Podría | A3 (P14) | PR-05 / CU-11 |
| RF-19 | Enviar confirmación del productor | Podría | A3 (P15) | PR-05 / CU-11 |
| RF-20 | Elegir punto de entrega | Podría | A5 (6 de 10) | PR-05 / CU-11 |
| RF-21 | Mostrar origen artesanal y datos autorizados | Podría | A5 (3-4 de 10) | PR-05 / CU-12 |
| RNF-01 | Texto mínimo y botones accesibles | Debe | A2 (P33), A4 | N/A |
| RNF-02 | Registro de pedido en menos de 2 minutos | Debe | A2 (P36) | N/A |
| RNF-03 | Funcionar sin internet y sincronizar después | Debe | A2 (P32) | N/A |
| RNF-04 | Restricción de ventas y cuentas a propietario | Debe | A2 (P34) | N/A |

---

## 4. Objetivos de negocio y trazabilidad

- O1. Que todo pedido recibido quede registrado en el momento de recibirlo. → RF-01
- O2. Que la propietaria conozca el saldo pendiente de cada pedido sin revisar libretas. → RF-03, RF-04
- O3. Que el cierre del día se obtenga sin sumar a mano. → RF-07

---

## 5. Procesos de negocio y casos de uso base

### Procesos BPMN

- PR-01: Registro y seguimiento de pedidos
- PR-02: Producción por tanda
- PR-03: Entrega, cobro y cierre del día
- PR-04: Control de insumos y mermas
- PR-05: Atención al comprador (Fase 2)

### Casos de uso UML

- CU-01: Registrar pedido
- CU-02: Consultar pedidos pendientes
- CU-03: Actualizar estado y pago de un pedido
- CU-04: Registrar entrega y emitir nota de remisión
- CU-05: Consultar ventas del día
- CU-06: Controlar pasos de producción
- CU-07: Planificar y registrar horneadas
- CU-08: Registrar mermas
- CU-09: Gestionar compras e insumos
- CU-10: Consultar precio y disponibilidad
- CU-11: Solicitar pedido y recibir confirmación
- CU-12: Conocer origen artesanal

---

## 6. Etiquetas recomendadas para Issues

- `rf` / `rnf` — tipo de requisito
- `debe` / `deberia` / `podria` — prioridad
- `fase-1` / `fase-2`
- `fuente:A1` / `fuente:A2` / `fuente:A3` / `fuente:A4` / `fuente:A5`
- `pr-01` ... `pr-05`
- `cu-01` ... `cu-12`

---

## 7. Propuesta de flujo de trabajo en GitHub

1. Cada requisito del DRS se convierte en un issue con su ID oficial.
2. Se etiqueta con prioridad, fuente y fase.
3. Se asocia con su proceso PR y su caso de uso CU.
4. Se mueve en el Project con la lógica de tablero Kanban.
5. Se valida con la organización cliente y el docente antes de cerrar el requisito.

---

## 8. Resumen ejecutivo

Este repositorio funciona como una demostración práctica de gestión de requisitos en GitHub para la asignatura de Fundamentos de Ingeniería de Software. Su objetivo no es reemplazar el DRS, sino materializarlo en un backlog ejecutable, con trazabilidad clara, lenguaje técnico y vinculación directa a la realidad del negocio y a la evidencia de la Práctica 8.

---

## 9. Repositorio de referencia

El contenido del repositorio está ligado a:

- Documento de requisitos: `Practica8.m`
- Cliente: Panadería “Burritos”
- Producto: Libreta Raíz digital
- Equipo ALQF

La gestión en GitHub debe reflejar la estructura del documento, no una versión independiente del mismo.

