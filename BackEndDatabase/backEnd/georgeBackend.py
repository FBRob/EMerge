from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from sqlalchemy import *
import sqlalchemy as db
import json

app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'emerge'
app.config['MYSQL_DB'] = 'emerge'

mysql = MySQL(app)

# create db engine and connection to it
from sqlalchemy import create_engine
engine = create_engine('mysql://root:emerge@localhost:3306/emerge')
connection = engine.connect()
metadata = db.MetaData()
emerRespAgency = db.Table('EmergencyResponseAgency', metadata, autoload=True, autoload_with=engine)


@app.route('/get_muni', methods=['GET', 'POST'])
def hello():

     print(emerRespAgency.columns.keys())

     #outString = " "
     #return outString.join(emerRespAgency.columns.keys())

     return json.dumps(emerRespAgency.columns.keys())
 
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
