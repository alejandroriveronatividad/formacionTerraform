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
    
    provisioner "local-exec" {
        command = "echo ${self.name}=${self.network_data[0].ip_address} >> inventario.txt"
    }
    
    connection {
        type = "ssh"
        host = self.network_data[0].ip_address
        user = "root"
        password = "root"
        port = 22
    }
    
    provisioner "remote-exec" {
        inline = [
            "echo ${self.name}=${self.network_data[0].ip_address} >> inventario.txt"
            ]
    }
}

#una marca resource por cada recurso de infra que debemos tener
resource "docker_image" "imagen_nginx" {
    name = var.imagen_de_contenedor
    #aquí va la configuración del recurso, dependerá del tipo de recurso
}

