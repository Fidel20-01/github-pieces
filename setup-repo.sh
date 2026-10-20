#!/usr/bin/env bash
set -euo pipefail

REPO="Fidel20-01/github-pieces"
OWNER="Fidel20-01"
PROJECT_TITLE="Libreta Raíz digital - Requisitos"

echo "== Verificando autenticación =="
gh auth status --hostname github.com >/dev/null

echo "== Creando labels =="
for label in \
  rf rnf rn \
  debe deberia podria \
  fase-1 fase-2 \
  pr-01 pr-02 pr-03 pr-04 pr-05 pr-06 pr-07 \
  propuesto validado cambio-solicitado
do
  gh label create "$label" --repo "$REPO" --force >/dev/null 2>&1 || true
done

echo "== Creando milestones =="
create_milestone() {
  local title="$1"
  gh api \
    --method POST \
    -H "Accept: application/vnd.github+json" \
    "/repos/$REPO/milestones" \
    -f title="$title" \
    -f state=open \
    >/dev/null 2>&1 || true
}
create_milestone "v0.1"
create_milestone "v1.0"
create_milestone "Fase 2"

echo "== Creando proyecto GitHub Projects =="
PROJECT_NUMBER=$(gh project create --owner "$OWNER" --title "$PROJECT_TITLE" --format json 2>/dev/null | jq -r '.number' || true)

if [ -z "${PROJECT_NUMBER:-}" ] || [ "$PROJECT_NUMBER" = "null" ]; then
  echo "No se pudo crear el proyecto con gh project create."
  echo "Puedes crear el proyecto desde GitHub UI y luego ajustar el número manualmente."
  echo "Sigue con la creación de issues."
  PROJECT_NUMBER=""
fi

create_issue() {
  local title="$1"
  local labels="$2"
  local body="$3"
  gh issue create \
    --repo "$REPO" \
    --title "$title" \
    --label "$labels" \
    --body "$body" >/dev/null
}

echo "== Creando issues funcionales =="
create_issue "RF-01 · Registrar pedido" "rf,debe,fase-1,pr-01,propuesto" $'El sistema debe permitir registrar un pedido con nombre del cliente, cantidad de piezas y fecha de entrega al momento de recibirlo.\n\nFuentes: A1, A2 (P18-19)\n\nCriterio de aceptación:\n- El pedido no se guarda si falta alguno de los tres datos.\n- El sistema indica cuál dato falta.\n- El pedido guardado aparece en la lista de pedidos pendientes.\n\nTrazabilidad: PR-01 / BPMN #1, #2'

create_issue "RF-02 · Registrar estado de pago" "rf,debe,fase-1,pr-05,propuesto" $'El sistema debe registrar el estado de pago de cada pedido (pagado, con anticipo o pendiente).\n\nFuentes: A1, A2 (P21), A4\n\nCriterio de aceptación:\n- Cada pedido muestra exactamente uno de los tres estados.\n- Pasa a “con anticipo” al capturar un anticipo mayor que 0 y menor que el total.\n- No admite un anticipo mayor que el total.\n\nTrazabilidad: PR-05 / BPMN #16, #18'

create_issue "RF-03 · Registrar anticipo y saldo pendiente" "rf,debe,fase-1,pr-05,propuesto" $'El sistema debe registrar el monto del anticipo y el saldo pendiente de cada pedido.\n\nFuentes: A1, A2 (P21)\n\nCriterio de aceptación:\n- Saldo = total − anticipo.\n- No admite un anticipo mayor que el total.\n- El saldo pendiente se muestra en cada pedido.\n\nTrazabilidad: PR-05 / BPMN #16, #18'

create_issue "RF-04 · Mostrar pedidos pendientes ordenados por fecha" "rf,debe,fase-1,pr-01,propuesto" $'El sistema debe mostrar los pedidos pendientes ordenados por fecha de entrega.\n\nFuentes: A1 (visita 2)\n\nCriterio de aceptación:\n- La lista va de la fecha más cercana a la más lejana.\n- Se excluyen pedidos entregados y cancelados.\n- El orden es visible y consistente.\n\nTrazabilidad: PR-01 / BPMN #2, #8'

create_issue "RF-05 · Cambiar el estado de un pedido" "rf,deberia,fase-1,pr-01,propuesto" $'El sistema debe permitir cambiar el estado de un pedido (pendiente, en preparación, entregado, cancelado).\n\nFuentes: A1, A2\n\nCriterio de aceptación:\n- Cada cambio queda guardado con fecha y hora.\n- El estado cambia correctamente.\n- El historial del cambio es verificable.\n\nTrazabilidad: PR-01, PR-03, PR-05 / BPMN #2, #8, #19'

