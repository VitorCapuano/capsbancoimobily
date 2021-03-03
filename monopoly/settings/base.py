import os
from distutils.util import strtobool

DEBUG = strtobool(os.getenv('DEBUG', 'False'))
DATABASE_URL = os.getenv('DATABASE_URL', 'sqlite://db.sqlite3')
