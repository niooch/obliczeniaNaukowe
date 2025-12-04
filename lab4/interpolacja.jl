#Jakub Kogut
module Interpolacja
export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
using Plots
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    n = length(x)
    #nalezy zwrocic wektor ilorazow roznicowych
    fx = copy(f)
    for j in 2:n
        for i in n:-1:j
            fx[i] = (fx[i] - fx[i-1]) / (x[i] - x[i-j+1]) #twierdzenie 3. wyklad 6.
        end
    end
    return fx
end

#funkcja zwracajaca wartosc wielomianu interpolacyjnego w punkcie t metoda Hornera
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    n = length(x)
    wynik = fx[n]
    for i in (n-1):-1:1
        wynik = wynik * (t - x[i]) + fx[i]
    end
    return wynik
end

#funkcja zwracajaca wspolczynniki wielomianu interpolacyjnego w postaci naturalnej
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    n = length(x)
    a = zeros(n)
    a[n] = fx[n]
    for i in (n-1):-1:1
        a[i] = fx[i]
        for j in (i+1):n-1#?
            a[j] = a[j] - a[j+1] * x[i]
        end
    end
    return a
end

#funkcja rysujaca wykres wielomianu interpolacyjnego w postaci naturalnej oraz interpolowanej funkcji
function rysujNnfx(f, a::Float64, b::Float64, n::Int; wezly::Symbol = :rownoodlegle)
    x::Vector{Float64} = zeros(n+1)
    fWartosci::Vector{Float64} = zeros(n+1)

    if wezly == :rownoodlegle
        h::Float64 = (b - a) / n
        for i in 1:n+1
            x[i] = a + (i-1) * h
            fWartosci[i] = f(x[i])
        end
    elseif wezly == :czebyszew
        for i in 1:n+1
            x[i] = (a + b) / 2 + (b - a) / 2 * cos((2*(i-1) + 1) * pi / (2*(n+1)))
            fWartosci[i] = f(x[i])
        end
    else
        error("Nieznany typ wezlow interpolacyjnych")
    end

    c::Vector{Float64} = ilorazyRoznicowe(x, fWartosci)
    
    resolution = 10
    liczbaPunktow = resolution *n+1
    odstep::Float64 = (b - a) / (liczbaPunktow - 1)

    xWykres::Vector{Float64} = zeros(liczbaPunktow)
    funkcjaWykres::Vector{Float64} = zeros(liczbaPunktow)
    wielomianWykres::Vector{Float64} = zeros(liczbaPunktow)
    xWykres[1] = a
    funkcjaWykres[1] = fWartosci[1]
    wielomianWykres[1] = fWartosci[1]
    for i in 2:liczbaPunktow
        xWykres[i] = xWykres[i-1] + odstep
        funkcjaWykres[i] = f(xWykres[i])
        wielomianWykres[i] = warNewton(x, c, xWykres[i])
    end
    return plot(xWykres, [funkcjaWykres wielomianWykres], label = ["" ""], title = "", xlabel = "x", ylabel = "y")

end

end #module
