import pyodbc 
from flask import Flask, jsonify

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-P75CUH1\SQLEXPRESS;'
                      'Database=Test;'
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
def query():
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

    


@app.route("/yearly/")
def yearlySales():

    temp = []
    select = 'SELECT year, sum(dollars_sold) as sales '
    dfrom = 'FROM Test.dbo.saleFact JOIN Test.dbo.timeDimension ON saleFact.time_key = timeDimension.time_key '
    group = 'GROUP BY year'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"year": int(row.year), "sales": row.sales})

    response = jsonify(temp)

     # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


@app.route("/query1/")
def query1():
    temp = []
    select = 'SELECT year, quarter, sum(dollars_sold) sales '
    dfrom = 'FROM saleFact JOIN timeDimension ON saleFact.time_key = timeDimension.time_key '
    group = 'GROUP BY quarter, year'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"year": int(row.year), "quarter":int(row.quarter),"sales": row.sales})

    response = jsonify(temp)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

@app.route("/query2/")
def query2():
    temp = []
    select = 'SELECT country, city, sum(dollars_sold) sales '
    dfrom = 'FROM saleFact JOIN locationDimension ON saleFact.location_key = locationDimension.location_key '
    group = 'GROUP BY city, country'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"country": int(row.country), "city": str(row.city),"sales": row.sales})

    response = jsonify(temp)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

@app.route("/query3/")
def query3():
    temp = []
    select = 'SELECT brand, item.type as itemType, sum(dollars_sold) sales '
    dfrom = 'FROM saleFact JOIN item ON saleFact.item_key = item.item_key '
    group = 'GROUP BY brand, item.type'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"brand": int(row.brand),"type": str(row.itemType) ,"sales": row.sales})

    response = jsonify(temp)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

@app.route("/query4/")
def query4():
    temp = []
    select = 'SELECT month, day, sum(dollars_sold) sales '
    dfrom = 'FROM saleFact JOIN timeDimension ON saleFact.time_key = timeDimension.time_key '
    group = 'GROUP BY day, month'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"month": int(row.month),"day" : row.day, "sales": row.sales})

    response = jsonify(temp)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

@app.route("/query5/")
def query5():
    temp = []
    select = 'SELECT item_name as itemName, sum(units_sold) quantity, sum(dollars_sold) sales '
    dfrom = 'FROM saleFact JOIN item ON saleFact.item_key = item.item_key '
    group = 'GROUP BY item_name'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"itemName": row.itemName, "quantity":int(row.quantity) ,"sales": row.sales})

    response = jsonify(temp)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

@app.route("/query6/")
def query6():
    temp = []
    select = 'SELECT street, sum(dollars_sold) sales '
    dfrom = 'FROM saleFact JOIN locationDimension ON saleFact.location_key = locationDimension.location_key '
    group = 'GROUP BY street'
    query = select + dfrom + group

    cursor.execute(query)

    for row in cursor:
        temp.append({"street": row.street, "sales": row.sales})

    response = jsonify(temp)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == '__main__':
   app.run()


