
$(document).ready(function () {
    $("#input-postre").hide();
    $("#input-bebida").hide();
    $("#input-plato").hide();

    $('select').on('change', function() {
       
       if (this.value ==="Estudiantil") {
        //ocltar el postre
       
        //realizar petcion ajax de bebida y plato
            $.ajax({
                type: "get",
                url: "http://localhost:8080/bebidas",
                data: "data",
                dataType: "json",
                success: function (response) {
                    var $dropdown = $("#cmbBebida");
                    $("#cmbBebida").empty();
                    $.each(response, function() {
                        $dropdown.append($("<option />").val(this.id).text(this.titulo));
                    });
                }
            });

            $.ajax({
                type: "get",
                url: "http://localhost:8080/platos",
                data: "data",
                dataType: "json",
                success: function (response) {
                    var $dropdown = $("#cmbPlato");
                    $("#cmbPlato").empty();
                    $.each(response, function() {
                        $dropdown.append($("<option />").val(this.id).text(this.titulo));
                    });
                }
            });

        $("#input-postre").hide();
        $("#input-bebida").show();
        $("#input-plato").show();
        } else if(this.value ==="Dia") {

        //realizar petcion ajax de postre y plato
            $.ajax({
                type: "get",
                url: "http://localhost:8080/postres",
                data: "data",
                dataType: "json",
                success: function (response) {
                    $("#cmbPostre").empty();
                    var $dropdown = $("#cmbPostre");
                    $.each(response, function() {
                        $dropdown.append($("<option />").val(this.id).text(this.titulo));
                    });
                }
            });

            $.ajax({
                type: "get",
                url: "http://localhost:8080/platos",
                data: "data",
                dataType: "json",
                success: function (response) {
                    var $dropdown = $("#cmbPlato");
                    $("#cmbPlato").empty();
                    $.each(response, function() {
                        $dropdown.append($("<option />").val(this.id).text(this.titulo));
                    });
                }
            });


        //ocultar bebida
        $("#input-bebida").hide();
        $("#input-plato").show();
        $("#input-postre").show();
       }else if(this.value ==="Ejecutivo"){
        //realizar petcion ajax de bebida y plato y plato

        $.ajax({
            type: "get",
            url: "http://localhost:8080/platos",
            data: "data",
            dataType: "json",
            success: function (response) {
                var $dropdown = $("#cmbPlato");
                $("#cmbPlato").empty();
                $.each(response, function() {
                    $dropdown.append($("<option />").val(this.id).text(this.titulo));
                });
            }
        });
        $.ajax({
            type: "get",
            url: "http://localhost:8080/postres",
            data: "data",
            dataType: "json",
            success: function (response) {
                $("#cmbPostre").empty();
                var $dropdown = $("#cmbPostre");
                $.each(response, function() {
                    $dropdown.append($("<option />").val(this.id).text(this.titulo));
                });
            }
        });

        $.ajax({
            type: "get",
            url: "http://localhost:8080/bebidas",
            data: "data",
            dataType: "json",
            success: function (response) {
                var $dropdown = $("#cmbBebida");
                $("#cmbBebida").empty();
                $.each(response, function() {
                    $dropdown.append($("<option />").val(this.id).text(this.titulo));
                });
            }
        });

        $("#input-postre").show();
        $("#input-bebida").show();
        $("#input-plato").show();
       }
       
       
        console.log( this.value );
      });
    
$('#btn-crear-menu').click(function (e) {



    
    //e.preventDefault();
     var tipo = $('#cmbTipoMenu').val();
     var precio = $('#precio').val();
     var descripcion = $('#descripcion').val();
     var plato =$('#cmbPlato').val();
     var postre =$('#cmbPostre').val();
     var bebida =$('#cmbBebida').val();
     var titulo =$('#titulo').val();
     
     if (tipo ==="Dia") {
        bebida = "";
     } else if(tipo ==="Estudiantil")  {
        postre="";
     }
 
    var objetoJason = {
        tipo : tipo,
        precio : precio,
        descripcion :descripcion,
        plato: plato,
        postre : postre,
        bebida :bebida,
        titulo :titulo
    }
    $.ajax({
        type: "post",
        url: contextPath+"/crearmenu",
        data: objetoJason,
        dataType: "json",
        success: function (response) {
                window.location.href=contextPath+'/leerDatosMenu';
            
        }
    });




});





});
