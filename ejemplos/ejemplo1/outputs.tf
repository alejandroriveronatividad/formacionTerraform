#recoge informacion a posteriori. puede ir en fichero aparte
output "ip_del_contenedor"{
    value = docker_container.contenedor_nginx[0].network_data[0].ip_address
}