import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return 0.1*x**3 - x

# Initial bracket
a0, b0 = 1.0, 5.0

# Run 3 bisection iterations
a, b = a0, b0
history = []  # (iteration, a, b, m, f(a), f(b), f(m), a_new, b_new)

for i in range(1, 4):
    m = (a + b) / 2
    fa, fb, fm = f(a), f(b), f(m)

    # Decide which subinterval to keep
    if fa * fm < 0:
        a_new, b_new = a, m
    else:
        a_new, b_new = m, b

    history.append((i, a, b, m, fa, fb, fm, a_new, b_new))
    a, b = a_new, b_new

# Print iteration table
print("Iter |      a      |      b      |      m      |   f(a)    |   f(b)    |   f(m)    | kept interval")
print("-"*100)
for it, a_i, b_i, m_i, fa, fb, fm, a_k, b_k in history:
    print(f"{it:>4} | {a_i:>11.6f} | {b_i:>11.6f} | {m_i:>11.6f} | "
          f"{fa:>9.6f} | {fb:>9.6f} | {fm:>10.6f} | [{a_k:.6f}, {b_k:.6f}]")

# Plot function over the interval
x = np.linspace(a0, b0, 800)
y = f(x)

fig, ax = plt.subplots(figsize=(9, 5))
ax.plot(x, y, color="black", linewidth=2, label=r"$f(x)=0.1x^3-x$")
ax.axhline(0, color="gray", linewidth=1)

# Colors for each kept interval
colors = ["#4C78A8", "#F58518", "#54A24B"]  # blue, orange, green

# Shade kept intervals + mark endpoints and midpoints
for (it, a_i, b_i, m_i, fa, fb, fm, a_k, b_k), c in zip(history, colors):
    # shade the kept interval
    ax.axvspan(a_k, b_k, color=c, alpha=0.18, label=f"kept after iter {it}")

    # endpoints of current interval
    ax.scatter([a_i, b_i], [f(a_i), f(b_i)], color=c, s=40, zorder=3)

    # midpoint marker
    ax.scatter(m_i, fm, color=c, edgecolor="white", s=90, zorder=4)
    ax.text(m_i, fm, f"  m{it}={m_i:.3f}", color=c, va="bottom")

# Decorate plot
ax.set_title("Bisection Method on f(x)=0.1x^3 - x (3 iterations)")
ax.set_xlabel("x")
ax.set_ylabel("f(x)")
ax.set_xlim(a0, b0)
ax.grid(True, alpha=0.3)
ax.legend(loc="upper left")

# Save and show
plt.tight_layout()
plt.savefig("bisection_iterations.png", dpi=200)

print("\nSaved plot as 'bisection_iterations.png'")
