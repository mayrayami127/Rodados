<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="<%=request.getContextPath()%>/scripts/jquery/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>

	<script type="text/javascript">
			var contextPath='<%=request.getContextPath()%>';
	</script>
	<script src="<%=request.getContextPath()%>/scripts/agregarPlato.js"> </script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	</head>
	<body>
	
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
		
		</div>
			
	</body>
</html>