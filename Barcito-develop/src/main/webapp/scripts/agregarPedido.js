 
function agregarPedido(data){
    id =  $(data).attr("data-id");
    tipo =  $(data).attr("data-id");

    Swal.fire({
        title: "Esta seguro de agregar el nuevo plato?",
        text: "Se agregara un nuevo registro a la base!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si deseo agregarlo!"
      }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "get",
                url: contextPath+"/abrirPedido?idProducto="+id+'&idTipo='+tipo,
                dataType: "json",
                success: function (response) {
                    Swal.fire({
                        title: "Agregado!",
                        text: "El nuevo plato se agrego correctamente.",
                        icon: "success"
                      });
                    window.location.href=contextPath+'/';
                }
            });

  
        }
      });





}