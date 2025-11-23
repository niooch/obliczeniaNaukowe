#Jakub Kogut
#funkcja rozwiazujaca równianie f(x)=0 metoda siecznych
function sieczne(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    #funkcja zwraca (r,v,it,err) gdzie:
    #r - przyblizenie rozwiazania
    #v - wartosc funkcji w punkcie r
    #it - liczba iteracji
    #err - sygnal błędu: 0 - no err, 1 - przekroczono maxit
    f0 = f(x0)
    f1 = f(x1)
    for k in 1:maxit
        if abs(f0) > abs(f1)
            #swap
            x0, x1 = x1, x0
            f0, f1 = f1, f0
        end
        s = (x1 - x0) / (f1 - f0)
        x1, f1 = x0, f0
        x0 = x0 - f0 * s
        f0 = f(x0)
        if abs(x1 - x0) < delta || abs(f0) < epsilon
            return (x0, f0, k, 0)
        end
    end
    return (x0, f0, maxit, 1)
end


