import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return 0.1*x**3 - x

def fp(x):
    return 0.3*x**2 - 1  # derivative of f

# Interval for plotting
xmin, xmax = 1.0, 5.0

# Newton method settings
x0 = 4.5
n_iters = 3

# Run Newton iterations
xs = [x0]
history = []  # (it, x_n, f(x_n), f'(x_n), x_{n+1})

for it in range(1, n_iters + 1):
    x_n = xs[-1]
    fx = f(x_n)
    fpx = fp(x_n)
    x_next = x_n - fx / fpx

    history.append((it, x_n, fx, fpx, x_next))
    xs.append(x_next)

# Print iteration table
print("Iter |   x_n      |  f(x_n)     | f'(x_n)    |  x_{n+1}")
print("-"*70)
for it, x_n, fx, fpx, x_next in history:
    print(f"{it:>4} | {x_n:>9.6f} | {fx:>11.6f} | {fpx:>10.6f} | {x_next:>9.6f}")

# Prepare function curve
x_plot = np.linspace(xmin, xmax, 800)
y_plot = f(x_plot)

fig, ax = plt.subplots(figsize=(9, 5))
ax.plot(x_plot, y_plot, color="black", linewidth=2, label=r"$f(x)=0.1x^3-x$")
ax.axhline(0, color="gray", linewidth=1)

# Colors per iteration
colors = ["#4C78A8", "#F58518", "#54A24B"]  # blue, orange, green

for (it, x_n, fx, fpx, x_next), c in zip(history, colors):
    # Tangent line at x_n: y = fx + fpx*(x - x_n)
    y_tan = fx + fpx * (x_plot - x_n)
    ax.plot(x_plot, y_tan, color=c, alpha=0.8, linewidth=1.8,
            label=f"tangent at x{it-1}")

    # Point on curve
    ax.scatter(x_n, fx, color=c, s=70, zorder=4)
    ax.text(x_n, fx, f"  x{it-1}={x_n:.4f}", color=c, va="bottom")

    # Show Newton step: go to x-axis at x_next
    ax.plot([x_n, x_next], [fx, 0], color=c, linestyle="--", linewidth=1.5)
    ax.scatter(x_next, 0, color=c, edgecolor="white", s=90, zorder=5)
    ax.text(x_next, 0, f"  x{it}={x_next:.4f}", color=c, va="bottom")

# Decorations
ax.set_title("Newton's Method on f(x)=0.1x^3 - x (3 iterations)")
ax.set_xlabel("x")
ax.set_ylabel("f(x)")
ax.set_ylim(-2, 6)
ax.margins(y=0.1)
ax.set_aspect('auto')

ax.grid(True, alpha=0.3)
ax.legend(loc="upper left")

# Save and show
plt.tight_layout()
plt.savefig("newton_iterations.png", dpi=200)

print("\nSaved plot as 'newton_iterations.png'")

