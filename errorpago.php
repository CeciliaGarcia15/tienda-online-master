<?php
include 'global/conexion.php';
include 'carrito.php';
include 'templates/cabecera.php';
?>

<div class="jumbotron text-center">
    <h1 class="display-4">¡ERROR!</h1>
    <hr class="my-4">
    <p><h4>sucedio un error en la compra</h4>
  <?php $error=""; 
    
  
  ?>  
</p>
    <a href="productos.php" type="button">Ir a todos los productos</a>
</div>


<?php
include 'templates/pie.php';
?>