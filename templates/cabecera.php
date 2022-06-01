

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    <title>Tienda</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="inside.php">Logo de la empresa</a>
        <button class="navbar-toggler" data-target="#my-nav" data-toggle="collapse" aria-controls="my-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div id="my-nav" class="collapse navbar-collapse">
            <ul class="nav nav-items">
                <li class="nav-item active">
                    <a class="nav-link" href="productos.php">Todos los productos <span class="sr-only">(current)</span></a>
                </li>
                <li>
                <a class="nav-link" href="mostrar_carrito.php" tabindex="-1" aria-disabled="true">Carrito(<?php echo(empty($_SESSION['CARRITO']))?0:count($_SESSION['CARRITO']); ?>)</a>

                </li>

                <li class="nav-item">
                    <?php 
                        
                        if(!isset($_SESSION['usuario'])){
                        ?>
                        <a  class="nav-link" href="iniciar_sesion.php">Iniciar Sesion</a>

                        <?php
                        }else{
                            ?>
                            <a  class="nav-link" href="cerrar_sesion.php">Cerrar Sesion</a>
                            <li class="nav-item">

                </li>
                            
                            <?php
                        }
                    
                    ?>
                </li>
            </ul>
        </div>
    </nav>
    <br>
    <br>
    <div class="container">

