import pyodbc 
from flask import Flask, jsonify

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-P75CUH1\SQLEXPRESS;'
                      'Database=AdventureWorksDW2019;'
                      'Trusted_Connection=yes;')


cursor = conn.cursor()

# cursor.execute('SELECT TOP (100) [CustomerKey], [FirstName], [MiddleName], [LastName] FROM [AdventureWorksDW2019].[dbo].[DimCustomer]')

# names = []
# lastnames = []
# for row in cursor:
#     names.append({row.CustomerKey: row.FirstName})
#     lastnames.append({row.CustomerKey: row.LastName})
     

app = Flask(__name__)

@app.route('/')

def query1():
    cursor.execute('SELECT TOP (100) [CustomerKey], [FirstName], [MiddleName], [LastName] FROM [AdventureWorksDW2019].[dbo].[DimCustomer]')
    


@app.route('/last/')

def last_names():

    return jsonify(lastnames)


if __name__ == '__main__':
   app.run()


