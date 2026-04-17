import pandas as pd

# 1. Define the file path
file_path = r'/direction'
df = pd.read_excel(file_path) 

# Define the target column name
column_name = 'Which apps consume the most of your time?'

# 2. Basic cleaning: remove leading and trailing spaces
df[column_name] = df[column_name].str.strip()

# 3. Mapping dictionary to unify different spellings
mapping = {
    'Youtyoub': 'Youtube',
    'YouTube': 'Youtube',
    'Youtube': 'Youtube',
    'يوتيوب': 'Youtube',
    'both WhatsApp and twitter': 'WhatsApp',
    'WhatsApp': 'WhatsApp',
    'Tiktok': 'Tiktok',
    'Tiktok ': 'Tiktok',
    'TikTok': 'Tiktok',
    'tellenyom': 'Tellonym'
}

# 4. Execute the replacement
df[column_name] = df[column_name].replace(mapping)

# 5. Backup step: unify any value containing 'yout' into 'Youtube'
df.loc[df[column_name].str.contains('yout', case=False, na=False), column_name] = 'Youtube'

# 6. Save the cleaned data to a new Excel file
output_path = r'C:\Users\T.B\Desktop\final_project\final_cleaned.xlsx'
df.to_excel(output_path, index=False)

# Print execution results
print("Column cleaned successfully")
print("Unique values in the column:")
print(df[column_name].unique())
