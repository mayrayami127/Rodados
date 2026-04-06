<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@page import="com.sample.core.domain.Rodado"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Rodados</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <!-- SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

    <style>
        :root {
            --primary:       #1a1f36;
            --accent:        #3b6ef8;
            --accent-light:  #e8eeff;
            --danger:        #e84545;
            --success:       #27b08b;
            --surface:       #f4f6fb;
            --card-bg:       #ffffff;
            --text-main:     #1a1f36;
            --text-muted:    #7b8299;
            --border:        #e4e8f4;
            --shadow-sm:     0 2px 8px rgba(59,110,248,.08);
            --shadow-md:     0 8px 32px rgba(26,31,54,.13);
            --radius:        14px;
        }

        *, *::before, *::after { box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--surface);
            color: var(--text-main);
            min-height: 100vh;
        }

        /* ── Sidebar strip ──────────────────────────────── */
        .sidebar-strip {
            position: fixed;
            left: 0; top: 0; bottom: 0;
            width: 5px;
            background: linear-gradient(180deg, var(--accent) 0%, #7c3aed 100%);
            z-index: 1000;
        }

        /* ── Topbar ─────────────────────────────────────── */
        .topbar {
            background: var(--card-bg);
            border-bottom: 1px solid var(--border);
            padding: 0 2rem;
            height: 64px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 900;
            box-shadow: var(--shadow-sm);
        }
        .topbar-brand {
            font-family: 'Syne', sans-serif;
            font-weight: 800;
            font-size: 1.25rem;
            color: var(--primary);
            letter-spacing: -.5px;
            display: flex;
            align-items: center;
            gap: .6rem;
            text-decoration: none;
        }
        .topbar-brand .brand-dot {
            width: 10px; height: 10px;
            border-radius: 50%;
            background: var(--accent);
        }
        .topbar-right {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        .topbar-user {
            display: flex;
            align-items: center;
            gap: .5rem;
            font-size: .875rem;
            color: var(--text-muted);
        }
        .user-avatar {
            width: 36px; height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--accent), #7c3aed);
            display: flex; align-items: center; justify-content: center;
            color: #fff;
            font-weight: 700;
            font-size: .8rem;
        }

        /* ── Main wrapper ───────────────────────────────── */
        .main-wrapper {
            padding: 2rem 2rem 2rem 2.5rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        /* ── Page header ────────────────────────────────── */
        .page-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            margin-bottom: 1.75rem;
            flex-wrap: wrap;
            gap: 1rem;
        }
        .page-header-left h1 {
            font-family: 'Syne', sans-serif;
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary);
            margin: 0;
            line-height: 1;
        }
        .page-header-left .breadcrumb-text {
            font-size: .8rem;
            color: var(--text-muted);
            margin-top: .35rem;
        }
        .breadcrumb-text i { margin-right: .25rem; }

        /* ── Stats row ──────────────────────────────────── */
        .stat-card {
            background: var(--card-bg);
            border-radius: var(--radius);
            border: 1px solid var(--border);
            padding: 1.25rem 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            box-shadow: var(--shadow-sm);
            transition: transform .2s, box-shadow .2s;
        }
        .stat-card:hover { transform: translateY(-2px); box-shadow: var(--shadow-md); }
        .stat-icon {
            width: 48px; height: 48px;
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.4rem;
            flex-shrink: 0;
        }
        .stat-icon.blue  { background: var(--accent-light); color: var(--accent); }
        .stat-icon.green { background: #e6faf4; color: var(--success); }
        .stat-icon.red   { background: #ffeaea; color: var(--danger); }
        .stat-icon.purple{ background: #f0ebff; color: #7c3aed; }
        .stat-value { font-family: 'Syne', sans-serif; font-size: 1.6rem; font-weight: 800; line-height: 1; }
        .stat-label { font-size: .78rem; color: var(--text-muted); margin-top: .2rem; }

        /* ── Table card ─────────────────────────────────── */
        .table-card {
            background: var(--card-bg);
            border-radius: var(--radius);
            border: 1px solid var(--border);
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }
        .table-card-header {
            padding: 1.25rem 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid var(--border);
            flex-wrap: wrap;
            gap: .75rem;
        }
        .table-card-title {
            font-family: 'Syne', sans-serif;
            font-weight: 700;
            font-size: 1.05rem;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: .5rem;
        }
        .table-card-title i { color: var(--accent); }

        /* ── Search input ───────────────────────────────── */
        .search-input-wrap { position: relative; }
        .search-input-wrap i {
            position: absolute;
            left: .875rem; top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: .9rem;
        }
        .search-input {
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: .45rem .875rem .45rem 2.2rem;
            font-size: .85rem;
            font-family: 'DM Sans', sans-serif;
            width: 220px;
            background: var(--surface);
            color: var(--text-main);
            transition: border-color .2s, box-shadow .2s;
        }
        .search-input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(59,110,248,.12);
            background: #fff;
        }

        /* ── Table ──────────────────────────────────────── */
        .rodados-table { margin: 0; font-size: .875rem; }
        .rodados-table thead tr {
            background: var(--surface);
        }
        .rodados-table thead th {
            color: var(--text-muted);
            font-weight: 600;
            font-size: .75rem;
            text-transform: uppercase;
            letter-spacing: .07em;
            border: none;
            padding: .875rem 1rem;
            white-space: nowrap;
        }
        .rodados-table tbody tr {
            border-bottom: 1px solid var(--border);
            transition: background .15s;
        }
        .rodados-table tbody tr:hover { background: var(--accent-light); }
        .rodados-table tbody td {
            padding: .875rem 1rem;
            vertical-align: middle;
            border: none;
            color: var(--text-main);
        }
        .rodados-table tbody tr:last-child { border-bottom: none; }

        /* ID badge */
        .id-badge {
            background: var(--accent-light);
            color: var(--accent);
            font-weight: 700;
            font-size: .78rem;
            border-radius: 6px;
            padding: .2rem .55rem;
            display: inline-block;
        }

        /* Patente badge */
        .patente-badge {
            font-family: 'Syne', sans-serif;
            font-weight: 700;
            font-size: .82rem;
            background: var(--primary);
            color: #fff;
            border-radius: 6px;
            padding: .25rem .65rem;
            letter-spacing: .08em;
        }

        /* Color dot */
        .color-dot {
            width: 14px; height: 14px;
            border-radius: 50%;
            display: inline-block;
            border: 2px solid rgba(0,0,0,.1);
            vertical-align: middle;
            margin-right: .4rem;
        }

        /* ── Action buttons ─────────────────────────────── */
        .btn-action {
            border: none;
            border-radius: 8px;
            padding: .35rem .7rem;
            font-size: .8rem;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: .3rem;
            transition: opacity .15s, transform .15s;
            text-decoration: none;
        }
        .btn-action:hover { opacity: .85; transform: translateY(-1px); }
        .btn-edit  { background: var(--accent-light); color: var(--accent); }
        .btn-delete{ background: #ffeaea; color: var(--danger); }

        /* ── Primary button ─────────────────────────────── */
        .btn-primary-custom {
            background: linear-gradient(135deg, var(--accent), #5a8aff);
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: .6rem 1.4rem;
            font-family: 'DM Sans', sans-serif;
            font-weight: 600;
            font-size: .9rem;
            display: inline-flex;
            align-items: center;
            gap: .5rem;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(59,110,248,.35);
            transition: box-shadow .2s, transform .2s;
        }
        .btn-primary-custom:hover {
            box-shadow: 0 6px 20px rgba(59,110,248,.5);
            transform: translateY(-1px);
        }

        /* ── Empty state ────────────────────────────────── */
        .empty-state {
            padding: 3.5rem 1rem;
            text-align: center;
        }
        .empty-state i { font-size: 3rem; color: var(--border); }
        .empty-state p { color: var(--text-muted); margin-top: .75rem; font-size: .9rem; }

        /* ── Modal ──────────────────────────────────────── */
        .modal-content {
            border: none;
            border-radius: var(--radius);
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }
        .modal-header {
            background: linear-gradient(135deg, var(--primary), #2d3566);
            color: #fff;
            border: none;
            padding: 1.25rem 1.75rem;
        }
        .modal-header .modal-title {
            font-family: 'Syne', sans-serif;
            font-weight: 800;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: .6rem;
        }
        .modal-header .btn-close {
            filter: invert(1) brightness(2);
            opacity: .7;
        }
        .modal-header .btn-close:hover { opacity: 1; }
        .modal-body { padding: 1.75rem; background: var(--surface); }

        /* ── Scrollbar ──────────────────────────────────── */
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 99px; }

        /* ── Responsive ─────────────────────────────────── */
        @media (max-width: 768px) {
            .main-wrapper { padding: 1rem 1rem 1rem 1.25rem; }
            .page-header h1 { font-size: 1.5rem; }
            .search-input { width: 160px; }
        }

        /* ── Fade-in animation ──────────────────────────── */
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .fade-up { animation: fadeUp .4s ease both; }
        .fade-up:nth-child(2) { animation-delay: .07s; }
        .fade-up:nth-child(3) { animation-delay: .14s; }
        .fade-up:nth-child(4) { animation-delay: .21s; }
    </style>
</head>
<body>

<!-- Sidebar accent strip -->
<div class="sidebar-strip"></div>

<!-- ── Topbar ───────────────────────────────────────────── -->
<nav class="topbar">
    <a href="#" class="topbar-brand">
        <div class="brand-dot"></div>
        FleetCore
    </a>
    <div class="topbar-right">
        <div class="topbar-user">
            <div class="user-avatar">AD</div>
            <span class="d-none d-sm-inline">Admin</span>
        </div>
    </div>
</nav>

<!-- ── Main ─────────────────────────────────────────────── -->
<div class="main-wrapper">

    <!-- Page header -->
    <div class="page-header fade-up">
        <div class="page-header-left">
            <div class="breadcrumb-text">
                <i class="bi bi-house-fill"></i> Inicio &rsaquo; Rodados
            </div>
            <h1>Gestión de Rodados</h1>
        </div>
        <button class="btn-primary-custom" data-bs-toggle="modal" data-bs-target="#modalRodado">
            <i class="bi bi-plus-lg"></i> Nuevo Rodado
        </button>
    </div>

    <!-- Stats -->
    <div class="row g-3 mb-4">
        <div class="col-6 col-md-3 fade-up">
            <div class="stat-card">
                <div class="stat-icon blue"><i class="bi bi-truck"></i></div>
                <div>
                    <div class="stat-value" id="stat-total">—</div>
                    <div class="stat-label">Total Rodados</div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3 fade-up">
            <div class="stat-card">
                <div class="stat-icon green"><i class="bi bi-check-circle"></i></div>
                <div>
                    <div class="stat-value" id="stat-active">—</div>
                    <div class="stat-label">Activos</div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3 fade-up">
            <div class="stat-card">
                <div class="stat-icon purple"><i class="bi bi-fuel-pump"></i></div>
                <div>
                    <div class="stat-value" id="stat-types">—</div>
                    <div class="stat-label">Tipos de Rodado</div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3 fade-up">
            <div class="stat-card">
                <div class="stat-icon red"><i class="bi bi-exclamation-triangle"></i></div>
                <div>
                    <div class="stat-value" id="stat-pending">—</div>
                    <div class="stat-label">Pendientes</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Table card -->
    <div class="table-card fade-up">
        <div class="table-card-header">
            <div class="table-card-title">
                <i class="bi bi-table"></i> Listado de Rodados
            </div>
            <div class="search-input-wrap">
                <i class="bi bi-search"></i>
                <input type="text" class="search-input" id="tableSearch" placeholder="Buscar rodado...">
            </div>
        </div>

        <div class="table-responsive">
            <table class="table rodados-table table-hover" id="rodadosTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo de Caja</th>
                        <th>Tipo</th>
                        <th>Consumo</th>
                        <th>Puertas</th>
                        <th>T. Rodado</th>
                        <th>Patente</th>
                        <th>Motor</th>
                        <th>Color</th>
                        <th>Baúl</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        java.util.List<?> rodados = (java.util.List<?>) request.getAttribute("rodado");
                        if (rodados == null || rodados.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="11">
                            <div class="empty-state">
                                <i class="bi bi-inbox"></i>
                                <p>No hay rodados registrados aún.<br>¡Agregá el primero con el botón de arriba!</p>
                            </div>
                        </td>
                    </tr>
                    <%
                        } else {
                            for (Object item : rodados) {
                                // Acceso via reflection para compatibilidad con cualquier clase de modelo
                                Class<?> cls = item.getClass();
                                String id         = safeGet(cls, item, "getId");
                                String tipoCaja   = safeGet(cls, item, "getTipocaja");
                                String tipo       = safeGet(cls, item, "getTipo");
                                String consumo    = safeGet(cls, item, "getTipoconsumo");
                                String puertas    = safeGet(cls, item, "getPuertas");
                                String tipoRodado = safeGet(cls, item, "getTipoderodado");
                                String patente    = safeGet(cls, item, "getPatente");
                                String motor      = safeGet(cls, item, "getMotor");
                                String color      = safeGet(cls, item, "getColor");
                                String baul       = safeGet(cls, item, "getBaul");
                    %>
                    <tr>
                        <td><span class="id-badge"><%= id %></span></td>
                        <td><%= tipoCaja %></td>
                        <td><%= tipo %></td>
                        <td><i class="bi bi-fuel-pump text-muted me-1"></i><%= consumo %></td>
                        <td><%= puertas %></td>
                        <td><%= tipoRodado %></td>
                        <td><span class="patente-badge"><%= patente %></span></td>
                        <td><%= motor %></td>
                        <td>
                            <span class="color-dot" style="background:<%= color.toLowerCase() %>"></span>
                            <%= color %>
                        </td>
                        <td><i class="bi bi-briefcase text-muted me-1"></i><%= baul %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/RodadoServlet?accion=editar&id=<%= id %>"
                               class="btn-action btn-edit" title="Editar">
                                <i class="bi bi-pencil-fill"></i> Editar
                            </a>
                            <button class="btn-action btn-delete ms-1"
                                    onclick="confirmarEliminar('<%= id %>')"
                                    title="Eliminar">
                                <i class="bi bi-trash3-fill"></i> Eliminar
                            </button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div><!-- /table-card -->

</div><!-- /main-wrapper -->

<!-- ────────────────────────────────────────────────────── -->
<!-- Modal: Nuevo Rodado                                   -->
<!-- ────────────────────────────────────────────────────── -->
<div class="modal fade" id="modalRodado" tabindex="-1" aria-labelledby="modalRodadoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalRodadoLabel">
                    <i class="bi bi-truck"></i> Nuevo Rodado
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <!-- rodadoForm.jsp se incluye dentro del modal -->
                <jsp:include page="rodadoForm.jsp" />
            </div>
        </div>
    </div>
</div>

<!-- ── Scripts ───────────────────────────────────────────── -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<%= request.getContextPath() %>/scripts/agregarRodado.js"></script>


<%!
    // Helper para obtener valor de getter via reflection (evita casteos en el JSP)
    private String safeGet(Class<?> cls, Object obj, String methodName) {
        try {
            return String.valueOf(cls.getMethod(methodName).invoke(obj));
        } catch (Exception e) {
            return "";
        }
    }
%>

</body>
</html>