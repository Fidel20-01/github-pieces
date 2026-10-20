#CEMITAS

Repositorio de gestión de requisitos para el módulo de pedidos y producción de la Panadería “Burritos”, basado en el Documento de Especificación de Requisitos de Software (DRS) de la Práctica 8.

## Estado del proyecto

- Cliente: Panadería “Burritos”, Tlaxiaco, Oaxaca
- Producto: Libreta Raíz digital
- Equipo: ALQF
- Documento base: `Practica8.m`
- Versión del repositorio: `v0.2` (borrador para validación)
- Enfoque principal: trazabilidad de requisitos en GitHub Issues y gestión de backlog con procesos BPMN

## Resumen ejecutivo

Este repositorio funciona como una bitácora digital de requisitos para la Fase 1 y la Fase 2 del proyecto. La idea es mantener alineado el desarrollo con el DRS y con los procesos de negocio descritos en el BPMN de la Unidad 2.

El módulo cubre desde la recepción y control de pedidos hasta la producción, las ventas del día, las mermas, compras de insumos, y la futura atención al comprador por vía digital.

## Objetivos del producto

- O1. Registrar todo pedido recibido en el momento de entrar al sistema.
- O2. Conocer el saldo pendiente sin revisar libretas físicas.
- O3. Obtener el cierre del día sin sumar a mano.

## Alcance del repositorio

- Requisitos funcionales: RF-01 a RF-22
- Reglas de negocio: RN-01 a RN-07
- Requisitos no funcionales: RNF-01 a RNF-10
- Procesos BPMN: PR-01 a PR-07
- Fases: Fase 1 (lado productor) y Fase 2 (lado comprador)

## Alineación con el DRS

### Fase 1: pedidos y producción

- RF-01 a RF-16
- RNF-01 a RNF-10
- RN-01 a RN-07
- PR-01 a PR-06

### Fase 2: atención al comprador

- RF-17 a RF-22
- PR-07

## Mapa de procesos BPMN

| Proceso | Descripción | Requisitos clave |
| --- | --- | --- |
| PR-01 | Recepción y registro del pedido | RF-01, RF-04, RF-05, RF-06 |
| PR-02 | Abastecimiento de insumos | RF-15, RF-16 |
| PR-03 | Producción por tanda | RF-09, RF-10, RF-11, RF-12, RF-13 |
| PR-04 | Empaque y entrega | RF-08, RF-20 |
| PR-05 | Cobro, registro y cierre | RF-02, RF-03, RF-05, RF-07, RF-08 |
| PR-06 | Excepciones y mermas | RF-14 |
| PR-07 | Atención al comprador | RF-17, RF-18, RF-19, RF-20, RF-21, RF-22 |

## Requisitos funcionales principales

| ID | Título | Prioridad | Fase |
| --- | --- | --- | --- |
| RF-01 | Registrar pedido con cliente, piezas y fecha de entrega | Debe | Fase 1 |
| RF-02 | Registrar estado de pago | Debe | Fase 1 |
| RF-03 | Registrar anticipo y saldo pendiente | Debe | Fase 1 |
| RF-04 | Mostrar pedidos pendientes ordenados por fecha | Debe | Fase 1 |
| RF-05 | Cambiar el estado del pedido | Debería | Fase 1 |
| RF-06 | Calcular el total del pedido | Debería | Fase 1 |
| RF-07 | Registrar ventas del día y mostrar total diario | Debe | Fase 1 |
| RF-08 | Generar nota de remisión | Debería | Fase 1 |
| RF-09 | Mostrar los siete pasos de producción | Debe | Fase 1 |
| RF-10 | Impedir saltarse pasos de producción | Debería | Fase 1 |
| RF-11 | Configurar capacidad máxima por horneada | Debería | Fase 1 |
| RF-12 | Calcular número de horneadas necesarias | Debería | Fase 1 |
| RF-13 | Registrar horneadas con inicio y fin | Debería | Fase 1 |
| RF-14 | Registrar mermas por causa | Debería | Fase 1 |
| RF-15 | Registrar compras de insumos | Debería | Fase 1 |
| RF-16 | Avisar cuando falta inventario | Debería | Fase 1 |
| RF-17 | Mostrar precio y disponibilidad | Podría | Fase 2 |
| RF-18 | Solicitar pedido en línea | Podría | Fase 2 |
| RF-19 | Enviar confirmación al comprador | Podría | Fase 2 |
| RF-20 | Elegir punto de entrega | Podría | Fase 2 |
| RF-21 | Mostrar foto y nombre con autorización | Podría | Fase 2 |
| RF-22 | Indicar origen artesanal confirmado | Podría | Fase 2 |

## Requisitos no funcionales principales

| ID | Título | Prioridad |
| --- | --- | --- |
| RNF-01 | Texto mínimo y botones accesibles | Debe |
| RNF-02 | Registro de pedido en menos de 2 minutos | Debe |
| RNF-03 | Funcionamiento sin internet y sincronización posterior | Debe |
| RNF-04 | Restricción de ventas y cuentas al propietario | Debe |
| RNF-05 | Respaldo diario automático | Debe |
| RNF-06 | Compatibilidad con celular y tablet | Debe |
| RNF-07 | Uso del vocabulario de la organización | Debería |
| RNF-08 | Guardar y consultar pedidos en menos de 2 s | Debería |
| RNF-09 | Auditoría de cambios con usuario, fecha y hora | Debería |
| RNF-10 | Mantener desempeño con 200 pedidos activos | Podría |

## Reglas de negocio clave

- RN-01: El precio por pieza es configurable.
- RN-02: El saldo pendiente se calcula como total menos anticipo.
- RN-03: Los siete pasos de producción deben ejecutarse en orden.
- RN-04: La fermentación dura entre 1 y 2 horas y depende del clima.
- RN-05: Solo la propietaria consulta ventas y cuentas.
- RN-06: Cada pedido se clasifica por destino.
- RN-07: El pago puede combinar efectivo, trueque y saldo pendiente.

## Etiquetas recomendadas para Issues

- Tipo: `rf`, `rnf`
- Prioridad: `debe`, `deberia`, `podria`
- Fase: `fase-1`, `fase-2`
- Proceso: `pr-01` a `pr-07`
- Estado: `propuesto`, `validado`, `cambio-solicitado`

## Flujo de trabajo sugerido

1. Cada requisito del DRS se convierte en un issue.
2. Se etiqueta con prioridad, tipo, fase y proceso.
3. Se vincula con su requisito y su proceso BPMN.
4. Se mueve en un Project con columnas tipo Kanban.
5. Se revisa con la organización y se actualiza el estado en GitHub.

## Documentos y evidencias

- `Practica8.m` — documento base del DRS
- `docs/index.html` — vista interactiva del backlog
- `README.md` — resumen ejecutivo y trazabilidad
- `models/` — BPMN y artefactos del proyecto
- `evidencias/` — actas, fotos y registros de validación

## Pendientes clave

- Cargar los issues restantes del repositorio.
- Completar la validación con la organización cliente.
- Subir los archivos BPMN y evidencias.
- Actualizar la versión final a `v1.0` tras la aprobación.

## Enlaces útiles

- Repositorio: https://github.com/Fidel20-01/github-pieces
- Documento base: `Practica8.m`
- Página de requisitos: `docs/index.html`

---

Este repositorio está pensado como una demostración práctica de gestión de requisitos con GitHub, usando la estructura del DRS como fuente de verdad y un tablero de trabajo para seguir cada requisito con trazabilidad, validación y control de cambios.

