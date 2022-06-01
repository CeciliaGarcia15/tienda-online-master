<?php

if(isset($_POST["btnLogin"])){
    include('global/conexion.php');
    $txtEmail= ($_POST['email']);
    $txtPassword=($_POST['contra']);

    $sentenciaSQL=$pdo->prepare("SELECT * FROM tblusuarios WHERE correo=:correo AND password=:password");

    $sentenciaSQL->bindParam("correo",$txtEmail,PDO::PARAM_STR);//esto le dice a la variable sentenciaSQL que remplace ese :correo y :password por el contenido de la variable txtemail y txtpassword y ademas que los parametros son string si fueran numericos enteros seria int
    $sentenciaSQL->bindParam("password",$txtPassword,PDO::PARAM_STR);

    $sentenciaSQL->execute();

    $registro=$sentenciaSQL->fetch(PDO::FETCH_ASSOC);//esto trae todos los datos del usuario o usuarios que coinsidieron el nombe,apellido,correo,password y foto

    

    $numeroRegistros=$sentenciaSQL->rowCount();//te dice cuantos registros coinsidieron 

    if($numeroRegistros>=1){
        session_start();
    $_SESSION['usuario']=$registro;
        echo "Bienvenido...";
        header('Location:productos.php');//aca para que si es correcto nos envia a la vista del panel
    }else{
        echo "No se encontraron registros";
    }

    
}

?>






