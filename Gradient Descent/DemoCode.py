
#Importing essential libraries
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

# Dimesion of x
n_dim = 2

def get_value(x):
    """
    Arguments:
    x: 1 dimensional numpy array as input.
    Returns:
    f(x) : a scalar
    """
    A = np.array([[5.,4],[4,5.]])
    b = np.array([7.,2.])
    return 0.5*np.dot(x, np.dot(A,x)) - np.dot(b,x)

def get_gradient(x):
    """
    Arguments:
    x: 1 dimensional numpy array as input.

    Returns:
    grad f(x) : numpy array with same 1-dimensional shape as input x
    """
    A = np.array([[5.,4],[4.,5.]])
    b = np.array([7.,2.])
    return np.dot(A,x) - b
def gradient_descent_update(x, alpha):
    """
    Arguments:
    x: 1 dimensional numpy array as input. Representing x_t
    alpha: step size

    Returns:
    x_next: 1-dimensional numpy array with same shape as x.
    Representing one Gradient descent step with constant step size eta
    """
    grad = get_gradient(x)
    return x - alpha*grad

#random initialisation of x
x = np.zeros((n_dim)) + np.random.randn(n_dim)*0.1
alpha = 0.2 #step size
n = 20      #number of iterations

f_vals = []  #list to store function value
x_list = []  #list to store x updates

#performing n iterations
for i in range(n):
    x_list.append(x)
    f_vals.append(get_value(x))
    x = gradient_descent_update(x=x, alpha = alpha)

print(x_list)
print(f_vals)

#Please find the plotting functions in the
# Ipython Notebook
