<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.util.*"%>
<%@page import="com.sample.core.domain.Plato"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">



	<script src="<%=request.getContextPath() %>/scripts/jquery/jquery.min.js"></script>
	<script src "<%=request.getContextPath() %>/scripts/formPlato.js"></script >
	<script src "<%=request.getContextPath() %>/scripts/agregarPlato.js"></script>
	
	<script type="text/javascript">
			var contextPath='<%=request.getContextPath()%>';
	</script>
	<script src="<%=request.getContextPath()%>/scripts/eliminarPlato.js"> </script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

<div class="container mt-4">


<span>
		<a class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" > Nuevo </a>
</span>

<%  List<Plato> platos  = (List) request.getAttribute("platos"); %>

<table class="table">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Titulo</th>
      <th scope="col">Precio</th>
      <th scope="col">Descripcion</th>
      <th scope="col">Operaciones</th>
    </tr>
  </thead>
  <tbody>
<%for(int i=0;i<platos.size();i++){
	%>
	 
	<tr bgcolor="white">
	<td><%=platos.get(i).getId() %></td>
	<td><%=platos.get(i).getTitulo() %></td>
	<td><%=platos.get(i).getPrecio()%></td>
	<td><%=platos.get(i).getDescripcion()%></td>
	<td> 
		<a class="btn btn-primary"  href="<%=request.getContextPath()%>/loadPlatoForm?id=<%=platos.get(i).getId()%>" > editar </a>
	 	<button class="btn btn-danger"  data-id="<%=platos.get(i).getId()%>"  onClick="myFunction(this)"> eliminar </button>
	 	<button class="btn btn-warning agregarPedido"  data-id="<%=platos.get(i).getId()%>" onClick="agregarPedibles(this)" > Agregar a pedido </button>

	 </td>
<%		
}
%>
 </tbody>

</table>

</div>
</body>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script> 
<script src="js/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/agregarPlato.js"> </script>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="container mt-4" >
			
		<h1>Plato</h1>
		<form class="form" id="#formPlato">
		  <div class="form-group">
		    <label>titulo</label>
		    <input type="text" class="form-control" id="titulo" name="titulo" aria-describedby="emailHelp" placeholder="Enter price">
		  </div>
		  <div class="form-group">
		    <label>descripcion</label>
		    <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Enter description">
		  </div>
		  <div class="form-group">
		    <label>precio</label>
		    <input type="text" class="form-control" id="precio" name="precio" aria-describedby="emailHelp" placeholder="Enter price">
		  </div>
		  <button type="button" class="btn btn-primary" id="btn-confirmar">Submit</button>
		</form>
		<br>
		</div>
   	
    </div>
  </div>
</div>




</html>