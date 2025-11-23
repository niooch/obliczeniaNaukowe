import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return 0.1*x**3 - x

# Plot interval
xmin, xmax = 1.0, 5.0

# Secant initial guesses (inside 1–5)
x0, x1 = 3.9, 4.0
n_iters = 2

history = []  # (it, x_{n-1}, x_n, x_{n+1}, f(x_{n-1}), f(x_n), f(x_{n+1}))

# Run secant iterations
for it in range(1, n_iters + 1):
    f0, f1 = f(x0), f(x1)
    x2 = x1 - f1*(x1 - x0)/(f1 - f0)
    f2 = f(x2)

    history.append((it, x0, x1, x2, f0, f1, f2))

    # shift for next iteration
    x0, x1 = x1, x2

# Print iteration table
print("Iter | x_{n-1}   | x_n       | x_{n+1}   | f(x_{n-1}) | f(x_n)    | f(x_{n+1})")
print("-"*90)
for it, xa, xb, xc, fa, fb, fc in history:
    print(f"{it:>4} | {xa:>9.6f} | {xb:>9.6f} | {xc:>9.6f} | "
          f"{fa:>11.6f} | {fb:>10.6f} | {fc:>11.6f}")

# Prepare function curve
x_plot = np.linspace(xmin, xmax, 800)
y_plot = f(x_plot)

fig, ax = plt.subplots(figsize=(9, 5))
ax.plot(x_plot, y_plot, color="black", linewidth=2, label=r"$f(x)=0.1x^3-x$")
ax.axhline(0, color="gray", linewidth=1)

# Colors per iteration
colors = ["#4C78A8", "#F58518", "#54A24B"]  # blue, orange, green

for (it, xa, xb, xc, fa, fb, fc), c in zip(history, colors):
    # Secant line between (xa, fa) and (xb, fb)
    ax.plot([xa, xb], [fa, fb], color=c, linewidth=2.2, label=f"secant iter {it}")

    # Mark the two points used for the secant
    ax.scatter([xa, xb], [fa, fb], color=c, s=70, zorder=4)

    ax.text(xa, fa, f"  x{it-1}={xa:.3f}", color=c, va="bottom")
    ax.text(xb, fb, f"  x{it}={xb:.3f}", color=c, va="bottom")

    # Show where secant hits x-axis -> next iterate
    ax.scatter(xc, 0, color=c, edgecolor="white", s=110, zorder=5)
    ax.text(xc, 0, f"  x{it+1}={xc:.3f}", color=c, va="bottom")

    # Dashed guide from (xb, fb) down to (xc, 0)
    ax.plot([xb, xc], [fb, 0], color=c, linestyle="--", linewidth=1.5)

# Decorations
ax.set_title("Secant Method on f(x)=0.1x^3 - x (3 iterations)")
ax.set_xlabel("x")
ax.set_ylabel("f(x)")
ax.set_xlim(xmin, xmax)

# Stretch y-axis exactly as you wanted
ax.set_ylim(-2, 3)
ax.margins(y=0)
ax.set_aspect('auto')

ax.grid(True, alpha=0.3)
ax.legend(loc="upper left")

plt.tight_layout()
plt.savefig("secant_iterations.png", dpi=200)

print("\nSaved plot as 'secant_iterations.png'")

