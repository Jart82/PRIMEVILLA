class Config(object):
    APP_NAME="PrimeVilla"
    DATABASE_URI = "sqlite:///:memory"
    ADMIN_ID = "1w456"
    MERCHANT_KEY= "my\secret/keypass"

class ProductionConfig(Config):
    DATABASE_URI = "mysql://user@localhost/foo"
    ADMIN_ID = "asdfgh455^&*(AG78"
    SECRET_KEY = 'productionsecretkey'

class DevelopmentConfig(Config):
     DATABASE_URI = "mysql://demo@localhost/foo"
     ADMIN_ID = 'thisismyadmin'
     SECRET_KEY = 'developmentsecretkey'

class TestConfig(Config):
    MERCHANT_KEY= "test envirnment"