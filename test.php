<?php
$carpetaDestino="imagenes/header/";
$c="imagenes/header/";
$cont= 0;
$url = array();
 if($dir=opendir($carpetaDestino)){

   while($archivo=readdir($dir)){

     if($archivo !="." && $archivo !=".."){
       $cont ++;
    $url[]=$archivo;
   }
   }
 }
 for($i=0;$i<=0;$i++){echo $url[0];}
 ?>
