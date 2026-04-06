$(function () {

    $("#btn-confirmar").click(function (e) {
        e.preventDefault();

        var tipocaja = $("#tipocaja").val();
        var tipo = $("#tipo").val();
        var tipoconsumo = $("#tipoconsumo").val();
        var puertas = $("#puertas").val();
        var tipoderodado = $("#tipoderodado").val();
        var patente = $("#patente").val();
        var motorrodaje = $("#motorrodaje").val();
        var motor = $("#motor").val();
        var color = $("#color").val();
        var baul = $("#baul").val();

        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: "btn btn-success",
                cancelButton: "btn btn-danger"
            },
            buttonsStyling: false
        });

        swalWithBootstrapButtons.fire({
            title: "¿Desea agregar el rodado?",
            text: "Confirma que desea agregar el nuevo rodado",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Sí, agregar!",
            cancelButtonText: "Cancelar",
            reverseButtons: true
        }).then((result) => {

            if (result.isConfirmed) {

                $.ajax({
                    url: contextPath + '/CrearRodadoController',
                    type: 'POST',
                    dataType: 'json',

                    data: {
                        tipocaja: tipocaja,
                        tipo: tipo,
                        tipoconsumo: tipoconsumo,
                        puertas: puertas,
                        tipoderodado: tipoderodado,
                        patente: patente,
                        motorrodaje: motorrodaje,
                        motor: motor,
                        color: color,
                        baul: baul
                    },

                    success: function (data) {
                        Swal.fire({
                            icon: "success",
                            title: "Éxito",
                            text: "El rodado se agregó correctamente",
                            showConfirmButton: true
                        }).then(() => {
                            window.location.href = contextPath + '/LeerDatosRodado';
                        });
                    },

                    error: function (xhr, status, error) {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "No se pudo guardar el rodado"
                        });
                        console.log(error);
                    }
                });

            } else if (result.dismiss === Swal.DismissReason.cancel) {

                swalWithBootstrapButtons.fire({
                    title: "Cancelado",
                    text: "No se realizó ninguna acción",
                    icon: "error"
                });
            }
        });
    });

});