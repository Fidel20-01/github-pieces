# Piezas de GitHub

## Backlog de requisitos alineado al DRS

Este repositorio funciona como inventario y trazabilidad de requisitos para el proyecto de la Panadería “Burritos”, basado en el Documento de Especificación de Requisitos de Software (DRS) de la Práctica 8.

- Documento base: `Practica8.m`
- Cliente: Panadería “Burritos”, Tlaxiaco, Oaxaca
- Producto: “Libreta Raíz digital”
- Equipo: ALQF
- Área: Módulo de gestión de pedidos y producción

### Relación con el documento

El contenido de este repositorio está vinculado a los requisitos funcionales (RF) y a la estructura del DRS, con prioridad MoSCoW, fuentes, procesos BPMN y casos de uso UML definidos en el documento original.

| ID | Requisito | Prioridad | Fuente | PR / CU | Estado |
| --- | --- | --- | --- | --- | --- |
| RF-01 | Registrar pedido con cliente, piezas y fecha de entrega | Debe | A1, A2 (P18-19) | PR-01 / CU-01 | Propuesto |
| RF-02 | Registrar estado de pago (pagado, con anticipo o pendiente) | Debe | A1, A2 (P21), A4 | PR-01, PR-03 / CU-03 | Propuesto |
| RF-03 | Registrar anticipo y saldo pendiente | Debe | A1, A2 (P21) | PR-03 / CU-03 | Propuesto |
| RF-04 | Mostrar pedidos pendientes ordenados por fecha de entrega | Debe | A1 (visita 2) | PR-01 / CU-02 | Propuesto |
| RF-05 | Cambiar estado de pedido (pendiente, en preparación, entregado, cancelado) | Debería | A1, A2 | PR-01 / CU-03 | Propuesto |
| RF-06 | Calcular total del pedido según piezas y precio vigente | Debería | A2 (P22) | PR-01 / CU-01 | Propuesto |
| RF-07 | Registrar ventas del día y total diario | Debe | A2 (P29) | PR-03 / CU-05 | Propuesto |
| RF-08 | Generar nota de remisión por pedido entregado | Debería | A4 | PR-03 / CU-04 | Propuesto |
| RF-09 | Mostrar los siete pasos de producción y el paso actual de cada tanda | Debe | A1 | PR-02 / CU-06 | Propuesto |
| RF-10 | Impedir completar un paso si el anterior sigue pendiente | Debería | A1 | PR-02 / CU-06 | Propuesto |
| RF-11 | Configurar capacidad máxima de piezas por horneada | Debería | A1 | PR-02 / CU-07 | Propuesto |
| RF-12 | Calcular número de horneadas necesarias | Debería | A1 | PR-02 / CU-07 | Propuesto |
| RF-13 | Registrar cada horneada con piezas, inicio y fin | Debería | A1 | PR-02 / CU-07 | Propuesto |
| RF-14 | Registrar mermas con cantidad y causa | Debería | A2 (P12, P17), A1 | PR-04 / CU-08 | Propuesto |
| RF-15 | Registrar compras de insumos con cantidad y costo | Debería | A2 (P10), A1 | PR-04 / CU-09 | Propuesto |
| RF-16 | Avisar cuando la existencia de un insumo baja del mínimo | Debería | A2 (P11) | PR-04 / CU-09 | Propuesto |
| RF-17 | Mostrar precio y disponibilidad antes de acudir el comprador | Podría | A3 (P13) | PR-05 / CU-10 | Propuesto |
| RF-18 | Permitir solicitar pedido en línea | Podría | A3 (P14) | PR-05 / CU-11 | Propuesto |
| RF-19 | Enviar confirmación del productor al registrar el pedido | Podría | A3 (P15) | PR-05 / CU-11 | Propuesto |
| RF-20 | Permitir elegir punto de entrega dentro de Tlaxiaco | Podría | A5 (6 de 10) | PR-05 / CU-11 | Propuesto |
| RF-21 | Mostrar foto, nombre y comunidad del productor con autorización | Podría | A3 (P16) | PR-05 / CU-12 | Propuesto |

> Nota: el DRS menciona además requisitos no funcionales RNF-01 a RNF-10 para la Fase 1; el contenido visible del documento entregado en esta práctica se centra en los requisitos funcionales principales y en su trazabilidad para gestión en GitHub Issues.

## Objetivos del producto

- O1. Registrar cada pedido al momento de recibirlo.
- O2. Conocer el saldo pendiente de cada pedido sin revisar libretas.
- O3. Obtener el cierre del día sin sumar manualmente.

## Procesos y casos de uso base

- PR-01: Registro y seguimiento de pedidos
- PR-02: Producción por tanda
- PR-03: Entrega, cobro y cierre del día
- PR-04: Control de insumos y mermas
- PR-05: Atención al comprador (Fase 2)

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

## Issues sugeridos

Cada requisito del DRS puede representarse como un issue individual con la misma identificación (RF-XX o RNF-XX), siguiendo el esquema de GitHub Issues del repositorio.

- [RF-01 · Registrar pedido](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-02 · Registrar estado de pago](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-03 · Registrar anticipo y saldo](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-04 · Mostrar pedidos pendientes](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-05 · Cambiar estado del pedido](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-06 · Calcular total del pedido](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-07 · Registrar ventas del día](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-08 · Generar nota de remisión](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-09 · Mostrar pasos de producción](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-10 · Validar secuencia de pasos](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-11 · Configurar capacidad de horneada](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-12 · Calcular horneadas necesarias](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-13 · Registrar horneadas](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-14 · Registrar mermas](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-15 · Registrar compras de insumos](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-16 · Avisar existencias bajas](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-17 · Mostrar precio y disponibilidad](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-18 · Solicitar pedido en línea](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-19 · Confirmación al comprador](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-20 · Elegir punto de entrega](https://github.com/Fidel20-01/github-pieces/issues)
- [RF-21 · Mostrar origen artesanal](https://github.com/Fidel20-01/github-pieces/issues)

## Etiquetas recomendadas

- `rf` / `rnf` — tipo de requisito
- `debe` / `deberia` / `podria` — prioridad MoSCoW
- `fuente:A1` / `fuente:A2` / `fuente:A3` / `fuente:A4` / `fuente:A5`
- `fase-1` / `fase-2`
- `pr-01` / `pr-02` / `pr-03` / `pr-04` / `pr-05`
- `cu-01` ... `cu-12`

## Resumen

Este repositorio está diseñado para representar el trabajo de requisitos como backlog gestionable en GitHub, manteniendo la trazabilidad con el DRS de la Práctica 8 y sin perder la relación con la organización cliente, el proceso de negocio y los casos de uso del sistema.

---

## Repositorio base de referencia

Este contenido está directamente ligado al documento de requisitos del equipo ALQF y no debe interpretarse como un documento independiente del proyecto; sirve como índice técnico para la gestión formal de requisitos en GitHub.

