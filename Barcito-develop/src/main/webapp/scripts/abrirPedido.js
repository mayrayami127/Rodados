$(function() {

    $("#btn-abrir-pedido").click(function (e) {
            e.preventDefault(); 
                $.ajax({
                    url: contextPath + '/abrirPedido',
                    dataType: 'json',
                    success: function (data) {
                        alert(data.mensaje   );
                        window.location.href=contextPath+'/home.jsp';
                    },
                    error: function(xhr, status, error) {
                          alert(error);               
                    },
                    cache: true,
                    type: 'get'
                });
        });

});