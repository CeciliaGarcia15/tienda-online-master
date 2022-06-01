<?php
session_start();





$mensaje="";


    if(isset($_POST['btnAccion'])){

        switch($_POST['btnAccion']){
            case 'agregar':
                if(is_numeric(openssl_decrypt($_POST['codigo'],COD,KEY))){
                    $codigo=openssl_decrypt($_POST['codigo'],COD,KEY);
                    $mensaje.="Ok. codigo correcto ".$codigo."<br>";
                }else{
                    $mensaje.="Upss... codigo incorrecto ";
                }

                if(is_string(openssl_decrypt($_POST['producto'],COD,KEY))){
                    $producto=openssl_decrypt($_POST['producto'],COD,KEY);
                    $mensaje.="Ok. producto correcto ".$producto."<br>";
                }else{
                    $mensaje.="Upss... producto incorrecto ";
                break;
                }

                if(is_numeric(openssl_decrypt($_POST['precio'],COD,KEY))){
                    $precio=openssl_decrypt($_POST['precio'],COD,KEY);
                    $mensaje.="Ok. precio correcto ".$precio."<br>";
                }else{
                    $mensaje.="Upss... precio incorrecto ";
                break;
                }


                if(is_numeric(openssl_decrypt($_POST['cantidad'],COD,KEY))){
                    $cantidad=openssl_decrypt($_POST['cantidad'],COD,KEY);
                    $mensaje.="Ok. cantidad correcto ".$cantidad."<br>";
                }else{
                    $mensaje.="Upss... cantidad incorrecto ";
                break;
                }

                //si no existe una sesion llamada carrito vas a recuperar la informacion que trajimos en post y la vas a colocar en un array 
                if(!isset($_SESSION['CARRITO'])){
                    $prod=array(
                        'codigo'=>$codigo,
                        'producto'=>$producto,
                        'precio'=>$precio,
                        'cantidad'=>$cantidad
                    );
                   //y despues vas a crear la sesion llamada carrito y en el indice 0 le vas a agregar lo que tiene el array de $prod
                    $_SESSION['CARRITO'][0]=$prod;
                    $mensaje="Producto agregado al carrito";
                }
                else{
                    $Idproductos=array_column($_SESSION['CARRITO'],"codigo");
                    
                    if(in_array($codigo,$Idproductos)){
                        echo "<script>alert('El producto ya ha sido seleccionado')</script>";
                        $mensaje="";
                    }else{ 
                        //aca dice si existe una sesion llamada carrito entonces  crea una variable que diga cuantos productos hay ya en esa sesion
                        
                    $numeroProductos=count($_SESSION['CARRITO']);
                    //trae los datos del post y guardalos en un array llamado $prod
                    $prod=array(
                        'codigo'=>$codigo,
                        'producto'=>$producto,
                        'precio'=>$precio,
                        'cantidad'=>$cantidad
                    );
                    //a la sesion carrito en el indice del numero de productos agregale lo que tiene el array $prod
                    $_SESSION['CARRITO'][$numeroProductos]=$prod;
                    $mensaje="Producto agregado al carrito";
                    }
                }

                    
 
                
                //$mensaje=print_r( $_SESSION['CARRITO'],true);
                break;

                case 'eliminar':
                    
                    if(is_numeric(openssl_decrypt($_POST['codigo'],COD,KEY))){
                        $codigo=openssl_decrypt($_POST['codigo'],COD,KEY);
                        //cuales son los valores que coinsiden con el valor del id que envie cuando presione el boton eliminar
                        foreach($_SESSION['CARRITO'] as $indice=>$prod){
                            if($prod['codigo']==$codigo){
                                array_splice($_SESSION['CARRITO'],$indice,1);
                              //  unset($_SESSION['CARRITO'][$indice]);
                                echo "<script>alert('elemento borrado...')</script>";
                            }
                        }
                    }

                break;

                case 'sumar':
                    if(is_numeric(openssl_decrypt($_POST['codigo'],COD,KEY))){
                        $codigo=openssl_decrypt($_POST['codigo'],COD,KEY);

                    foreach($_SESSION['CARRITO'] as $indice=>$prod){
                        if($prod['codigo']==$codigo){
                            $_SESSION['CARRITO'][$indice]['cantidad']=$_SESSION['CARRITO'][$indice]['cantidad']+1;
                            echo "<script>alert('se sumo un producto...')</script>";
                        }
                    else{
                            $mensaje.="Upss... No se puedo sumar la cantidad ";
                        }
                        }
                    }
                break;

                case 'restar':
                        if(is_numeric(openssl_decrypt($_POST['codigo'],COD,KEY))){
                            $codigo=openssl_decrypt($_POST['codigo'],COD,KEY);
    
                        foreach($_SESSION['CARRITO'] as $indice=>$prod){
                            if($prod['codigo']==$codigo){
                                if($_SESSION['CARRITO'][$indice]['cantidad']> 1)
                                {
                                    $_SESSION['CARRITO'][$indice]['cantidad']=$_SESSION['CARRITO'][$indice]['cantidad']-1;
                                    echo "<script>alert('se resto un producto...')</script>";
                                }
                            }
                        else{
                                $mensaje.="Upss... No se puedo restar la cantidad ";
                            }
                            }
                        }
                        break;
                
                
        }
    }




?>