create_issue "RF-06 · Calcular total del pedido" "rf,deberia,fase-1,pr-01,propuesto" $'El sistema debe calcular el total de un pedido a partir de las piezas y el precio por pieza vigente.\n\nFuentes: A2 (P22)\n\nCriterio de aceptación:\n- El cálculo coincide con el manual en 5 pedidos de prueba.\n- El total se actualiza cuando cambian las piezas o el precio.\n\nTrazabilidad: PR-01, PR-05 / BPMN #2, #17'

create_issue "RF-07 · Registrar ventas del día y mostrar total diario" "rf,debe,fase-1,pr-05,propuesto" $'El sistema debe registrar las ventas del día y mostrar el total diario.\n\nFuentes: A2 (P29)\n\nCriterio de aceptación:\n- Total = suma de las ventas del día.\n- Coincide con la suma manual en una prueba de al menos 10 ventas.\n- El cierre del día se obtiene sin sumar a mano.\n\nTrazabilidad: PR-05 / BPMN #17'

create_issue "RF-08 · Generar nota de remisión" "rf,deberia,fase-1,pr-04,propuesto" $'El sistema debe generar una nota de remisión por cada pedido entregado.\n\nFuentes: A4\n\nCriterio de aceptación:\n- Incluye folio consecutivo sin repetir.\n- Tiene fecha, cliente, piezas y monto.\n- Se genera al entregar el pedido.\n\nTrazabilidad: PR-04, PR-05 / BPMN #15c, #19'

create_issue "RF-09 · Mostrar los siete pasos de producción" "rf,debe,fase-1,pr-03,propuesto" $'El sistema debe mostrar los siete pasos de producción y el paso actual de cada tanda.\n\nFuentes: A1\n\nCriterio de aceptación:\n- La pantalla muestra los siete pasos en orden.\n- Resalta el paso actual.\n- La secuencia es visible para producción.\n\nTrazabilidad: PR-03 / BPMN #10 a #14a'

create_issue "RF-10 · Impedir saltarse pasos de producción" "rf,deberia,fase-1,pr-03,propuesto" $'El sistema debe impedir marcar un paso de producción como completado si el anterior sigue pendiente.\n\nFuentes: A1\n\nCriterio de aceptación:\n- Al intentar saltar un paso, se muestra un aviso.\n- El estado del paso no cambia.\n- La secuencia se mantiene obligatoria.\n\nTrazabilidad: PR-03 / BPMN #11 a #14a'

create_issue "RF-11 · Configurar capacidad máxima de horneada" "rf,deberia,fase-1,pr-03,propuesto" $'El sistema debe permitir configurar la capacidad máxima de piezas por horneada.\n\nFuentes: A1\n\nCriterio de aceptación:\n- El valor es entero mayor que 0.\n- Se puede editar.\n- Se usa en el cálculo de horneadas.\n- El valor inicial propuesto es 40.\n\nTrazabilidad: PR-03 / BPMN #14a'

create_issue "RF-12 · Calcular número de horneadas necesarias" "rf,deberia,fase-1,pr-03,propuesto" $'El sistema debe calcular el número de horneadas necesarias para un pedido según la capacidad configurada.\n\nFuentes: A1\n\nCriterio de aceptación:\n- Con capacidad 40 y 300 piezas resulta 8 horneadas.\n- El cálculo usa redondeo hacia arriba.\n- Se refleja en el plan de producción.\n\nTrazabilidad: PR-03 / BPMN #4b, #14a'

create_issue "RF-13 · Registrar horneadas con inicio y fin" "rf,deberia,fase-1,pr-03,propuesto" $'El sistema debe registrar cada horneada con número de piezas, hora de inicio y hora de fin.\n\nFuentes: A1\n\nCriterio de aceptación:\n- Se guarda la duración.\n- No admite una hora final anterior a la de inicio.\n- Se calcula la duración automática.\n\nTrazabilidad: PR-03 / BPMN #14a'

