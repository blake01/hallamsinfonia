# Django settings for hallamsinfonia project.
import os
import j29
from secrets import SECRET_KEY


dirname = os.path.dirname
PROJECT_ROOT = dirname(dirname(os.path.abspath(__file__)))
SITE_NAME = 'hallamsinfonia'
DOMAIN_NAME = SITE_NAME + '.org.uk'
URL = 'http://www.' + DOMAIN_NAME

execfile(os.path.join(os.path.dirname(j29.__file__), 'common_settings.py'))

DATABASES['default']['NAME'] = SITE_NAME

ALLOWED_HOSTS = ['www.' + DOMAIN_NAME, DOMAIN_NAME]

INSTALLED_APPS += (
    'hallamsinfonia',
    'news',
    'el_pagination',
    'adminsortable2'
)

NEWS_APP = 'hallamsinfonia'

TEMPLATE_CONTEXT_PROCESSORS += (
    'django.core.context_processors.request',
)
