#Jakub Kogut
using Polynomials
using Printf 
coeffs = [
    2432902008176640000.0,
    -8752948036761600000.0,
    13803759753640704000.0, 
    -12870931245150988800.0,
    8037811822645051776.0, 
    -3599979517947607200.0,
    1206647803780373360.0, 
    -311333643161390640.0,
    63030812099294896.0, 
    -10142299865511450.0,
    1307535010540395.0, 
    -135585182899530.0,
    11310276995381.0, 
    -756111184500.0,
    40171771630.0,
    -1672280820.0,
    53327946.0, 
    -1256850.0,
    20615.0,
    -210.0,
    1.0, 
]


wilkinsonRozszerzenie= Polynomial(coeffs)

function wilkinson(x)
    result = 1.0
    for k in 1:20
        result *= (x - k)
    end
    return result
end

#znajdz pierwiastki w postaci rozszerzonej
iloczyn = roots(wilkinsonRozszerzenie)
println("Pierwiastki wielomianu Wilkinsona w postaci rozszerzonej:")
for r in iloczyn
    @printf("%.10f\n", r)
end

