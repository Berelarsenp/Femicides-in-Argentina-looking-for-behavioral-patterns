import os
import dj_database_url
from .base import *


SECRET_KEY = os.getenv(
    'DJANGO_SECRET_KEY',
    'definitely_not_donkey_balls')
db_from_env = dj_database_url.config()
DATABASES['default'].update(db_from_env)

ALLOWED_HOSTS = ['*']
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'