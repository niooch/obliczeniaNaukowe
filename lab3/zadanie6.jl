#Jakub Kogut
include("MyRoots/src/MyRoots.jl")
using .MyRoots
#Teraz mamy znalesc miejsce zerowe funkcji ale nie mamy podanych przedzialow, ani wartosci startowych

f1(x) = exp(1-x)-1
f2(x) = x*exp(-x)

f1p(x) = -exp(1-x)
f2p(x) = exp(-x)-x*exp(-x)

delta = 5.0e-6
eps = 5.0e-6
#metoda bisekcji
a, b = 0.9999, 1.0001
#(r,v,it,err) = bisekcja(f1, a, b, delta, eps)
#println("Metoda bisekcji dla f1:")
#println("a = $a, b = $b")
#println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")
#a, b = -0.95, 1.5
#(r,v,it,err) = bisekcja(f2, a, b, delta, eps)
#println("Metoda bisekcji dla f2:")
#println("a = $a, b = $b")
#println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")
#
##metoda Newtona
#x_start = [10000.0, 10.0, 5.0, 2.0, 1.0, 0.5, 0.0, -0.5, -1.0, -100.0]
#for x0 in x_start
#    try
#        (r,v,it,err) = newton(f2, f2p, x0, delta, eps, 1000)
#        println("Metoda Newtona dla f2 z x0 = $x0:")
#        println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")
#    catch e
#        println("Metoda Newtona dla f2 z x0 = $x0 nie zbiega: ", e)
#    end
#end
#x0 = 1.0
#(r,v,it,err) = newton(f1, f1p, x0, delta, eps, 1000)
#println("Metoda Newtona dla f1:")
#println("a = $a, b = $b")
#println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")
#x0 = 0.5
#(r,v,it,err) = newton(f2, f2p, x0, delta, eps, 1000)
#println("Metoda Newtona dla f2:")
#println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")

#metoda siecznych
x0, x1 = 200.5, 300.0
(r,v,it,err) = sieczne(f1, x0, x1, delta, eps, 1000)
println("Metoda siecznych dla f1:")
println("x0 = $x0, x1 = $x1")
println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")
x0, x1 = 200.5, 300.0
(r,v,it,err) = sieczne(f2, x0, x1, delta, eps, 1000)
println("Metoda siecznych dla f2:")
println("x0 = $x0, x1 = $x1")
println("Miejsce zerowe: $r, Wartosc funkcji w miejscu zerowym: $v, Iteracje: $it, Blad: $err")
