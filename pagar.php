<?php
include 'global/conexion.php';
include 'carrito.php';
include 'templates/cabecera.php';
?>

<?php

if($_POST){
    $total=0;
    $sId=session_id();
    $correo=$_POST['email'];
    foreach($_SESSION['CARRITO'] as $indice=>$prod){
        $total=$total+($prod['precio']*$prod['cantidad']);
    }
    $sentencia=$pdo->prepare("INSERT INTO `tblventas`
                            (`id`, `claveTransaccion`, `paypalDatos`, `fecha`, `correo`, `totalTransaccion`, `estatus`) 
                            VALUES (NULL,:ClaveTransaccion, '', NOW(), :Correo, :Total, 'pendiente');"); 
    
    $sentencia->bindParam(":ClaveTransaccion",$sId);
    $sentencia->bindParam(":Correo",$correo);
    $sentencia->bindParam(":Total",$total);


    $sentencia->execute();

    $idVenta=$pdo->lastInsertId();//devuelve el ultimo id insertado en la base de datos
    
    foreach($_SESSION['CARRITO'] as $indice=>$prod){
        $sentencia=$pdo->prepare("INSERT INTO `tbldetalleventa` 
        (`id`, `idVenta`, `idProducto`, `precioUnitario`, `cantidad`) 
        VALUES (NULL, :idVenta,:idProducto, :precioUnitario, :Cantidad);");

        $sentencia->bindParam(":idVenta",$idVenta);
        $sentencia->bindParam(":idProducto",$prod['codigo']);
        $sentencia->bindParam(":precioUnitario",$prod['precio']);
        $sentencia->bindParam(":Cantidad",$prod['cantidad']);
        
        $sentencia->execute();
    
    }
    //echo "<h3>".$total."</h3>";

}

?>
<?php
// SDK de Mercado Pago

require __DIR__ .  '/vendor/autoload.php';

// Agrega credenciales
MercadoPago\SDK::setAccessToken('TEST-6350049684349007-120900-c443d281432871f38b9ebf7cb4eb923e-684778719');

// Crea un objeto de preferencia
$preference = new MercadoPago\Preference();
//...
$preference->back_urls = array(
    "success" => "localhost/tienda-online-master/gracias.php",
    "failure" => "localhost/tienda-online-master/errorago.php",
    "pending" => "localhost/tienda-online-master/errorpago.php"
);
$preference->auto_return = "approved";
// ...

// Crea un ítem en la preferencia
$datos=array();
for ($i=0; $i < count($prod); $i++) { 
    
        $item = new MercadoPago\Item();
            $item->id = $prod['codigo'];
            $item->title = $prod['producto'];
            $item->quantity = $prod['cantidad'];
            $item->currency_id = "ARS";
            $item->unit_price = $prod['precio'];
        $datos[]=$item;

};


  

//$preference->items = array($item);
$preference->items = $datos;
$preference->save();
?>
<script src="https://secure.mlstatic.com/sdk/javascript/v1/mercadopago.js"></script>
<div class="jumbotron text-center">
    <h1 class="display-4">¡Paso Final!</h1>
    <hr class="my-4">
    <p class="lead">Estas a punto de pagar la cantidad de: 
    <h4>$<?php echo number_format($total,2);?></h4>
    </p>
    <form action="/procesar-pago" method="POST">
  <script
   src="https://www.mercadopago.com.ar/integrations/v1/web-payment-checkout.js"
   data-preference-id="<?php echo $preference->id; ?>">
  </script>
</form>
</div>



<?php
include 'templates/pie.php';
/*curl -X POST -H "Content-Type: application/json" "https://api.mercadopago.com/users/test_user?access_token=TEST-3306648445438727-100603-f00fd54a8d3a5fce9bee7deea8268a6d-141625507" -d "{'site_id':'MLA'}"

{"id":684778719,"nickname":"TESTSZYOR3MR","password":"qatest5352","site_status":"active","email":"test_user_32659058@testuser.com"}//user1COMPRADOR

{"id":684786367,"nickname":"TESTAP5W0WVT","password":"qatest2396","site_status":"active","email":"test_user_89524126@testuser.com"}//user2VENDEDOR

*/?>
