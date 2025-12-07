#Jakub Kogut
include("interpolacja.jl")
using Plots
using .Interpolacja

for n in [5, 10, 15]
    rysujNnfx(x->exp(x), 0.0, 1.0, n)
    title!("Wykres dla f(x) = exp(x) z n = $n")
    xlabel!("x")
    ylabel!("Nn(x), f(x)")
    savefig("exp_n_$n.png")

    rysujNnfx(x->sin(x)*x^2, -1.0, 1.0, n)
    title!("Wykres dla f(x) = sin(x)*x^2 z n = $n")
    xlabel!("x")
    ylabel!("Nn(x), f(x)")
    savefig("x2sinx_n_$n.png")

    rysujNnfx(x->abs(x), -1.0, 1.0, n)
    title!("Wykres dla f(x) = |x| z n = $n")
    xlabel!("x")
    ylabel!("Nn(x), f(x)")
    savefig("abs_rowne_$n.png")

    rysujNnfx(x->abs(x), -1.0, 1.0, n, wezly=:czebyszew)
    title!("Wykres dla f(x) = |x| z n = $n, wezly Czebyszewa")
    xlabel!("x")
    ylabel!("Nn(x), f(x)")
    savefig("abs_czebyszew_$n.png")

    rysujNnfx(x->1/(1+x^2), -5.0, 5.0, n)
    title!("Wykres dla f(x) = 1/(1+x^2) z n = $n")
    xlabel!("x")
    ylabel!("Nn(x), f(x)")
    savefig("wielomian_rowne$n.png")

    rysujNnfx(x->1/(1+x^2), -5.0, 5.0, n, wezly=:czebyszew)
    title!("Wykres dla f(x) = 1/(1+x^2) z n = $n, wezly Czebyszewa")
    xlabel!("x")
    ylabel!("Nn(x), f(x)")
    savefig("wielomian_czebyszew_$n.png")
end