create_issue "RF-14 · Registrar mermas" "rf,deberia,fase-1,pr-06,propuesto" $'El sistema debe registrar las mermas con cantidad de piezas y causa: clima, quemado o daño en transporte.\n\nFuentes: A2 (P12, P17), A1\n\nCriterio de aceptación:\n- No se guarda sin cantidad ni causa.\n- Se registra la causa de la merma.\n- La merma queda visible en producción.\n\nTrazabilidad: PR-06 / BPMN #12x a #12z, #15x a #15y'

create_issue "RF-15 · Registrar compras de insumos" "rf,deberia,fase-1,pr-02,propuesto" $'El sistema debe registrar las compras de insumos (harina, panela, levadura, leña) con cantidad y costo.\n\nFuentes: A2 (P10), A1\n\nCriterio de aceptación:\n- La existencia del insumo aumenta con la cantidad comprada.\n- Se guarda el costo.\n- La compra queda asociada al registro del insumo.\n\nTrazabilidad: PR-02 / BPMN #5, #6'

create_issue "RF-16 · Avisar existencias bajas" "rf,deberia,fase-1,pr-02,propuesto" $'El sistema debe avisar cuando la existencia de un insumo baje del mínimo configurado.\n\nFuentes: A2 (P11)\n\nCriterio de aceptación:\n- El aviso aparece cuando el inventario queda por debajo del mínimo.\n- El usuario puede reaccionar con tiempo.\n- La alerta es consistente.\n\nTrazabilidad: PR-02 / BPMN #7'

create_issue "RF-17 · Mostrar precio y disponibilidad" "rf,podria,fase-2,pr-07,propuesto" $'El sistema debe mostrar precio y disponibilidad de cemitas antes de que el comprador acuda.\n\nFuentes: A3 (P13)\n\nCriterio de aceptación:\n- Muestra la disponibilidad con fecha y hora de actualización.\n- Se informa el precio vigente.\n- Se muestra antes de que el cliente llegue.\n\nTrazabilidad: PR-07 / BPMN sin elemento propio'

create_issue "RF-18 · Solicitar pedido en línea" "rf,podria,fase-2,pr-07,propuesto" $'El sistema debe permitir al comprador solicitar un pedido en línea.\n\nFuentes: A3 (P14)\n\nCriterio de aceptación:\n- La solicitud aparece en la lista de pedidos del productor.\n- El sistema la registra como solicitud.\n- El pedido ingresa al flujo de atención del productor.\n\nTrazabilidad: PR-07 / flujo de mensaje hacia #1'

create_issue "RF-19 · Enviar confirmación al comprador" "rf,podria,fase-2,pr-07,propuesto" $'El sistema debe enviar al comprador una confirmación del productor al registrar su pedido.\n\nFuentes: A3 (P15)\n\nCriterio de aceptación:\n- El comprador recibe la confirmación cuando el productor registra el pedido.\n- La confirmación queda registrada.\n- La comunicación confirma la recepción.\n\nTrazabilidad: PR-07 / flujo de mensaje desde #19'

create_issue "RF-20 · Elegir punto de entrega" "rf,podria,fase-2,pr-07,propuesto" $'El sistema debe permitir elegir un punto de entrega dentro de Tlaxiaco.\n\nFuentes: A5 (6 de 10)\n\nCriterio de aceptación:\n- El comprador elige de una lista de puntos configurados por el productor.\n- La ubicación queda registrada.\n- Se asocia al pedido del comprador.\n\nTrazabilidad: PR-07, PR-04 / BPMN #15b, #15c'

create_issue "RF-21 · Mostrar información del productor con autorización" "rf,podria,fase-2,pr-07,propuesto" $'El sistema debe mostrar foto, nombre y comunidad de quien elaboró el producto cuando existe autorización.\n\nFuentes: A5 (3 de 10)\n\nCriterio de aceptación:\n- No muestra datos de la persona sin autorización registrada.\n- Se visualiza la información autorizada.\n- Se protege la privacidad del productor.\n\nTrazabilidad: PR-07 / BPMN sin elemento propio'

create_issue "RF-22 · Indicar origen artesanal confirmado" "rf,podria,fase-2,pr-07,propuesto" $'El sistema debe indicar que la organización confirmó el origen artesanal del producto.\n\nFuentes: A5 (4 de 10)\n\nCriterio de aceptación:\n- La indicación aparece solo si existe confirmación registrada.\n- La confirmación es verificable.\n- La señal de origen artesanal es visible para el comprador.\n\nTrazabilidad: PR-07 / BPMN sin elemento propio'

