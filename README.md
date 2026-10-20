# Piezas de GitHub

Repositorio de gestión de requisitos para el módulo de pedidos y producción de la Panadería “Burritos”, alineado con el Documento de Especificación de Requisitos de Software (DRS) del proyecto “Libreta Raíz digital”.

## Estado del proyecto

- Cliente: Panadería “Burritos”
- Producto: Libreta Raíz digital
- Equipo: ALQF
- Documento base: `Practica8.m`
- Repositorio: `Fidel20-01/github-pieces`
- Estado: DRS y trazabilidad preparados para gestión en GitHub Issues

## Objetivo

Este repositorio funciona como una plataforma de trabajo para:

- organizar los requisitos funcionales y no funcionales,
- conectar cada requisito con su proceso BPMN y su fuente de evidencia,
- mantener una trazabilidad clara entre negocio, diseño y validación,
- usar GitHub Issues, etiquetas y milestones como base del control del proyecto.

---

## Estructura del repositorio

```text
.
├── README.md
├── LICENSE
├── docs/
│   ├── index.html
│   └── README.md
├── models/
│   └── README.md
├── evidencias/
│   └── README.md
└── .github/
```

## Documentación y artefactos clave

- `README.md`: resumen ejecutivo del proyecto y trazabilidad.
- `docs/index.html`: panel visual interactivo con los requisitos y filtros.
- `docs/README.md`: guía breve de uso y estructura del repositorio.
- `models/README.md`: lugar para BPMN, diagramas y modelos del sistema.
- `evidencias/README.md`: evidencia de validación, actas y bitácoras.

---

## Alcance del producto

### Fase 1: lado productor

- registro de pedidos,
- estado de pago y anticipos,
- seguimiento de entregas,
- control de producción por tanda,
- gestión de horneadas,
- registro de mermas,
- compras de insumos e inventario.

### Fase 2: lado comprador

- consulta de precio y disponibilidad,
- solicitud de pedidos en línea,
- confirmación del productor,
- elección de punto de entrega,
- conocimiento del origen artesanal del producto.

---

## Requisitos principales

### Funcionales

| ID | Título | Prioridad |
| --- | --- | --- |
| RF-01 | Registrar pedido con cliente, piezas y fecha de entrega | Debe |
| RF-02 | Registrar estado de pago | Debe |
| RF-03 | Registrar anticipo y saldo pendiente | Debe |
| RF-04 | Mostrar pedidos pendientes ordenados por fecha | Debe |
| RF-05 | Cambiar estado de un pedido | Debería |
| RF-06 | Calcular total del pedido | Debería |
| RF-07 | Registrar ventas del día y total diario | Debe |
| RF-08 | Generar nota de remisión | Debería |
| RF-09 | Mostrar siete pasos de producción | Debe |
| RF-10 | Impedir saltarse pasos de producción | Debería |
| RF-11 | Configurar capacidad máxima por horneada | Debería |
| RF-12 | Calcular número de horneadas requeridas | Debería |
| RF-13 | Registrar horneadas con inicio y fin | Debería |
| RF-14 | Registrar mermas | Debería |
| RF-15 | Registrar compras de insumos | Debería |
| RF-16 | Avisar inventario bajo del mínimo | Debería |
| RF-17 | Mostrar precio y disponibilidad al comprador | Podría |
| RF-18 | Permitir solicitud de pedido en línea | Podría |
| RF-19 | Enviar confirmación al comprador | Podría |
| RF-20 | Elegir punto de entrega | Podría |
| RF-21 | Mostrar foto, nombre y comunidad autorizados | Podría |
| RF-22 | Confirmar origen artesanal | Podría |

### No funcionales

| ID | Título | Prioridad |
| --- | --- | --- |
| RNF-01 | Texto grande y botones accesibles | Debe |
| RNF-02 | Registro del pedido en menos de 2 minutos | Debe |
| RNF-03 | Funcionamiento sin internet y sincronización posterior | Debe |
| RNF-04 | Restricción de ventas y cuentas al rol de propietario | Debe |
| RNF-05 | Respaldo automático diario | Debe |
| RNF-06 | Compatibilidad con celular y tablet | Debe |
| RNF-07 | Uso del vocabulario de la organización | Debería |
| RNF-08 | Respuesta del sistema en menos de 2 segundos | Debería |
| RNF-09 | Auditoría de cambios con usuario, fecha y hora | Debería |
| RNF-10 | Mantener tiempos de respuesta con 200 pedidos activos | Podría |

### Reglas de negocio

- RN-01: el precio por pieza es configurable.
- RN-02: saldo pendiente = total del pedido − anticipo.
- RN-03: los siete pasos de producción se ejecutan en orden.
- RN-04: la fermentación dura entre 1 y 2 horas y el horneado, entre 15 y 20 minutos.
- RN-05: ventas y cuentas solo las consulta la propietaria.
- RN-06: cada pedido se clasifica por destino.
- RN-07: el pago puede combinar efectivo, trueque y saldo pendiente.

---

## Procesos BPMN de referencia

- PR-01: Recepción y registro del pedido
- PR-02: Abastecimiento de insumos
- PR-03: Producción por tanda
- PR-04: Empaque y entrega
- PR-05: Cobro, registro y cierre
- PR-06: Excepciones y mermas
- PR-07: Atención al comprador (Fase 2)

La trazabilidad se hace desde cada requisito hasta su proceso BPMN, su fuente y el issue correspondiente.

---

## GitHub Issues y control de versiones

La estrategia del repositorio sigue la propuesta del DRS:

- `rf` / `rnf`: tipo de requisito
- `debe` / `deberia` / `podria`: prioridad
- `fase-1` / `fase-2`: fase
- `pr-01` a `pr-07`: proceso asociado
- `propuesto`, `validado`, `cambio-solicitado`: estado de validación

### Milestones sugeridos

- `v0.1` — borrador del DRS
- `v1.0` — DRS validado por la organización
- `Fase 2` — lado comprador

### Flujo recomendado

1. cada requisito se convierte en un issue,
2. se etiqueta con prioridad, fase y proceso,
3. se relaciona con el BPMN y la fuente,
4. se mueve en el tablero GitHub Projects,
5. se valida con la organización antes de cerrar.

---

## Validación

El repositorio contempla la evidencia sugerida por el DRS:

- visita con la organización,
- prototipo en papel,
- acta de validación,
- registro de decisiones y cambios,
- historial de requisitos en GitHub.

Se recomienda guardar esos artefactos en la carpeta `evidencias/` y los modelos en `models/`.

---

## Estado de preparación del repositorio

- [x] README actualizado con el alcance del proyecto
- [x] panel interactivo de requisitos en `docs/index.html`
- [x] estructura de carpetas para documentación, modelos y evidencias
- [ ] completar issues de requisitos faltantes
- [ ] cargar BPMN y artefactos de validación
- [ ] firmar acta de validación con la organización

---

## Referencias

- Documento base: `Practica8.m`
- Repositorio del proyecto: `https://github.com/Fidel20-01/github-pieces`
- GitHub Docs: Issues

Este repositorio está pensado como una herramienta de gestión del proyecto y no como un reemplazo del DRS; la documentación formal sigue siendo la fuente de verdad del negocio.


""