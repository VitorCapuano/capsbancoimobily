import os
from distutils.util import strtobool

DEBUG = strtobool(os.getenv('DEBUG', 'False'))
