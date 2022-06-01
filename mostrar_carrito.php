<?php
include 'global/conexion.php';
include 'carrito.php';
include 'templates/cabecera.php';
?>
<br>

<h3>Lista del carrito</h3>
<?php 
    if(!empty($_SESSION['CARRITO'])) {
?>


    <table class="table  table-bordered">
        <tbody>
            <tr>
                <th width=40% >Descripcion</th>
                <th width=2% class="text-center">-</th>
                <th width=11% class="text-center">Cantidad</th>
                <th width=2% class="text-center">+</th>
                <th width=20% class="text-center">Precio</th>
                <th width=20% class="text-center">Total</th>
                <th width=5% class="text-center">--</th>
            </tr>

            <?php $total=0;
                $totalIVA=0;
            ?>
            <?php foreach($_SESSION['CARRITO'] as $indice=>$prod){?>
            <tr>
            <td width=40%><?php echo $prod['producto'];?></td>
            
            <td width=2%>
                <form action="" method="POST">
                    <input type="hidden" name="codigo" id="codigo" value="<?php echo openssl_encrypt($prod['codigo'],COD,KEY);?>"> 
                    <button class="btn btn-primary" name="btnAccion" value="restar" type="submit">-</button>
                </form>
            </td>

            <td width=11% class="text-center">
                <?php echo $prod['cantidad'];?>
            </td>

            <td width=2%>
                    <form action="" method="POST">
                        <input type="hidden" name="codigo" id="codigo" value="<?php echo openssl_encrypt($prod['codigo'],COD,KEY);?>"> 
                        <button class="btn btn-secondary" name="btnAccion" value="sumar" type="submit">+</button>
                    </form>
            </td>
            <td width=20% class="text-center">$<?php echo $prod['precio'];?></td>
            <td width=20% class="text-center">$<?php echo number_format($prod['precio']*$prod['cantidad'],2);?></td>
            <td width=5%>
                <form action="" method="POST">
                <input type="hidden" name="codigo" id="codigo" value="<?php echo openssl_encrypt($prod['codigo'],COD,KEY);?>"> 
                    <button class="btn btn-danger" name="btnAccion" value="eliminar" type="submit">Eliminar</button>
                </form>
            </td>
            </tr>
            <?php 
            $total=$total+($prod['precio']*$prod['cantidad']); 
            $totalIVA=$total+(($total*21)/100);
            }
            ?>
            
            <tr>
                <td colspan="5" align="right"><h3>Total</h3></td>
                <td align="right"><h3>$ <?php echo number_format($total,2);?></h3></td>
                <td></td>
            </tr>


            <tr>
                <td colspan="5" align="right"><h3>Total con IVA</h3></td>
                <td align="right"><h3>$ <?php echo number_format($totalIVA,2);?></h3></td>
                <td></td>
            </tr>

            <tr>
                <td colspan='7'>
                    <form action="pagar.php" method="post">
                        
                    <div class="alert alert-success" role="alert">
                            <div class="form-group">
                                <label for="my-input">Correo de contacto:</label>
                                <input id="email" class="form-control" type="email" name="email" placeholder="Por favor escribe tu email" required>
                            </div>
                        </div>
                       <button class="btn btn-primary btn-lg btn-block" type="submit" value="proceder" name="btnAccion">Proceder a pagar >></button>
                    </form>
                    

                </td>
                
            </tr>
            

        </tbody>
    </table>
<?php }else{?>
    <div class="alert alert-success">
        No hay productos en el carrito...
    </div>
<?php } ?>

<?php
include 'templates/pie.php';
?>
