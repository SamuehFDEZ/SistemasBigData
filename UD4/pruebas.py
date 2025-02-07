import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


x = np.linspace(0, 10, 20)
print(x)
plt.plot(x, np.sin(x))
plt.plot(x, np.cos(x))
plt.show()