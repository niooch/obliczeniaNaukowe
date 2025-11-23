#Jakub Kogut
#funkcja rozwiazujaca równianie f(x)=0 metoda Newtona
function newton(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    #funkcja zwraca (r,v,it,err) gdzie:
    #r - przyblizenie rozwiazania
    #v - wartosc funkcji w punkcie r
    #it - liczba iteracji
    #err - sygnal błędu: 0 - no err, 1 - przekroczono maxit, 2 - pochodna bliska zeru
    v = f(x0)
    if abs(v) < epsilon
        return (x0, v, 0, 0)
    end
    x1 = NaN
    for k in 1:maxit
        x1 = x0 - v / pf(x0)
        v = f(x1)
        if( abs(pf(x0)) < epsilon)
            return (x1, v, k, 2)
        end
        if abs(x1-x0) < delta || abs(v) < epsilon
            return (x1, v, k, 0)
        end
        x0 = x1
    end
    return (x1, v, maxit, 1)
end
