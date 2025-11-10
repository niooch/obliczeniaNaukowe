#Jakub Kogut
using Printf
function xF(c::Float64, prev::Float64)
    return prev*prev + c
end

function iterate(c::Float64, x0::Float64)
    for i in 1:40
        x0 = xF(c, x0)
        @printf("%2d %8e\n", i, x0)
    end
end

function main()
    @printf("c=-2, x0=1:\n")
    iterate(-2.0, 1.0)
    @printf("c=2, x0=2:\n")
    iterate(2.0, 2.0)
    @printf("c=-2, x0=1.99999999999999:\n")
    iterate(-2.0, 1.99999999999999)
    @printf("c=-1, x0=1:\n")
    iterate(-1.0, 1.0)
    @printf("c=-1, x0=-1:\n")
    iterate(-1.0, -1.0)
    @printf("c=-1, x0=0.75:\n")
    iterate(-1.0, 0.75)
    @printf("c=-1, x0=0.25:\n")
    iterate(-1.0, 0.25)
end
main()
