import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

colors = ['blue', 'pink', 'green', 'yellow', 'violet', 'orange']

df = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q.xlsx')

fig, ax = plt.subplots()
x = df['payment']
y = df['Count']
ax.bar(x, y, color=sns.color_palette('tab20'), width=0.4)
for i, value in enumerate(df['Count']):
    plt.text(i, value + 1, str(value), ha='center', va='bottom')
plt.title("Popular Mode of Payment")
plt.xlabel('Payment Method')
plt.ylabel('Count')
plt.show()

df1 = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q1.xlsx')

fig, ax = plt.subplots()
x = df1['product_line']
y = df1['Number of Item Sold']
ax.bar(x, y, color=sns.color_palette('inferno'), width=0.4)
for i, value in enumerate(df1['Number of Item Sold']):
    plt.text(i, value + 1, str(value), ha='center', va='baseline')
plt.title("Sales per Product Line")
plt.xlabel('Product Line Categories')
plt.ylabel('Sales Count')
plt.show()

df2 = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q2.xlsx')

label = df2['month_name']
value = df2['Total revenue']
explode = (0.05, 0, 0)
fig, ax = plt.subplots()
ax.pie(value, labels=label, autopct='%1.2f%%', explode=explode, shadow=True, startangle=90,
       colors=sns.color_palette("hls", 8), textprops={'size': 'smaller'}, radius=1)
plt.show()

df3 = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q3.xlsx')

fig, ax = plt.subplots()
month = df3['Month']
y_pos = np.arange(len(month))
value = df3['Number of COGS']

ax.barh(y_pos, value, align='center', color=colors)
ax.set_yticks(y_pos, labels=month)
ax.invert_yaxis()
plt.title("Months with the highest count of cogs")
plt.show()

df4 = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q4.xlsx')

fig, ax = plt.subplots()
x = df4['product_line']
y = df4['Revenue']

ax.bar(x, y, align='center', color=sns.color_palette('Set2'))
for i, value in enumerate(df4['Revenue'].round(2)):
    plt.text(i, value + 1, str(value), ha='center', va='bottom')
# ax.invert_xaxis()
plt.title("Income per Product Line")
plt.xlabel('Revenue')
plt.ylabel("Product Category")
plt.ylim(0, 60000)
plt.show()

df5 = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q5.xlsx')

fig, ax = plt.subplots()
x = df5['branch']
y = df5['Total Revenue']

ax.bar(x, y, align='center', color=sns.color_palette('flare'))
for i, value in enumerate(df5['Total Revenue'].round(2)):
    plt.text(i, value + 1, str(value), ha='center', va='bottom')
# ax.invert_xaxis()
plt.title("Branch with the highest total revenue")
plt.xlabel('Branch Code')
plt.ylabel("Total Revenue")
plt.show()

df6 = pd.read_excel(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\q6.xlsx')
# -----------sdfmsnfksd--------------------

dw = pd.read_csv(r'C:\Users\User\Downloads\WALMARDATAANALYSIS\WalmartSalesData.csv')
del dw['gross margin percentage']

dw_corr_data = dw.corr(numeric_only=True)

plt.figure(figsize=(8, 6))
sns.heatmap(dw_corr_data, cmap='viridis', annot=True, fmt=".2f", cbar_kws={'label': 'Color Scale'})
plt.xlabel('X Axis')
plt.ylabel('Y Axis')
plt.title('Heatmap using Seaborn')
plt.show()

# WE CAN SAY THAT VAT IS HIGH CORRELATED TO THE TOTAL, COGS, AND GROSS INCOME
# SAME WITH THE NUMBER OF QUANTITY IS IT ALSO CORRELATED TO VAT, TOTAL, COGS, AND GROSS INCOME