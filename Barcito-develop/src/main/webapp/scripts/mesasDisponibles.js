var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));

class Mesa {
    constructor(id, numero, estado) {
        this.id = id;
        this.numero = numero;
        this.estado = estado;

    }

    renderizar() {
		const botonReservar = this.estado === "LIBRE"
		            ? `<button class="btn btn-success reservar-btn" data-id="${this.numero}">Reservar</button>`
		            : `<button class="btn btn-warning abrir-reserva-btn" data-id="${this.numero}">Agregar Pedido</button>`;
        return `
            <div class="card m-2" style="width: 18rem;">
                <div class="card-body">	
                    <h5 class="card-title">Mesa N° ${this.numero}</h5>
                    <p class="card-text"><strong>ID:</strong> ${this.id}</p>
                    <p class="card-text"><strong>Estado:</strong> ${this.estado}</p>
					${botonReservar}
					</div>
            </div>
        `;
    }
}

function cargarListadoMesas() {
    $.ajax({
        url: contextPath + "/mesas",
        method: "GET",
        cache: false,
        success: function(response) {
			// console.log(response);  // Revisar qué trae el campo estado
            $('#contenedorMesas').empty();

            response.forEach(m => {
                const mesa = new Mesa(m.id, m.numero, m.estadoMesa);
                $('#contenedorMesas').append(mesa.renderizar());
            });
			
			$('.reservar-btn').click(function() {
			              const mesaId = $(this).data("id");
			              reservarMesa(mesaId);

			          });
            $('.abrir-reserva-btn').click(function() {
			              const mesaId = $(this).data("id");
			              abrirPedidos(mesaId);
			          });

        },
        error: function(xhr) {
            console.log("Error al obtener mesas:", xhr);
            $('#contenedorMesas').html('<p>Error al cargar las mesas.</p>');
        }
    });
}

function reservarMesa(numero) {
    $.ajax({
        url: contextPath + "/reservarMesa",
        method: "POST",
        data: { id: numero },
        success: function() {
            Swal.fire("¡Reservado!", "La mesa fue reservada correctamente.", "success");
        
            cargarListadoMesas();
        },
        error: function(xhr) {
            Swal.fire("Error", "No se pudo reservar la mesa.", "error");
        }
    });
}

function abrirPedidos(numero) {
        $.ajax({
        url: contextPath + "/agregarPedido?numero="+numero,
        method: "get",
        data: { id: numero },
        success: function() {
            Swal.fire("¡Disponible para pedir!", "La mesa ya puedregar pedido", "success");
        },
        error: function(xhr) {
            Swal.fire("Error", "No se pudo reservar la mesa.", "error");
        }
    });
}

$(document).ready(function() {
    cargarListadoMesas();
});
