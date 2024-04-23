# -*- coding: utf-8 -*-
"""LVADSUSR177_Prateek.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1dRRjTmhdHxDyGLSoN3dJYt3rdpZEqO5H
"""

import numpy as np

"""#1."""

arr = [1,2,3,4,5,6,7,8,9]

arr = np.array(arr)

print("Sum: ", arr.sum())
print("Maximum Value: ", arr.max())
print("Minimum Value: ", arr.min())
print("Mean Value: ", arr.mean())
print("Standard Deviation: ", arr.std())

"""#2.

"""

from sklearn.preprocessing import StandardScaler

def normalize_data(health_data):
    sc = StandardScaler()
    normal_data = sc.fit_transform(health_data)
    return normal_data

health_data = np.array([[160, 70, 30], [165, 65, 35], [170, 75, 40]])
normal_data = normalize_data(health_data)
print(normal_data)

"""#3."""

import numpy as np

#Sample:
scores = np.array([
    [85, 90, 95, 80, -1, 75],
    [80, 85, 90, 85, 90, 95],
    [75, 80, 85, 90, 95, 100],
    [-1, 75, 80, 85, 90, 95],
    [70, 75, 80, -1, 85, 90]
])


last_three_subjects = scores[:, -3:]

last_three_subjects = np.where(last_three_subjects == -1, np.nan, last_three_subjects)

average_scores = np.nanmean(last_three_subjects, axis=1)

print(average_scores)

"""#4."""

import numpy as np

temp_readings = np.linspace(15, 25, 24)

print(temp_readings)

"""#5."""

import numpy as np
import pandas as pd
daily_closing_prices = np.array([100,102,98,105,107,110,108,112,115,118,120])
window_size = 5

df = pd.DataFrame([100,102,98,105,107,110,108,112,115,118,120])

df['rollings'] = df.rolling(window=5).std()
df

"""#6."""

import numpy as np

mean = [0, 0]
covar = [[1, 0.5], [0.5, 2]]

data = np.random.multivariate_normal(mean, covar, 100)
print(data)

"""#7.

"""

import numpy as np

properties_matrix = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

det = np.linalg.det(properties_matrix)

print("The determinant : ", det)

"""#8."""

import numpy as np

array = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

filter_array = array[array > 5]

print(filter_array)

"""#9.

"""

import pandas as pd

df = pd.DataFrame({
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace'],
    'Age': [25, 30, 35, 40, 45, 50, 55],
    'City': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Miami', 'Boston'],
    'Department': ['HR', 'IT', 'Finance', 'Marketing', 'Sales', 'IT', 'HR']
})

filter_df = df[(df['Age'] < 45) & (df['Department'] != 'HR')]

res = filter_df[['Name', 'City']]

print(res)

"""#10.

"""

import pandas as pd

df = pd.DataFrame({
    'Department': ['Electronics', 'Electronics', 'Clothing', 'Clothing', 'Home Goods'],
    'Salesperson': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Sales': [70000, 50000, 30000, 40000, 60000]
})

average_sales = df.groupby('Department')['Sales'].mean()

average_sales_rank = average_sales.rank(ascending=False)

print("Average Sales:\n", average_sales)
print("\nRank of Departments based on Average Sales:\n", average_sales_rank)

"""#11."""

import pandas as pd

df = pd.DataFrame({
    'Product': ['Apples', 'Bananas', 'Cherries', 'Dates', 'Elderberries', 'Flour', 'Grapes'],
    'Category': ['Fruit', 'Fruit', 'Fruit', 'Fruit', 'Fruit', 'Bakery', 'Fruit'],
    'Price': [1.20, 0.50, 3.00, 2.50, 4.00, 1.50, 2.00],
    'Promotion': [True, False, True, True, False, True, False]
})

fruit_df = df[df['Category'] == 'Fruit']

avg_price = fruit_df['Price'].mean()

res = fruit_df[(fruit_df['Price'] > avg_price) & (fruit_df['Promotion'] == False)]

print(res)

"""#12."""

import pandas as pd

employee_df = pd.DataFrame({
    'Employee': ['Alice', 'Bob', 'Charlie', 'David'],
    'Department': ['HR', 'IT', 'Finance', 'IT'],
    'Manager': ['John', 'Rachel', 'Emily', 'Rachel']
})

project_df = pd.DataFrame({
    'Employee': ['Alice', 'Charlie', 'Eve'],
    'Project': ['P1', 'P3', 'P2']
})

merged_df = pd.merge(employee_df, project_df, on='Employee', how='left')

print(merged_df)

"""#13.


"""

import pandas as pd
df = pd.read_csv('/content/Q13_sports_team_stats.csv')

df['WinRatio'] = df['Wins'] / df['GamesPlayed']

df['AvgScorePerGame'] = df['TeamID'] / df['GamesPlayed']

df['AvgGoalsPerPlayer'] = df['Wins'] / df['TeamID']

print(df)

"""#14."""

import pandas as pd

df = pd.read_csv('/content/Q14_customer_purchases.csv')

before_df = df[df['LoyaltyProgramSignUp'] == False]
after_df = df[df['LoyaltyProgramSignUp'] == True]

average_before = before_df['PurchaseAmount'].mean()
average_after = after_df['PurchaseAmount'].mean()

if average_after > average_before:
    print("The loyalty program appears to be effective.")
else:
    print("The loyalty program does not appear to be effective.")

"""#15.


"""

import pandas as pd

df = pd.read_csv('/content/Q15_student_grades.csv')

average_grades = df.groupby('Subject')['Grade'].mean()

subjects_need_support = average_grades[average_grades < 85]

print("Average Grades:\n", average_grades)
print("\nSubjects that need educational support:\n", subjects_need_support)
