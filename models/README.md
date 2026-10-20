<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Piezas de GitHub | Libreta Raíz</title>
  <style>
    :root {
      --bg: #f4f8f8;
      --panel: #ffffff;
      --panel-strong: #f7fafb;
      --muted: #587072;
      --text: #132b31;
      --primary: #0b7a75;
      --primary-dark: #085d5a;
      --primary-soft: #dff6f4;
      --accent: #f0b429;
      --success: #1a8f61;
      --warning: #d9822b;
      --danger: #d85a5a;
      --border: #dfece9;
      --shadow: 0 18px 40px rgba(14, 55, 60, 0.08);
    }

    * { box-sizing: border-box; }

    body {
      margin: 0;
      font-family: Inter, "Segoe UI", sans-serif;
      background: linear-gradient(180deg, #f6f9f9 0%, #edf5f5 100%);
      color: var(--text);
    }

    .topbar {
      background: linear-gradient(135deg, var(--primary-dark), var(--primary));
      color: white;
      padding: 30px 22px 26px;
      box-shadow: 0 10px 25px rgba(11, 122, 117, 0.16);
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
    }

    .hero {
      display: flex;
      align-items: end;
      justify-content: space-between;
      gap: 20px;
      flex-wrap: wrap;
    }

    .hero h1 {
      font-size: clamp(2.1rem, 4vw, 3rem);
      margin: 0 0 8px;
      letter-spacing: -0.04em;
    }

    .hero p {
      margin: 0;
      color: rgba(255,255,255,0.82);
      font-size: 1rem;
      max-width: 720px;
    }

    .badge {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      background: rgba(255,255,255,0.08);
      padding: 8px 14px;
      border-radius: 999px;
      border: 1px solid rgba(255,255,255,0.16);
      font-size: 0.8rem;
      backdrop-filter: blur(10px);
    }

    .section {
      padding: 28px 22px;
    }

    .stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 18px;
      margin-top: 18px;
    }

    .stat-card {
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 18px;
      box-shadow: var(--shadow);
      padding: 20px;
    }

    .label {
      display: inline-block;
      font-size: 0.72rem;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: var(--muted);
      font-weight: 700;
      margin-bottom: 8px;
    }

    .stat-value {
      font-size: clamp(1.8rem, 3vw, 2.5rem);
      font-weight: 800;
      letter-spacing: -0.05em;
      margin: 0;
    }

    .stat-desc {
      margin: 8px 0 0;
      color: var(--muted);
      line-height: 1.5;
      font-size: 0.95rem;
    }

    .toolbar {
      display: flex;
      flex-wrap: wrap;
      gap: 12px;
      align-items: center;
      justify-content: space-between;
      margin: 18px 0 14px;
    }

    .filters {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }

    .filter-btn {
      border: 1px solid var(--border);
      background: #fff;
      color: var(--text);
      border-radius: 999px;
      padding: 9px 16px;
      cursor: pointer;
      font-weight: 600;
      transition: all 0.2s ease;
    }

    .filter-btn.active {
      background: var(--primary-soft);
      color: var(--primary-dark);
      border-color: rgba(11, 122, 117, 0.2);
      box-shadow: 0 12px 24px rgba(11, 122, 117, 0.08);
    }

    .search {
      min-width: min(100%, 260px);
      display: flex;
      align-items: center;
      gap: 8px;
      background: #fff;
      border: 1px solid var(--border);
      border-radius: 999px;
      padding: 10px 16px;
      box-shadow: 0 8px 18px rgba(19, 43, 49, 0.03);
    }

    .search input {
      border: 0;
      outline: none;
      width: 100%;
      font-size: 0.95rem;
      color: var(--text);
      background: transparent;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(290px, 1fr));
      gap: 18px;
      margin-top: 14px;
    }

    .card {
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 20px;
      box-shadow: var(--shadow);
      padding: 18px;
      display: flex;
      flex-direction: column;
      gap: 12px;
      transition: transform 0.18s ease, box-shadow 0.18s ease;
    }

    .card:hover {
      transform: translateY(-2px);
      box-shadow: 0 22px 40px rgba(19, 43, 49, 0.08);
    }

    .card.rf { border-top: 4px solid var(--success); }
    .card.rnf { border-top: 4px solid #4d82f7; }
    .card.rn { border-top: 4px solid var(--warning); }

    .card-head {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 10px;
    }

    .id {
      font-size: 1.05rem;
      font-weight: 800;
      letter-spacing: -0.03em;
      color: var(--text);
      margin: 0;
    }

    .chip {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      border-radius: 999px;
      padding: 7px 10px;
      font-size: 0.72rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.06em;
      white-space: nowrap;
    }

    .chip.debe { background: rgba(26, 143, 97, 0.1); color: var(--success); }
    .chip.deberia { background: rgba(217, 130, 43, 0.12); color: var(--warning); }
    .chip.podria { background: rgba(77, 130, 247, 0.12); color: #3b6edd; }
    .chip.rf { background: rgba(26, 143, 97, 0.08); color: var(--success); }
    .chip.rnf { background: rgba(77, 130, 247, 0.08); color: #3566d9; }
    .chip.rn { background: rgba(217, 130, 43, 0.12); color: var(--warning); }

    .title {
      margin: 0;
      font-size: 1.08rem;
      line-height: 1.4;
    }

    .desc {
      margin: 0;
      color: var(--muted);
      line-height: 1.6;
      font-size: 0.95rem;
    }

    .meta {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-top: auto;
    }

    .meta-pill {
      background: var(--panel-strong);
      border: 1px solid var(--border);
      color: var(--muted);
      border-radius: 10px;
      padding: 6px 10px;
      font-size: 0.72rem;
      font-weight: 600;
    }

    .empty {
      background: var(--panel);
      border: 1px dashed var(--border);
      border-radius: 18px;
      padding: 18px;
      color: var(--muted);
      text-align: center;
      font-weight: 600;
      margin-top: 12px;
    }

    footer {
      padding: 18px 22px 40px;
      color: var(--muted);
      text-align: center;
      font-size: 0.9rem;
    }

    @media (max-width: 700px) {
      .toolbar {
        align-items: stretch;
      }
      .search {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <header class="topbar">
    <div class="container hero">
      <div>
        <h1>Piezas de GitHub</h1>
        <p>Panel de requisitos del proyecto “Libreta Raíz digital” para la Panadería “Burritos”. Trazabilidad con issues, prioridades MoSCoW, procesos BPMN y validación con la organización.</p>
      </div>
      <div class="badge">ALQF · DRS v0.2</div>
    </div>
  </header>

  <main class="container section">
    <section class="stats">
      <article class="stat-card">
        <div class="label">Funcionales</div>
        <p class="stat-value" id="rfCount">0</p>
        <p class="stat-desc">Requisitos clave del producto y flujo de negocio.</p>
      </article>
      <article class="stat-card">
        <div class="label">No funcionales</div>
        <p class="stat-value" id="rnfCount">0</p>
        <p class="stat-desc">Criterios de calidad, usabilidad y auditoría.</p>
      </article>
      <article class="stat-card">
        <div class="label">Reglas de negocio</div>
        <p class="stat-value" id="rnCount">0</p>
        <p class="stat-desc">Condiciones del negocio y decisiones del cliente.</p>
      </article>
      <article class="stat-card">
        <div class="label">Procesos</div>
        <p class="stat-value">PR-01 a PR-07</p>
        <p class="stat-desc">Se vinculan directamente con cada requisito.</p>
      </article>
    </section>

    <div class="toolbar">
      <div class="filters" id="filters">
        <button class="filter-btn active" data-filter="all">Todos</button>
        <button class="filter-btn" data-filter="rf">RF</button>
        <button class="filter-btn" data-filter="rnf">RNF</button>
        <button class="filter-btn" data-filter="rn">RN</button>
        <button class="filter-btn" data-filter="debe">Debe</button>
        <button class="filter-btn" data-filter="deberia">Debería</button>
        <button class="filter-btn" data-filter="podria">Podría</button>
      </div>

      <label class="search" aria-label="Buscar requisito">
        <span>🔎</span>
        <input id="search" type="text" placeholder="Buscar RF-01, pedido, inventario..." />
      </label>
    </div>

    <section id="list" class="grid" aria-live="polite"></section>
  </main>

  <footer>Repositorio de requisitos · Equipo ALQF · Panadería “Burritos”</footer>

  <script>
    const REQS = [
      { id: 'RF-01', type: 'rf', priority: 'debe', title: 'Registrar pedido con cliente, piezas y fecha de entrega', desc: 'El sistema debe permitir registrar un pedido completo al momento de recibirlo y validar la información mínima requerida.', trace: 'PR-01 / #1, #2', phase: 'Fase 1' },
      { id: 'RF-02', type: 'rf', priority: 'debe', title: 'Registrar estado de pago', desc: 'Cada pedido debe indicar si está pagado, con anticipo o pendiente.', trace: 'PR-05 / #16, #18', phase: 'Fase 1' },
      { id: 'RF-03', type: 'rf', priority: 'debe', title: 'Registrar anticipo y saldo pendiente', desc: 'Se debe mantener el monto pagado, el anticipo y el saldo restante por cobrar.', trace: 'PR-05 / #16, #18', phase: 'Fase 1' },
      { id: 'RF-04', type: 'rf', priority: 'debe', title: 'Mostrar pedidos pendientes ordenados por fecha', desc: 'La lista de pedidos activos se presenta de la fecha más cercana a la más lejana.', trace: 'PR-01 / #2, #8', phase: 'Fase 1' },
      { id: 'RF-05', type: 'rf', priority: 'deberia', title: 'Cambiar el estado de un pedido', desc: 'El sistema debe permitir actualizar el estado del pedido con historial de cambios.', trace: 'PR-01, PR-03, PR-05 / #2, #8, #19', phase: 'Fase 1' },
      { id: 'RF-06', type: 'rf', priority: 'deberia', title: 'Calcular el total del pedido', desc: 'El precio total se obtiene con base en piezas y precio vigente.', trace: 'PR-01, PR-05 / #2, #17', phase: 'Fase 1' },
      { id: 'RF-07', type: 'rf', priority: 'debe', title: 'Registrar ventas del día y mostrar el total', desc: 'Debe existir control del cierre del día sin sumar manualmente.', trace: 'PR-05 / #17', phase: 'Fase 1' },
      { id: 'RF-08', type: 'rf', priority: 'deberia', title: 'Generar nota de remisión', desc: 'Cada entrega debe dejar un comprobante con folio, cliente, piezas y monto.', trace: 'PR-04, PR-05 / #15c, #19', phase: 'Fase 1' },
      { id: 'RF-09', type: 'rf', priority: 'debe', title: 'Mostrar los siete pasos de producción', desc: 'Debe visualizarse la secuencia principal del proceso productivo y el paso actual.', trace: 'PR-03 / #10 a #14a', phase: 'Fase 1' },
      { id: 'RF-10', type: 'rf', priority: 'deberia', title: 'Impedir saltarse pasos de producción', desc: 'Un paso no puede marcarse como completado si el anterior sigue pendiente.', trace: 'PR-03 / #11 a #14a', phase: 'Fase 1' },
      { id: 'RF-11', type: 'rf', priority: 'deberia', title: 'Configurar capacidad máxima por horneada', desc: 'Debe poder definirse la capacidad del horno por lote.', trace: 'PR-03 / #14a', phase: 'Fase 1' },
      { id: 'RF-12', type: 'rf', priority: 'deberia', title: 'Calcular número de horneadas necesarias', desc: 'Se calcula la cantidad de lotes necesarios según la capacidad configurada.', trace: 'PR-03 / #4b, #14a', phase: 'Fase 1' },
      { id: 'RF-13', type: 'rf', priority: 'deberia', title: 'Registrar horneadas con hora de inicio y fin', desc: 'Cada horneada debe estar asociada a su duración y validación temporal.', trace: 'PR-03 / #14a', phase: 'Fase 1' },
      { id: 'RF-14', type: 'rf', priority: 'deberia', title: 'Registrar mermas con causa', desc: 'Las pérdidas por clima, quemado o daño en transporte deben registrarse.', trace: 'PR-06 / #12x a #12z, #15x a #15y', phase: 'Fase 1' },
      { id: 'RF-15', type: 'rf', priority: 'deberia', title: 'Registrar compras de insumos', desc: 'El sistema debe registrar compras de harina, panela, levadura y leña.', trace: 'PR-02 / #5, #6', phase: 'Fase 1' },
      { id: 'RF-16', type: 'rf', priority: 'deberia', title: 'Avisar cuando la existencia baja del mínimo', desc: 'Debe alertarse al usuario cuando un insumo está por debajo del límite configurado.', trace: 'PR-02 / #7', phase: 'Fase 1' },
      { id: 'RF-17', type: 'rf', priority: 'podria', title: 'Mostrar precio y disponibilidad antes de acudir', desc: 'El comprador puede consultar datos del producto desde el celular.', trace: 'PR-07 / sin elemento BPMN', phase: 'Fase 2' },
      { id: 'RF-18', type: 'rf', priority: 'podria', title: 'Permitir pedido en línea', desc: 'El comprador puede enviar una solicitud de pedido y ésta aparece en el sistema del productor.', trace: 'PR-07 / flujo de mensaje hacia #1', phase: 'Fase 2' },
      { id: 'RF-19', type: 'rf', priority: 'podria', title: 'Enviar confirmación al comprador', desc: 'Cuando se registra el pedido, el comprador recibe la confirmación.', trace: 'PR-07 / flujo de mensaje desde #19', phase: 'Fase 2' },
      { id: 'RF-20', type: 'rf', priority: 'podria', title: 'Elegir punto de entrega dentro de Tlaxiaco', desc: 'El comprador elige de una lista configurada por el productor.', trace: 'PR-07, PR-04 / #15b, #15c', phase: 'Fase 2' },
      { id: 'RF-21', type: 'rf', priority: 'podria', title: 'Mostrar foto, nombre y comunidad con autorización', desc: 'Se informa sobre el origen artesanal si hay consentimiento para mostrar datos.', trace: 'PR-07 / sin elemento BPMN', phase: 'Fase 2' },
      { id: 'RF-22', type: 'rf', priority: 'podria', title: 'Indicar que la organización confirmó el origen artesanal', desc: 'Solo se muestra la validación cuando exista confirmación registrada.', trace: 'PR-07 / sin elemento BPMN', phase: 'Fase 2' },

      { id: 'RNF-01', type: 'rnf', priority: 'debe', title: 'Texto grande y botones accesibles', desc: 'Debe existir una interfaz legible, con textos y botones adecuados para uso móvil.', trace: 'PR-01, PR-05 / #2, #17, #18', phase: 'Transversal' },
      { id: 'RNF-02', type: 'rnf', priority: 'debe', title: 'Registrar pedido en menos de 2 minutos', desc: 'El flujo de alta de pedido debe completarse sin capacitación previa en tiempo mínimo.', trace: 'PR-01 / #1, #2', phase: 'Transversal' },
      { id: 'RNF-03', type: 'rnf', priority: 'debe', title: 'Operar sin internet y sincronizar luego', desc: 'La app debe funcionar en modo desconectado y sincronizar al reconectarse.', trace: 'PR-01, PR-05 / #2, #17', phase: 'Transversal' },
      { id: 'RNF-04', type: 'rnf', priority: 'debe', title: 'Restringir ventas y cuentas al propietario', desc: 'Solo el usuario con rol de propietario puede ver pantallas de ventas y cuentas.', trace: 'PR-05, PR-02 / #17, #18, #21', phase: 'Transversal' },
      { id: 'RNF-05', type: 'rnf', priority: 'debe', title: 'Respaldo automático diario', desc: 'Los datos deben respaldarse y restaurarse sin perder más de un día.', trace: 'Todos / datos de #2, #6, #17, #18', phase: 'Transversal' },
      { id: 'RNF-06', type: 'rnf', priority: 'debe', title: 'Compatibilidad con celular y tablet', desc: 'Debe funcionar en dispositivos móviles con tamaños mínimos de pantalla.', trace: 'Todos / Carriles Administración y Producción', phase: 'Transversal' },
      { id: 'RNF-07', type: 'rnf', priority: 'deberia', title: 'Usar vocabulario de la organización', desc: 'La interfaz debe emplear términos como “panadero”, “pieza” y “nota de remisión”.', trace: 'PR-01 a PR-06 / nombres de tareas del BPMN', phase: 'Transversal' },
      { id: 'RNF-08', type: 'rnf', priority: 'deberia', title: 'Responder en menos de 2 segundos', desc: 'Guardar y consultar pedidos debe cumplir con tiempos de respuesta bajo.', trace: 'PR-01, PR-05 / #2, #17', phase: 'Transversal' },
      { id: 'RNF-09', type: 'rnf', priority: 'deberia', title: 'Auditoría de cambios', desc: 'Cada modificación debe quedar asociada a usuario, fecha y hora.', trace: 'PR-01, PR-02, PR-05 / #2, #6, #18', phase: 'Transversal' },
      { id: 'RNF-10', type: 'rnf', priority: 'podria', title: 'Mantener tiempos con 200 pedidos activos', desc: 'La respuesta debe mantenerse estable bajo carga operativa de 200 pedidos.', trace: 'PR-01, PR-03 / #2, #14a', phase: 'Transversal' },

      { id: 'RN-01', type: 'rn', priority: 'debe', title: 'Precio por pieza configurable', desc: 'El precio puede variar según volumen y esquema de mayoreo.', trace: 'A2 (P22), A1', phase: 'Reglas de negocio' },
      { id: 'RN-02', type: 'rn', priority: 'debe', title: 'Saldo pendiente = total − anticipo', desc: 'Los saldos deben calcularse de forma consistente.', trace: 'A1, A2', phase: 'Reglas de negocio' },
      { id: 'RN-03', type: 'rn', priority: 'debe', title: 'Los pasos de producción no pueden saltarse', desc: 'La producción sigue una secuencia obligatoria.', trace: 'A1 (BPMN #11 a #14a)', phase: 'Reglas de negocio' },
      { id: 'RN-04', type: 'rn', priority: 'debe', title: 'Fermentación y horneado según tiempos estimados', desc: 'La fermentación dura entre 1 y 2 horas y el horneado dura entre 15 y 20 minutos.', trace: 'A1 (BPMN #12, #14a)', phase: 'Reglas de negocio' },
      { id: 'RN-05', type: 'rn', priority: 'debe', title: 'Ventas y cuentas solo para propietario', desc: 'El acceso a información financiera está restringido.', trace: 'A2 (P34)', phase: 'Reglas de negocio' },
      { id: 'RN-06', type: 'rn', priority: 'debe', title: 'Cada pedido tiene destino', desc: 'La clasificación del pedido determina empacado, entrega y flujo operativo.', trace: 'A1 (BPMN #3, #15b)', phase: 'Reglas de negocio' },
      { id: 'RN-07', type: 'rn', priority: 'debe', title: 'Pago puede combinar efectivo, trueque y saldo pendiente', desc: 'La liquidación de un pedido puede combinar varias formas de pago.', trace: 'A1 (BPMN #16)', phase: 'Reglas de negocio' }
    ];

    const list = document.getElementById('list');
    const searchInput = document.getElementById('search');
    const filters = document.getElementById('filters');

    const rfCount = document.getElementById('rfCount');
    const rnfCount = document.getElementById('rnfCount');
    const rnCount = document.getElementById('rnCount');

    rfCount.textContent = REQS.filter(r => r.type === 'rf').length;
    rnfCount.textContent = REQS.filter(r => r.type === 'rnf').length;
    rnCount.textContent = REQS.filter(r => r.type === 'rn').length;

    const render = (items) => {
      if (!items.length) {
        list.innerHTML = '<div class="empty">No se encontraron requisitos con ese filtro o búsqueda.</div>';
        return;
      }

      list.innerHTML = items.map(item => {
        const chipClass = item.priority;
        const typeClass = item.type;

        return `
          <article class="card ${item.type}">
            <div class="card-head">
              <h2 class="id">${item.id}</h2>
              <span class="chip ${chipClass}">${item.priority}</span>
            </div>
            <h3 class="title">${item.title}</h3>
            <p class="desc">${item.desc}</p>
            <div class="meta">
              <span class="meta-pill">${item.phase}</span>
              <span class="meta-pill">${item.type.toUpperCase()}</span>
              <span class="meta-pill">${item.trace}</span>
            </div>
          </article>
        `;
      }).join('');
    };

    const apply = () => {
      const active = filters.querySelector('.filter-btn.active')?.dataset.filter || 'all';
      const query = searchInput.value.trim().toLowerCase();

      let items = REQS.filter(item => {
        if (active === 'all') return true;
        if (active === 'debe' || active === 'deberia' || active === 'podria') return item.priority === active;
        return item.type === active;
      });

      if (query) {
        items = items.filter(item => [
          item.id,
          item.title,
          item.desc,
          item.phase,
          item.trace,
          item.type,
          item.priority
        ].join(' ').toLowerCase().includes(query));
      }

      render(items);
    };

    filters.addEventListener('click', (event) => {
      if (!event.target.matches('button')) return;
      filters.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
      event.target.classList.add('active');
      apply();
    });

    searchInput.addEventListener('input', apply);
    render(REQS);
  </script>
</body>
</html>

""