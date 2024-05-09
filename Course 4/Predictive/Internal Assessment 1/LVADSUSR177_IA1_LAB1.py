# -*- coding: utf-8 -*-
"""LVADSUSR177_IA1_LAB1.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1qY-TDSjkC0lvvipKgW0WJQ1-DRn0B0vK

1.
"""

#importing the libraries
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import seaborn as sns
import matplotlib.pyplot as plt

#importing data as a dataframe
data=pd.read_csv("/content/expenses.csv")
data.head(5)

data.shape

data.isnull().sum()

"""Finding Duplicates"""

data.duplicated().sum()

"""Handling Duplicates"""

data.drop_duplicates(inplace=True)

data.shape

data.info()

data.describe()

data["region"].value_counts()

"""2."""

from sklearn.preprocessing import LabelEncoder
label_encoder=LabelEncoder()
data["region"]=label_encoder.fit_transform(data["region"])
data["sex"]=label_encoder.fit_transform(data["sex"])
data["smoker"]=label_encoder.fit_transform(data["smoker"])
data.head(5)

data.isnull().sum()

"""Finding Outliers using box plots"""

#identifying outlier
sns.boxplot(data["age"])
plt.show()

sns.boxplot(data["bmi"])
plt.show()

sns.boxplot(data["charges"])
plt.show()

"""Handling Outliers"""

# to remove outliers
from scipy import stats
import numpy as np
zs=stats.zscore(data)
zs=np.abs(zs)
zs=zs>3
data=data[~zs]

data.isnull().sum()

"""Handling Null Values"""

data.dropna(inplace=True)

data.isnull().sum()

data.shape

data.info()

"""3."""

#for feature selection
plt.figure(figsize=(10,6))
sns.heatmap(data.corr(),annot=True,cmap="viridis")
plt.show()

"""Exploring the relation of Charges column with other columns"""

# to identify how charges are dependent on other columns
sns.pairplot(data,y_vars="charges")

"""No column will be dropped as charges are somewhar correlated to every other column."""

#splitting features and labels
X=data.drop(columns='charges') #feature
y=data["charges"] #label

X.isnull().sum()

"""4."""

#splitting train and test dataset
from sklearn.preprocessing import StandardScaler
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.2,random_state=42)

st_x= StandardScaler()
X_train= st_x.fit_transform(X_train)
X_test= st_x.transform(X_test)

"""5."""

model=LinearRegression()
model.fit(X_train,y_train)
prediction=model.predict(X_test)

"""6."""

from sklearn.metrics import r2_score,mean_squared_error,mean_absolute_error
print("r2_score:",r2_score(y_test,prediction))
print("mean_squared_error:",mean_squared_error(y_test,prediction))
print("mean_absolute_error",mean_absolute_error(y_test,prediction))
print("root_mean_square_eror: ",np.sqrt(mean_squared_error(y_test,prediction)))

"""Exploring Predictions"""

pred_data=pd.DataFrame({"y_test":y_test,"prediction":prediction})
sns.scatterplot([pred_data["y_test"],pred_data["y_test"]])

sns.scatterplot([pred_data["y_test"],pred_data["prediction"]])