import pandas as pd 
  
# reading given csv file  
# and creating dataframe 
websites = pd.read_csv("2023/day_1/input.txt",header = None) 

  
# store dataframe into csv file 
websites.to_csv('input.csv',index = None)