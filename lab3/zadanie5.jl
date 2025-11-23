#Jakub Kogut
include("MyRoots/src/MyRoots.jl")
using .MyRoots
#teraz musimy wyznaczyc miejca przeciecia funkcji f1 i f2, mozemy to zrobic poprzez znalezienie miejsc zerowych funkcji f1 - f2
f1(x) = 3*x
f2(x) = exp(x)
delta = 0.5 * 10.0^-4
eps = 0.5 * 10.0^-4
f(x) = f1(x) - f2(x)
(r,v,it, err) = bisekcja(f,0.0, 1.0, delta, eps)
println("Miejsce przeciecia funkcji f1 i f2 to: ", r)
println("Wartosc funkcji f1 w tym punkcie to: ", f1(r))
println("Wartosc funkcji f2 w tym punkcie to: ", f2(r))
println("Wartosc sygnalu bledu to: ", err)
println("Liczba iteracji potrzebnych do osiagniecia tego bledu to: ", it)

(r,v,it, err) = bisekcja(f,1.0, 2.0, delta, eps)
println("Miejsce przeciecia funkcji f1 i f2 to: ", r)
println("Wartosc funkcji f1 w tym punkcie to: ", f1(r))
println("Wartosc funkcji f2 w tym punkcie to: ", f2(r))
println("Wartosc sygnalu bledu to: ", err)
println("Liczba iteracji potrzebnych do osiagniecia tego bledu to: ", it)

