<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    rodadoForm.jsp
    Puede usarse:
      (a) Incluido dentro del modal de rodadoPage.jsp  → <jsp:include page="rodadoForm.jsp"/>
      (b) Como página standalone → visita directamente la URL
--%>

<%-- ── Detectar si se renderiza standalone (sin topbar ya inyectado) ── --%>
<%
    boolean isStandalone = (request.getAttribute("_embedded") == null);
%>

<% if (isStandalone) { %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Rodado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<% } %>

<style>
    :root {
        --primary:      #1a1f36;
        --accent:       #3b6ef8;
        --accent-light: #e8eeff;
        --success:      #27b08b;
        --surface:      #f4f6fb;
        --card-bg:      #ffffff;
        --text-main:    #1a1f36;
        --text-muted:   #7b8299;
        --border:       #e4e8f4;
        --radius:       14px;
        --shadow-md:    0 8px 32px rgba(26,31,54,.13);
    }

    /* ── Standalone wrapper ─────────────────────── */
    .form-standalone-wrap {
        font-family: 'DM Sans', sans-serif;
        min-height: 100vh;
        background: var(--surface);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 2rem 1rem;
    }
    .form-standalone-inner {
        width: 100%;
        max-width: 780px;
    }
    .form-standalone-header {
        text-align: center;
        margin-bottom: 1.5rem;
    }
    .form-standalone-header h1 {
        font-family: 'Syne', sans-serif;
        font-size: 1.9rem;
        font-weight: 800;
        color: var(--primary);
        margin: 0;
    }
    .form-standalone-header p {
        color: var(--text-muted);
        font-size: .875rem;
        margin-top: .3rem;
    }

    /* ── Card ───────────────────────────────────── */
    .rodado-form-card {
        background: var(--card-bg);
        border-radius: var(--radius);
        border: 1px solid var(--border);
        box-shadow: var(--shadow-md);
        overflow: hidden;
    }
    .rodado-form-card .card-section-header {
        background: var(--surface);
        border-bottom: 1px solid var(--border);
        padding: .75rem 1.5rem;
        display: flex;
        align-items: center;
        gap: .5rem;
        font-size: .75rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: .1em;
        color: var(--text-muted);
    }
    .rodado-form-card .card-section-header i {
        color: var(--accent);
        font-size: .95rem;
    }
    .rodado-form-card .card-body-inner {
        padding: 1.5rem;
    }

    /* ── Form controls ──────────────────────────── */
    .form-label-custom {
        font-size: .8rem;
        font-weight: 600;
        color: var(--text-muted);
        text-transform: uppercase;
        letter-spacing: .06em;
        margin-bottom: .4rem;
        display: block;
    }
    .form-control-custom,
    .form-select-custom {
        font-family: 'DM Sans', sans-serif;
        font-size: .9rem;
        color: var(--text-main);
        background: var(--surface);
        border: 1.5px solid var(--border);
        border-radius: 10px;
        padding: .6rem .95rem;
        width: 100%;
        transition: border-color .2s, box-shadow .2s, background .2s;
        appearance: none;
        -webkit-appearance: none;
    }
    .form-control-custom:focus,
    .form-select-custom:focus {
        outline: none;
        border-color: var(--accent);
        box-shadow: 0 0 0 3.5px rgba(59,110,248,.14);
        background: #fff;
    }
    .form-control-custom::placeholder { color: var(--border); }

    /* Select arrow */
    .select-wrap {
        position: relative;
    }
    .select-wrap::after {
        content: '\F282';
        font-family: 'Bootstrap-Icons';
        position: absolute;
        right: .9rem;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-muted);
        pointer-events: none;
        font-size: .9rem;
    }
    .select-wrap select { padding-right: 2.2rem; }

    /* Input with icon prefix */
    .input-icon-wrap { position: relative; }
    .input-icon-wrap i {
        position: absolute;
        left: .9rem;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-muted);
        font-size: .95rem;
        pointer-events: none;
    }
    .input-icon-wrap input { padding-left: 2.4rem; }

    /* Field group mb */
    .field-group { margin-bottom: 1.1rem; }
    .field-group:last-child { margin-bottom: 0; }

    /* ── Submit button ──────────────────────────── */
    .btn-guardar {
        background: linear-gradient(135deg, #27b08b, #1d8c6e);
        color: #fff;
        border: none;
        border-radius: 10px;
        padding: .8rem 1.5rem;
        font-family: 'DM Sans', sans-serif;
        font-weight: 700;
        font-size: 1rem;
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: .6rem;
        cursor: pointer;
        box-shadow: 0 4px 14px rgba(39,176,139,.35);
        transition: box-shadow .2s, transform .2s;
        margin-top: .5rem;
    }
    .btn-guardar:hover {
        box-shadow: 0 7px 22px rgba(39,176,139,.5);
        transform: translateY(-1px);
    }
    .btn-guardar:active { transform: translateY(0); }

    /* ── Back link (standalone) ─────────────────── */
    .back-link {
        display: inline-flex;
        align-items: center;
        gap: .4rem;
        color: var(--text-muted);
        font-size: .85rem;
        text-decoration: none;
        margin-bottom: 1.25rem;
        transition: color .15s;
    }
    .back-link:hover { color: var(--accent); }

    /* ── Divider ────────────────────────────────── */
    .form-divider {
        border: none;
        border-top: 1px solid var(--border);
        margin: .25rem 0 1.25rem;
    }

    /* ── Fade-up ────────────────────────────────── */
    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(14px); }
        to   { opacity: 1; transform: translateY(0); }
    }
    .form-standalone-inner { animation: fadeUp .4s ease both; }
