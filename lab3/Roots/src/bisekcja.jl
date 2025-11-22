#Jakub Kogut
#funkcja rozwiazuje równanie f(x)=0 metodą bisekcji
function bisekcja(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    #funcja zwraca (r,v,it,err) gdzie:
    #r - przybliżone miejsce zerowe
    #v - wartość funkcji w miejscu zerowym
    #it - liczba iteracji
    #err - sygnał blędu: 0 - no err, 1 - a>b, lub f(a)*f(b)>0
    err = 0
    if a > b
        err = 1
        return (NaN, NaN, 0, err)
    end
    u = f(a)
    v = f(b)
    e = b-a
    if u * v > 0
        err = 1
        return (NaN, NaN, 0, err)
    end
    it = 0
    while e > delta && abs(v) > epsilon
        e = e / 2
        c = a + e
        w = f(c)
        if u * w <= 0
            b = c
            v = w
        else
            a = c
            u = w
            it += 1
        end
    end
    r = a + e
    v = f(r)
    return (r, v, it, err)
end

    
