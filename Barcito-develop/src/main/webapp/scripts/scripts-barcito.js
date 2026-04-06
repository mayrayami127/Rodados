
$(function() {
   
    function popularTablaPedidosEnSession() {
        
        $.ajax({
            type: "get",
            url: contextPath +'/pedidos',
            dataType: "json",
            success: function (response) {
                populateTable(response.pedibles);
            }
        });


    }

    function populateTable(data){
				
        $("#boxPedidosSolicitados tbody").find("tr:gt(0)").remove(); 

        $.each(data, function(i, v) {

          if (i == 0) {
            setDataOnRow($("#boxPedidosSolicitados tbody").find("tr").first(), v);

          } else {

            var clonnedRow = $($("#boxPedidosSolicitados tbody").find("tr").first()).clone();
            setDataOnRow(clonnedRow, v);

            $("#boxPedidosSolicitados tbody").append(clonnedRow);

          }
        });
            
    };
    
    function setDataOnRow(rowObject, v) {
      var titulo = v.titulo;
      var precio = v.precio;

      $(rowObject).find(".titulo").html(titulo);
      $(rowObject).find(".precio").html(precio);
    /*
      $(rowObject).find(".detalles").append( 
        $('<input/>').attr({
                        type: "button",
                        class :"btn btn-primary",
                        value: "Ver mas",
                        onclick: ""
                    })
        );
        */
    }



    $(document).ready(function () {
        
        popularTablaPedidosEnSession();

    });


});