<?php
include 'global/conexion.php';
include 'carrito.php';
include 'templates/cabecera.php';

?>

    <br>
    <?php if($mensaje!=""){ ?>
    <div class="alert alert-success" role="alert">
        <?php print_r($mensaje);?>
        <a href="mostrar_carrito.php" class="badge badge-success">Ver carrito</a>
    </div>
    <?php }?>
    <?php 
            $busqueda= strtolower($_POST['busqueda']); 
            if(empty($busqueda)){ 
                header('location:productos.php');
            } else{ 
                $sentencia=$pdo->prepare("SELECT * FROM productos WHERE  
                producto LIKE '%$busqueda%' OR
                codigo LIKE '%$busqueda%'
                ");
                $sentencia->execute();
                $listaProductos=$sentencia->fetchAll(PDO::FETCH_ASSOC);
            }
        ?>
        <div class="row">
            <form action="" method="post">
                <input type="text" name="busqueda" id="busqueda" placeholder="buscador" value="<?php echo $busqueda;?>">
                <input type="submit" value="enviar">
            </form> 

        </div>
   <div class="row">
            
        <?php
            foreach($listaProductos as $productos){?>
                <div class="col-3">
            <div class="card">
                <img src="img/<?php echo $productos['imagen'];?>" 
                height="300px"
                data-toggle="popover"
                data-trigger="hover"
                data-content="<?php echo $productos['descripcion']?>"
                class="card-image-top" 
                title="<?php echo $productos['producto'];?>"
                alt="<?php echo $productos['producto'];?>">
                <div class="card-body">
                    <span><?php echo $productos['producto'];?></span>
                    <h5 class="card-title">$ <?php echo $productos['precio'];?></h5>
                    
                    <form action="" method="post">
                    <input type="hidden" name="codigo" id="codigo" value="<?php echo openssl_encrypt($productos['codigo'],COD,KEY);?>"> 
                    <input type="hidden" name="producto" id="producto" value="<?php echo openssl_encrypt($productos['producto'],COD,KEY);?>">
                    <input type="hidden" name="precio" id="precio" value="<?php echo openssl_encrypt($productos['precio'],COD,KEY);?>" >
                    <input type="hidden" name="cantidad" id="cantidad" value="<?php echo openssl_encrypt(1,COD,KEY);?>"  >
                    <button class="btn btn-primary" type="submit" name="btnAccion" value="agregar">Añadir al carrito</button>
                    </form>
                </div>
            </div>
        </div>

        <?php
        }
        ?>
        

    </div>



    </div>




<script>
    $(function () {
  $('[data-toggle="popover"]').popover()
});
</script>
<?php 
include 'templates/pie.php';


?>