create_issue "RN-01 · Precio por pieza configurable" "rn,debe,fase-1,propuesto" $'El precio por pieza es configurable y puede existir un precio de mayoreo a partir de un umbral.\n\nFuentes: A2 (P22), A1\n\nCriterio de aceptación:\n- Existe una configuración para el precio por pieza.\n- Pueden existir precios de mayoreo si aplica.\n- La regla es gestionable en la configuración.\n\nTrazabilidad: RN-01'

create_issue "RN-02 · Saldo pendiente = total − anticipo" "rn,debe,fase-1,propuesto" $'La regla de negocio establece que el saldo pendiente debe calcularse como total del pedido menos anticipo.\n\nFuentes: A1, A2\n\nCriterio de aceptación:\n- El cálculo del saldo es consistente con la fórmula.\n- Se aplica en todas las cuentas relacionadas con el pedido.\n- Se refleja en el estado financiero del pedido.\n\nTrazabilidad: RN-02'

create_issue "RN-03 · Secuencia obligatoria de los siete pasos" "rn,debe,fase-1,propuesto" $'Los siete pasos de producción deben ejecutarse en orden y ninguno se puede saltar.\n\nFuentes: A1 (BPMN #11 a #14a)\n\nCriterio de aceptación:\n- La secuencia no puede romperse.\n- Se bloquea la acción si se intenta saltar una etapa.\n- La ejecución es obligatoria.\n\nTrazabilidad: RN-03'

create_issue "RN-04 · Fermentación y horneado" "rn,debe,fase-1,propuesto" $'La fermentación dura de 1 a 2 horas y depende del clima; el horneado dura de 15 a 20 minutos por horneada.\n\nFuentes: A1 (BPMN #12, #14a)\n\nCriterio de aceptación:\n- Se respeta la duración esperada.\n- La duración de fermentación y horneado está documentada.\n- La secuencia considera clima y capacidad del horno.\n\nTrazabilidad: RN-04'

create_issue "RN-05 · Acceso a ventas y cuentas" "rn,debe,fase-1,propuesto" $'Las ventas y las cuentas solo las consulta la propietaria.\n\nFuentes: A2 (P34)\n\nCriterio de aceptación:\n- El rol propietario tiene acceso.\n- El resto de roles no puede abrir esas pantallas.\n- El acceso está restringido por permisos.\n\nTrazabilidad: RN-05'

create_issue "RN-06 · Clasificación por destino" "rn,debe,fase-1,propuesto" $'Todo pedido se clasifica por su destino: menudeo en local, mayoreo o reventa, o envío foráneo.\n\nFuentes: A1 (BPMN #3, #15b)\n\nCriterio de aceptación:\n- El destino se registra en el pedido.\n- Define si se empaca en cajas o no.\n- La clasificación es visible y consistente.\n\nTrazabilidad: RN-06'

create_issue "RN-07 · Pago con combinación de efectivo, trueque y saldo" "rn,debe,fase-1,propuesto" $'Un mismo pedido puede liquidarse con una combinación de efectivo, trueque y saldo pendiente por cobrar.\n\nFuentes: A1 (BPMN #16)\n\nCriterio de aceptación:\n- La combinación de pago queda registrada.\n- El pedido refleja el tipo de pago recibido.\n- La liquidación es consistente con la regla de negocio.\n\nTrazabilidad: RN-07'

create_issue "RNF-01 · Texto mínimo y botones accesibles" "rnf,debe,fase-1,propuesto" $'El sistema debe ofrecer texto de al menos 18 px y botones de al menos 44×44 px en todas las pantallas principales.\n\nFuentes: A2 (P33), A4\n\nCriterio de aceptación:\n- Inspección visual de pantallas principales.\n- El texto cumple con el mínimo.\n- Los botones cumplen con el mínimo.\n\nTrazabilidad: RNF-01'

create_issue "RNF-02 · Registro de pedido en menos de 2 minutos" "rnf,debe,fase-1,propuesto" $'El sistema debe permitir registrar un pedido en menos de 2 minutos sin capacitación previa.\n\nFuentes: A2 (P36)\n\nCriterio de aceptación:\n- Prueba cronometrada con usuarios nuevos.\n- Los usuarios cumplen la meta de tiempo.\n- La operación es sencilla.\n\nTrazabilidad: RNF-02'

