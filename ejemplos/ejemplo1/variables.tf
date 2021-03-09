variable "imagen_de_contenedor" {
    description = "Imagen de contenedor que vamos a utilizar para la creacion del contenedor"
    type = string
    default = "nginx:latest"
}

variable "contenedores" {
    description = "Nombre de los contenedores a generar"
    type = list(string)
    default = []
}