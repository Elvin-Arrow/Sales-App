import pyodbc 
from flask import Flask, jsonify

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-P75CUH1\SQLEXPRESS;'
                      'Database=AdventureWorksDW2019;'
                      'Trusted_Connection=yes;')


cursor = conn.cursor()

# select = 'SELECT sum([dollars_sold]) as TotalSales, [country], [city] '
# dfrom = 'FROM [Test].[dbo].[saleFact] JOIN [Test].[dbo].[locationDimension] ON [Test].[dbo].[saleFact].[location_key] = [Test].[dbo].[locationDimension].[location_key] '
# group = 'GROUP BY [Test].[dbo].[locationDimension].[country], [Test].[dbo].[locationDimension].[city]'
# query = select + dfrom + group
# print(query)
# cursor.execute(query)

# for row in cursor:
#     print(row)

# cursor.execute('SELECT TOP (100) [CustomerKey], [FirstName], [MiddleName], [LastName] FROM [AdventureWorksDW2019].[dbo].[DimCustomer]')

# names = []
# lastnames = []
# for row in cursor:
#     names.append({row.CustomerKey: row.FirstName})
#     lastnames.append({row.CustomerKey: row.LastName})
     

app = Flask(__name__)

@app.route('/')
def query1():
    temp = []
    select = 'SELECT sum([dollars_sold]) as totalSales, [country], [city] '
    dfrom = 'FROM [Test].[dbo].[saleFact] JOIN [Test].[dbo].[locationDimension] ON [Test].[dbo].[saleFact].[location_key] = [Test].[dbo].[locationDimension].[location_key] '
    group = 'GROUP BY [Test].[dbo].[locationDimension].[country], [Test].[dbo].[locationDimension].[city]'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"totalSales": row.totalSales, "country": row.country, "city": row.city})

    response = jsonify(temp)

     # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

    


@app.route("/cities")
def cities():

    temp = []
    select = 'SELECT [city] '
    dfrom = 'FROM [Test].[dbo].[locationDimension]'

    query = select + dfrom

    cursor.execute(query)

    for row in cursor:
        temp.append({"city": row.city})

    response = jsonify(temp)

     # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == '__main__':
   app.run()


