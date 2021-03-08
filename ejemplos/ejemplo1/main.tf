/* 
Comentario
1
2
*/


terraform {  #esto es otro comentario
#esta marca solo aparece UNA vez
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
    
}

provider docker { #nombre de los proveedores sacados de la docu oficial
    #marca que puede aparecer varias veces segun proveedor
    #si tiene .conf va aqui
}

#una marca resource por cada recurso de infra que debemos tener
resource "docker_container" "contenedor_nginx" {
    name = "mi-contenedor-de-nginx"
    image = docker_image.imagen_nginx.latest
    #aquí va la configuración del recurso, dependerá del tipo de recurso
}

#una marca resource por cada recurso de infra que debemos tener
resource "docker_image" "imagen_nginx" {
    name = "nginx:latest"
    #aquí va la configuración del recurso, dependerá del tipo de recurso
}