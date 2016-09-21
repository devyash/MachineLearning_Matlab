import scipy.io as sio
from scipy import stats
import numpy as np
mat_data = sio.loadmat('training.mat')
#print mat_data.values()
a= np.array(mat_data['training'])
print a[1:11]
print len(a)
"""
y = np.random.random(10)
slope, intercept, r_value, p_value, std_err = stats.linregress(x,y)
#import matplotlib
#from pylab import *
#x=arrange(50)*2*pi/50
#y=sin(x)
#plot(y)
#x.label('index')
#show()
"""