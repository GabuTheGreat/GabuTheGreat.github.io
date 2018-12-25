# -*- coding: utf-8 -*-
"""
Created on Tue Dec 25 10:55:16 2018

@author: Gabriel Mutua
"""

import pandas as pd

'''
DATA MANAGEMENT 
1) Load dataset
2) Get variables of interest Age and Spouse_alive
3) Remove nan value from the newly created dataframe
4) Create new column Spouse_Alive_Status which binary (1 if spouse is alive and 0 when not )
5) Write data again back to a .csv file
6) Check basic stats
'''
#1) Load dataset
all_data = pd.read_csv(r"C:\Users\Gabriel Mutua\Documents\GabuTheGreat.github.io\challange\Obituaries_Dataset.csv", encoding = "ISO-8859-1")

#2) Get variables of interest Age and Spouse_alive
all_data = all_data[['Age','Gender']]

#3) Remove nan value from the newly created dataframe
all_data = all_data.dropna(how='any',axis=0)

#Further clean up.Remove all rows with value "None"
all_data = all_data[all_data.Spouse_Alive != "None"]

#4) Create new column Spouse_Alive_Status which binary (1 if spouse is alive and 0 when not )
def gender_status(x):
    if "Male" in x:
        return 1
    elif "Female" in x:
        return 0
    else: return "nan"
    
all_data['gender_Status'] = all_data['Gender'].apply(gender_status)

#5) Write data again back to a .csv file
all_data.to_csv(r"C:\Users\Gabriel Mutua\Documents\GabuTheGreat.github.io\challange\survival_data.csv", sep=',', encoding='utf-8', index=False)

#6) Check basic stats for age column
all_data.describe()['Age']
all_data.head(10)
all_data.groupby("Spouse_Alive").mean()


#Getting data types of all columns
all_data.dtypes

#Taking the varibles to be used in the model.
all_data_machine = all_data[['Fundraising','Age','No_of_Children','No_of_Relatives']]

#Function to create new binary column 1 = Fundraising = Yes 0, fundraising = 0 
def fund_status(x):
    if "Yes" in x:
        return '1'
    elif "No" in x:
        return '0'
    else: return "nan"
    
all_data_machine['Fundraising_Status'] = all_data_machine['Fundraising'].apply(fund_status)

#Re-arranging the columns
all_data_machine = all_data_machine[['Age','No_of_Children','No_of_Relatives','Fundraising','Fundraising_Status']]
#Convert the data type of 'No_of_Relatives'
all_data_machine['No_of_Relatives'] = pd.to_numeric(all_data_machine['No_of_Relatives'],errors='coerce')
#Remove nan value from the newly created dataframe
all_data_machine = all_data_machine.dropna(how='any',axis=0)
all_data_machine.shape

all_data_machine.to_csv(r"C:\Users\Gabriel Mutua\Documents\GabuTheGreat.github.io\challange\survival_data.csv", sep=',', encoding='utf-8', index=False)

