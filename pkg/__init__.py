import os


from flask import Flask
from flask_wtf import CSRFProtect
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate


from pkg import config
# basedir = os.path.abspath(os.path.dirname(__name__))
# app = Flask(__name__, instance_config_relative=True, instance_path= os.pathjoin(basedir, 'envvars'))
app = Flask(__name__, instance_relative_config=True)

# app = Flask(__name__)


app.config.from_pyfile('config.py')
if app.config['ENV'] == 'development':
    app.config.from_object(config.DevelopmentConfig)
else:
    app.config.from_object(config.ProductionConfig)

db = SQLAlchemy(app)

migrate = Migrate(app, db)



# csrf = CSRFProtect(app) or
csrf = CSRFProtect()
csrf.init_app(app)


from pkg import user_routes, admin_routes, models
