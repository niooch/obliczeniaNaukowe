#Jakub Kogut
using Printf
function pF32(p::Float32, r::Float32)
    nextP::Float32 = p + r*p*(1-p)
    return nextP
end

function pF64(p::Float64, r::Float64)
    nextP::Float64 = p + r*p*(1-p)
    return nextP
end


#Zadanie b: run dla Float32 40 iteracji
function main()
    r32 = Float32(3.0)
    r64 = Float64(3.0)

    p32 = Float32(0.01)
    pStopped32 = Float32(0.01)
    p64 = Float64(0.01)

    #10 iteracji
    @printf("i, pF32, pF32 stopped, pF64\n")
    for i in 1:10
        p32 = pF32(p32, r32)
        pStopped32 = pF32(pStopped32, r32)
        p64 = pF64(p64, r64)
        @printf("%d, %.7f, %.7f, %.15f\n", i, p32, pStopped32, p64)
    end
    #ustaw pStopped32 na wartość p32 po 10 iteracjach
    pStopped32 = Float32(0.722)
    #kolejne 30 iteracji
    for i in 11:40
        p32 = pF32(p32, r32)
        pStopped32 = pF32(pStopped32, r32)
        p64 = pF64(p64, r64)
        @printf("%d, %.7f, %.7f, %.15f\n", i, p32, pStopped32, p64)
    end

end
main()

