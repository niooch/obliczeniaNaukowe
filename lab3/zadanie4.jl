#Jakub Kogut
#nalezy przetestowac metody znajdujace pierwiastki funckcji na 
#f = sin(x) - (x/2)^2
include("MyRoots/src/MyRoots.jl")

using .MyRoots

f(x) = sin(x) - (x/2)^2

#metoda bisekcji
(r, v, it, err) = bisekcja(f, 1.5, 2.0, 0.5*10.0^-5, 0.5*10.0^-5)
println("Metoda bisekcji:")
println("Pierwiastek: ", r)
println("Wartosc funkcji w pierwiastku: ", v)
println("Liczba iteracji: ", it)
println("Ostatni blad: ", err)

#metoda Netwona
fp(x) = cos(x) - x/2
(r, v, it, err) = newton(f, fp, 1.5, 0.5*10.0^-5, 0.5*10.0^-5, 100)
println("\nMetoda Newtona:")
println("Pierwiastek: ", r)
println("Wartosc funkcji w pierwiastku: ", v)
println("Liczba iteracji: ", it)
println("Ostatni blad: ", err)

#metoda siecznych
(r, v, it, err) = sieczne(f, 1.0, 2.0, 0.5*10.0^-5, 0.5*10.0^-5, 100)
println("\nMetoda siecznych:")
println("Pierwiastek: ", r)
println("Wartosc funkcji w pierwiastku: ", v)
println("Liczba iteracji: ", it)
println("Ostatni blad: ", err)

