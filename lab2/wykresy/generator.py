#!/usr/bin/env python3
import argparse
import math
import numpy as np
import matplotlib.pyplot as plt

def cobweb_plot(outfile: str, c: float, x0: float, iters: int = 20):
    def f(x): return x * x + c

    # Zbuduj segmenty cobweb
    segments = []
    x_n = x0
    for n in range(iters):
        y_vert = f(x_n)
        # pionowy: (x_n, 0) (dla n=0) lub (x_n, x_n) (dla n>0) -> (x_n, f(x_n))
        y_start = x_n if n > 0 else 0.0
        segments.append(([x_n, x_n], [y_start, y_vert]))
        # poziomy: (x_n, f(x_n)) -> (f(x_n), f(x_n))
        segments.append(([x_n, y_vert], [y_vert, y_vert]))

        x_n = y_vert
        if not math.isfinite(x_n):
            break

    # Zakresy rysunku (sztywne)
    x_min, x_max = -4.0, 4.0
    y_min, y_max = -3.0, 3.0

    X = np.linspace(x_min, x_max, 1200)
    Y = X**2 + c

    plt.figure(figsize=(7, 5.5))
    plt.plot(X, Y, label=r"$y=x^2+c$")
    plt.plot(X, X, linestyle="--", label=r"$y=x$")

    for (xp, yp) in segments:
        plt.plot(xp, yp, linewidth=1.2)

    plt.scatter([x0], [0.0], s=30)

    plt.xlim(x_min, x_max)
    plt.ylim(y_min, y_max)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.title(rf"Cobweb: $x_{{n+1}}=x_n^2+c$, $c={c}$, $x_0={x0}$, iteracje={len(segments)//2}")
    plt.legend(loc="best")
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig(outfile, dpi=150)
    plt.close()

def main():
    parser = argparse.ArgumentParser(description="Cobweb dla x_{n+1} = x_n^2 + c")
    parser.add_argument("outfile", type=str, help="Nazwa pliku wyjściowego (np. wykres.png/pdf)")
    parser.add_argument("c", type=float, help="Parametr c")
    parser.add_argument("x0", type=float, help="Punkt startowy x0")
    parser.add_argument("--iters", type=int, default=20, help="Liczba iteracji (domyślnie 20)")
    args = parser.parse_args()

    cobweb_plot(args.outfile, args.c, args.x0, iters=args.iters)

if __name__ == "__main__":
    main()
