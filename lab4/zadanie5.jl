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
    savefig("sinx2_n_$n.png")
end
