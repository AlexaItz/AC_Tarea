import Pkg                                                #Importamos el paquete Pkg
Pkg.add("Plots")                                          #Añadimos la paquetería plots
Pkg.add("Measurements")

z = 1                                      # Primero definimos nuestra variable contador para poner fin al ciclo.
Nrojo = 0                                  # Definimos también nuestras variables que nos serviran para contar
Nazul = 0                                  # la cantidad de puntos dentro y fuera del circulo.

using Plots; gr()                          # Importamos la biblioteca "Plots".

function Circulo(h, k, r)                  # Definimos una función "Circulo" la cual toma los valores de sus
    θ = LinRange(0, 2π, 500)               # coordenadas centrales (h, k) y por otro lado toma el radio de la
    h .+ r * sin.(θ), k .+ r * cos.(θ)     # circunferencia para poder realizar un circulo.
end

plot(Circulo(0.5, 0.5, 0.5), title = "Estimacion de pi", fillalpha = 0.2, legend = false, lw = 0.5, 
    linecolor = "black", aspect_ratio = 1)

# Utilizamos la función circulo para poder gráficar una circunferencia con 0.5 de radio en donde lanzaremos los
# puntos para obtener la estimación de pi.

while z <= 2500                              # Generamos un ciclo que termina cuando "z" alcanza un valor específico.
    
    z += 1                                   # Cada que se complete una "vuelta" al ciclo agregamos 1 a "z" para alcanzar el valor determinado.
        
x = rand(0:0.0001:1)                         # Generamos valores aleatorios para x y para y, entre el área posible del
y = rand(0:0.0001:1)                         # cuadrado tomado, en donde 1 es el valor máximo de las coordenadas.

    w = sqrt(((x - 0.5)^2) + ((y - 0.5)^2))  # Definimos w de tal forma que podamos decir si el punto está dentro o fuera del circulo.
    
if w <= 0.5                                  # Si w es menor o igual a 0.5, podemos decir que el punto está dentro del circulo.

        Nrojo += 1                           # Ya que está dentro del circulo sumamos un punto a los puntos rojos.
        
plot!([x], [y], seriestype = :scatter, label = "", color = "red") # Agregamos los puntos a la gráfica con color rojo.
     

elseif w > 0.5                               # Si w es mayor a 0.5, podemos decir que el punto está fuera del circulo. 
            
        Nazul += 1                           # Ya que está fuera del circulo sumamos un punto a los puntos azules.
        
plot!([x], [y], seriestype = :scatter, label = "", color = "blue") # Agregamos los puntos a la gráfica con color azul.
        
    end                                      # Terminamos el bloque de comando "if".
end                                          # Terminamos el bloque de comando "while".

π1 = (4(Nrojo/(Nrojo + Nazul)))              # Definimos π1 como la estimación de pi.

println("Puntos rojos = $Nrojo")             # Imprimimos la cantidad de puntos rojos.
println("Puntos totales = $(Nrojo + Nazul)") # Imprimimos la cantidad de puntos totales sumando los rojos y azules.
println("Estimación de pi = $π1")            # Imprimimos la estimación de pi.

plot!(Circulo(0.5, 0.5, 0.5), fillalpha = 0.2, legend = false, lw = 0.5, linecolor = "black", aspect_ratio = 1, grid = false)
# Finalmente obtenemos la gráfica.

using Plots

z = [10, 20, 30, 40, 50]                     # Tomamos los puntos donde hay 10, 20, 30, 40 y 50 puntos en la gráfica.

estimacion = [2.8 ,3.4 ,3.6 ,3.3, 3.12]      # Y anotamos los valores que nos dan como resultado al realizar la estimación.

error = pi.-estimacion                       # Después le restamos la estimación al valor de pi para obtener el error.
println(error)

scatter([z],[error], yerr = [0.3415926535897933, -0.2584073464102068, -0.458407346410207, -0.1584073464102067, 0.02159265358979301], msc = 1, label = "", ytick = 0:10:60) 
#Gráficamos el error con la cantidad de puntos usados.
