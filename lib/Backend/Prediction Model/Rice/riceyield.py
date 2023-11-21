import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cluster import AffinityPropagation

rice = pd.read_csv('RICE.csv')

X= rice.iloc [:,1:5] 
y= rice.iloc [:, -1 :]

df = pd.DataFrame(rice)

df.replace([np.inf, -np.inf], np.nan, inplace=True)
df = df.fillna(0)

X = np.nan_to_num(X)
y = np.nan_to_num(y)

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.05)

from sklearn.ensemble import RandomForestRegressor
 
 # create regressor object
regressor = RandomForestRegressor(n_estimators = 500, random_state = 50)
 
# fit the regressor with x and y data
regressor.fit(X,y) 

import pickle
pickle.dump(regressor,open('riceModel.pkl','wb'))
#Loading model to compare the results)
model = pickle.load(open('riceModel.pkl','rb'))
print(model.predict([[2,3,4,5]]))