create_issue "RNF-03 · Sincronización sin internet" "rnf,debe,fase-1,propuesto" $'El sistema debe permitir registrar pedidos y ventas sin internet y sincronizarlos al reconectarse.\n\nFuentes: A2 (P32)\n\nCriterio de aceptación:\n- El sistema funciona sin conexión.\n- Los registros se sincronizan al reconectarse.\n- No se pierden ni duplican registros.\n\nTrazabilidad: RNF-03'

create_issue "RNF-04 · Restricción de ventas y cuentas" "rnf,debe,fase-1,propuesto" $'El sistema debe restringir las pantallas de ventas y cuentas al usuario con rol de propietario.\n\nFuentes: A2 (P34)\n\nCriterio de aceptación:\n- El propietario tiene acceso.\n- El resto de roles no puede abrir esas pantallas.\n- Se valida el control por permisos.\n\nTrazabilidad: RNF-04'

create_issue "RNF-05 · Respaldo diario automático" "rnf,debe,fase-1,propuesto" $'El sistema debe respaldar los datos automáticamente cada día.\n\nFuentes: A2 (P35)\n\nCriterio de aceptación:\n- Existe copia restaurable del día anterior.\n- Se pierde como máximo 1 día.\n- La restauración toma menos de 1 hora.\n\nTrazabilidad: RNF-05'

create_issue "RNF-06 · Compatibilidad con celular y tablet" "rnf,debe,fase-1,propuesto" $'El sistema debe funcionar en celular y en tablet.\n\nFuentes: A3 (P17), A2 (P30)\n\nCriterio de aceptación:\n- Se comprueba en un celular y en una tablet.\n- Funciona con pantallas desde 360 px de ancho.\n- La interfaz no falla en los dos dispositivos.\n\nTrazabilidad: RNF-06'

create_issue "RNF-07 · Uso del vocabulario de la organización" "rnf,deberia,fase-1,propuesto" $'El sistema debe usar el vocabulario de la organización (“panadero”, “pieza”, “nota de remisión”).\n\nFuentes: A4\n\nCriterio de aceptación:\n- Se revisa la interfaz con A1.\n- Se eliminan los términos rechazados.\n- La experiencia refleja el lenguaje del negocio.\n\nTrazabilidad: RNF-07'

create_issue "RNF-08 · Tiempo de respuesta" "rnf,deberia,fase-1,propuesto" $'El sistema debe guardar y consultar un pedido en menos de 2 segundos.\n\nFuentes: A2 (P28, P37)\n\nCriterio de aceptación:\n- 95 % de las operaciones cumplen con el tiempo máximo.\n- Se mide en un dispositivo de gama media.\n- La operación responde en el tiempo requerido.\n\nTrazabilidad: RNF-08'

create_issue "RNF-09 · Auditoría de cambios" "rnf,deberia,fase-1,propuesto" $'El sistema debe registrar el usuario, la fecha y la hora de cada cambio en pedidos, pagos e inventario.\n\nFuentes: Guía P46 (por validar)\n\nCriterio de aceptación:\n- Cada cambio queda registrado con usuario, fecha y hora.\n- Se evidencian los cambios en pedidos, pagos e inventario.\n- El registro es trazable y auditable.\n\nTrazabilidad: RNF-09'

create_issue "RNF-10 · Capacidad con 200 pedidos activos" "rnf,podria,fase-1,propuesto" $'El sistema debe mantener los tiempos de RNF-08 con hasta 200 pedidos activos.\n\nFuentes: A2 (10,000 piezas en temporada)\n\nCriterio de aceptación:\n- Se revalidan los tiempos de respuesta con 200 pedidos activos.\n- La operación sigue siendo estable.\n- El rendimiento no se degrada.\n\nTrazabilidad: RNF-10'

echo "== Asociando issues al proyecto =="
if [ -n "$PROJECT_NUMBER" ]; then
  for n in $(gh issue list --repo "$REPO" --state all --limit 200 --json number --jq '.[].number'); do
    gh project item-add "$PROJECT_NUMBER" --owner "$OWNER" --url "https://github.com/$REPO/issues/$n" >/dev/null 2>&1 || true
  done
fi

echo "== Resumen =="
echo "Repo: $REPO"
echo "Project: $PROJECT_TITLE"
echo "Milestones:"
echo " - v0.1"
echo " - v1.0"
echo " - Fase 2"
echo "Labels creados: rf, rnf, rn, debe, deberia, podria, fase-1, fase-2, pr-01..pr-07, propuesto, validado, cambio-solicitado"

echo "Hecho. Abre el repo en GitHub para revisar el Project y las issues."


