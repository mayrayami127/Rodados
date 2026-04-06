$(function() {
    $("#btn-logout").click(function (e) {
        e.preventDefault();
        $.ajax({
            url: contextPath + "/LogOut", 
            type: "get",
            dataType: "json",
            success: function(data) {
                alert(data.mensaje); 
                window.location.href = contextPath + "/usuario/login.jsp";
            },
            error: function(xhr) {
                if (xhr.responseJSON) {
                    alert("Error: " + xhr.responseJSON.mensaje);
                } else {
                    alert("Error desconocido al cerrar sesión");
                }
            }
        });
    });
});
