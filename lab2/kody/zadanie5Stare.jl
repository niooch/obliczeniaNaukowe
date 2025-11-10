#Jakub Kogut

using Printf

x = [2.718281828, −3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = [1486.2497, 878366.9879, −22.37492, 4773714.647, 0.000185049]

xFl32 = [Float32(2.718281828), Float32(−3.141592654), Float32(1.414213562), Float32(0.5772156649), Float32(0.3010299957)]
yFl32 = [Float32(1486.2497), Float32(878366.9879), Float32(−22.37492), Float32(4773714.647), Float32(0.000185049)]

function wPrzodFloat32(x, y)::Float32
    wynik = Float32(0.0)
        if length(x) == length(y)
            for i in 1:length(x)
                wynik += x[i] * y[i]
            end
        end
    return wynik
end

function wPrzodFloat64(x, y)::Float64
    wynik = 0.0
        if length(x) == length(y)
            for i in 1:length(x)
                wynik += x[i] * y[i]
            end
        end
    return wynik
end

function wTylFloat32(x, y)::Float32
    wynik = Float32(0.0)
        if length(x) == length(y)
            for i in length(x):-1:1
                wynik += x[i] * y[i]
            end
        end
    return wynik
end

function wTylFloat64(x, y)::Float64
    wynik = 0.0
        if length(x) == length(y)
            for i in length(x):-1:1
                wynik += x[i] * y[i]
            end
        end
    return wynik
end

function ascSortFloat32(x, y)::Float32
    wynikNeg = Float32(0.0)
    wynikPos = Float32(0.0)
        if length(x) == length(y)
            iloczyny = Array{Float32}(undef, length(x))
            for i in 1:length(x)
                iloczyny[i] = x[i] * y[i]
            end
            sort!(iloczyny)
            for i in 1:length(iloczyny)
                if iloczyny[i] > 0
                    wynikPos += iloczyny[i]
                end
            end
            for i in length(iloczyny):-1:1
                if iloczyny[i] < 0
                    wynikNeg += iloczyny[i]
                end
            end
        end
    return wynikPos + wynikNeg
end

function ascSortFloat64(x, y)::Float64
    wynikNeg = 0.0
    wynikPos = 0.0
        if length(x) == length(y)
            iloczyny = Array{Float64}(undef, length(x))
            for i in 1:length(x)
                iloczyny[i] = x[i] * y[i]
            end
            sort!(iloczyny)
            for i in 1:length(iloczyny)
                if iloczyny[i] > 0
                    wynikPos += iloczyny[i]
                end
            end
            for i in length(iloczyny):-1:1
                if iloczyny[i] < 0
                    wynikNeg += iloczyny[i]
                end
            end
        end
    return wynikPos + wynikNeg
end

function descSortFloat32(x, y)::Float32
    wynikNeg = Float32(0.0)
    wynikPos = Float32(0.0)
        if length(x) == length(y)
            iloczyny = Array{Float32}(undef, length(x))
            for i in 1:length(x)
                iloczyny[i] = x[i] * y[i]
            end
            sort!(iloczyny, rev=true)
            for i in 1:length(iloczyny)
                if iloczyny[i] > 0
                    wynikPos += iloczyny[i]
                end
            end
            for i in length(iloczyny):-1:1
                if iloczyny[i] < 0
                    wynikNeg += iloczyny[i]
                end
            end
        end
    return wynikPos + wynikNeg
end

function descSortFloat64(x, y)::Float64
    wynikNeg = 0.0
    wynikPos = 0.0
        if length(x) == length(y)
            iloczyny = Array{Float64}(undef, length(x))
            for i in 1:length(x)
                iloczyny[i] = x[i] * y[i]
            end
            sort!(iloczyny, rev=true)
            for i in 1:length(iloczyny)
                if iloczyny[i] > 0
                    wynikPos += iloczyny[i]
                end
            end
            for i in length(iloczyny):-1:1
                if iloczyny[i] < 0
                    wynikNeg += iloczyny[i]
                end
            end
        end
    return wynikPos + wynikNeg
end

println("Float32:")
@printf("Wynik wPrzod: %.7e\n", wPrzodFloat32(xFl32, yFl32))
@printf("Wynik wTyl: %.7e\n", wTylFloat32(xFl32, yFl32))
@printf("Wynik ascSort: %.7e\n", ascSortFloat32(xFl32, yFl32))
@printf("Wynik descSort: %.7e\n", descSortFloat32(xFl32, yFl32))
println("\nFloat64:")
@printf("Wynik wPrzod: %.15e\n", wPrzodFloat64(x, y))
@printf("Wynik wTyl: %.15e\n", wTylFloat64(x, y))
@printf("Wynik ascSort: %.15e\n", ascSortFloat64(x, y))
@printf("Wynik descSort: %.15e\n", descSortFloat64(x, y))

