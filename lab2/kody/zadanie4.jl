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

#postac iloczynowa wielomianu
function P(x)
    wynik = 1.0
    for k in 1:20
        wynik *= (x - k)
    end
    return wynik
end

function obliczPierwiastki(coeffs)
    p = Polynomial(coeffs)
    pierwiastki = roots(p)

    @printf("k, z_k, abs(z_k - k), p(z_k), P(z_k)\n")
    for k in 1:length(coeffs)-1
        z = pierwiastki[k]
        z_eff = isreal(z) ? real(z) : abs(z)

        odleglosc = abs(z_eff - k)
        pval = p(z_eff)
        Pval = P(z_eff)   

        @printf("%d, %.5f, %.5e, %.5e, %.5e\n", k, z_eff, odleglosc, abs(pval), abs(Pval))
    end
end


obliczPierwiastki(coeffs)

#zaburzenie danych
coeffs[20] += 1/(2^23)
#@printf("%f\n", coeffs[20])
obliczPierwiastki(coeffs)