</style>

<% if (isStandalone) { %>
<body style="margin:0;padding:0;">
<div class="form-standalone-wrap">
    <div class="form-standalone-inner">
        <a href="<%= request.getContextPath() %>/rodado/rodadoPage.jsp" class="back-link">
            <i class="bi bi-arrow-left"></i> Volver al listado
        </a>
        <div class="form-standalone-header">
            <h1><i class="bi bi-truck" style="color:#3b6ef8;"></i> Nuevo Rodado</h1>
            <p>Completá los datos del vehículo a registrar en el sistema.</p>
        </div>
<% } %>

<!-- ════════════════════════════════════════════════════
     FORMULARIO
     ════════════════════════════════════════════════════ -->
<div class="rodado-form-card">

    <form id="formRodado"
          action="<%= request.getContextPath() %>/RodadoServlet"
          method="post">
        <input type="hidden" name="accion" value="guardar">

        <!-- ── Sección 1: Clasificación ───────────────── -->
        <div class="card-section-header">
            <i class="bi bi-tags-fill"></i> Clasificación del vehículo
        </div>
        <div class="card-body-inner">
            <div class="row g-3">

                <!-- Tipo de Caja -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="tipocaja">Tipo de Caja</label>
                        <div class="select-wrap">
                            <select class="form-select-custom" id="tipocaja" name="tipocaja" required>
                                <option value="" disabled selected>Seleccioná...</option>
                                <option value="MANUAL">Manual</option>
                                <option value="AUTOMATICA">Automática</option>
                                <option value="CVT">CVT</option>
                                <option value="SECUENCIAL">Secuencial</option>
                                <option value="DOBLE_EMBRAGUE">Doble Embrague (DSG)</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Tipo de Vehículo -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="tipo">Tipo de Vehículo</label>
                        <div class="select-wrap">
                            <select class="form-select-custom" id="tipo" name="tipo" required>
                                <option value="" disabled selected>Seleccioná...</option>
                                <option value="AUTO">Auto</option>
                                <option value="CAMIONETA">Camioneta</option>
                                <option value="MOTO">Moto</option>
                                <option value="FURGON">Furgón</option>
                                <option value="UTILITARIO">Utilitario</option>
                                <option value="SUV">SUV</option>
                                <option value="PICKUP">Pick-up</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Tipo de Consumo -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="tipoconsumo">Tipo de Consumo</label>
                        <div class="select-wrap">
                            <select class="form-select-custom" id="tipoconsumo" name="tipoconsumo" required>
                                <option value="" disabled selected>Seleccioná...</option>
                                <option value="NAFTA">Nafta</option>
                                <option value="DIESEL">Diesel</option>
                                <option value="GNC">GNC</option>
                                <option value="ELECTRICO">Eléctrico</option>
                                <option value="HIBRIDO">Híbrido</option>
                                <option value="NAFTA_GNC">Nafta / GNC</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Puertas -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="puertas">Cantidad de Puertas</label>
                        <div class="select-wrap">
                            <select class="form-select-custom" id="puertas" name="puertas" required>
                                <option value="" disabled selected>Seleccioná...</option>
                                <option value="2">2 puertas</option>
                                <option value="3">3 puertas</option>
                                <option value="4">4 puertas</option>
                                <option value="5">5 puertas</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Tipo de Rodado -->
                <div class="col-12">
                    <div class="field-group">
                        <label class="form-label-custom" for="tipoderodado">Tipo de Rodado</label>
                        <div class="select-wrap">
                            <select class="form-select-custom" id="tipoderodado" name="tipoderodado" required>
                                <option value="" disabled selected>Seleccioná...</option>
                                <option value="SEDAN">Sedán</option>
                                <option value="HATCHBACK">Hatchback</option>
                                <option value="COUPE">Coupé</option>
                                <option value="CABRIO">Cabriolet / Convertible</option>
                                <option value="MONOVOLUMEN">Monovolumen</option>
                                <option value="SUV">SUV / Crossover</option>
                                <option value="PICKUP">Pick-up</option>
                                <option value="FURGON">Furgón</option>
                                <option value="MOTO_STANDARD">Moto Standard</option>
                                <option value="MOTO_DEPORTIVA">Moto Deportiva</option>
                                <option value="MOTO_CRUISER">Moto Cruiser</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- /card-body-inner -->

        <!-- ── Sección 2: Datos técnicos ─────────────── -->
        <div class="card-section-header">
            <i class="bi bi-gear-fill"></i> Datos técnicos
        </div>
        <div class="card-body-inner">
            <div class="row g-3">

                <!-- Patente -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="patente">Patente</label>
                        <div class="input-icon-wrap">
                            <i class="bi bi-card-text"></i>
                            <input type="text"
                                   class="form-control-custom"
                                   id="patente"
                                   name="patente"
                                   placeholder="Ej: AB 123 CD"
                                   maxlength="10"
                                   style="text-transform:uppercase;"
                                   required>
                        </div>
                    </div>
                </div>

                <!-- Motor Rodaje -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="motorrodaje">Motor / Rodaje (km)</label>
                        <div class="input-icon-wrap">
                            <i class="bi bi-speedometer2"></i>
                            <input type="number"
                                   class="form-control-custom"
                                   id="motorrodaje"
                                   name="motorrodaje"
                                   placeholder="Ej: 45000"
                                   min="0"
                                   required>
                        </div>
                    </div>
                </div>

                <!-- Motor (cilindrada) -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="motor">Motor (cilindrada)</label>
                        <div class="input-icon-wrap">
                            <i class="bi bi-cpu"></i>
                            <input type="text"
                                   class="form-control-custom"
                                   id="motor"
                                   name="motor"
                                   placeholder="Ej: 1.6 TDI, 2.0 TSI"
                                   required>
                        </div>
                    </div>
                </div>

                <!-- Color -->
                <div class="col-12 col-md-6">
                    <div class="field-group">
                        <label class="form-label-custom" for="color">Color</label>
                        <div class="input-icon-wrap">
                            <i class="bi bi-palette-fill"></i>
                            <input type="text"
                                   class="form-control-custom"
                                   id="color"
                                   name="color"
                                   placeholder="Ej: Blanco, Negro, Gris Plata"
                                   required>
                        </div>
                    </div>
                </div>

                <!-- Baúl -->
                <div class="col-12">
                    <div class="field-group">
                        <label class="form-label-custom" for="baul">Capacidad de Baúl (litros)</label>
                        <div class="input-icon-wrap">
                            <i class="bi bi-briefcase-fill"></i>
                            <input type="number"
                                   class="form-control-custom"
                                   id="baul"
                                   name="baul"
                                   placeholder="Ej: 390"
                                   min="0"
                                   required>
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- /card-body-inner -->

        <!-- ── Footer / Botón ─────────────────────────── -->
        <div class="card-body-inner" style="padding-top:0;">
            <hr class="form-divider">
            <a href="<%= request.getContextPath() %>/rodado/agregarRodado.js" class="back-link">
<button type="submit"
                    class="btn-guardar btn btn-success w-100"
                    id="btn-confirmar">
                <i class="bi bi-floppy2-fill"></i>
                Guardar Rodado
            </button>
        </a>
        </div>

    </form>
</div><!-- /rodado-form-card -->

<% if (isStandalone) { %>
    </div><!-- /form-standalone-inner -->
</div><!-- /form-standalone-wrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/agregarRodado.js"></script>
</body>
</html>
<% } %>
