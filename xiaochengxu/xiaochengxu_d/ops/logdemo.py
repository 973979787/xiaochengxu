import os
import django
import logging
os.environ.setdefault('DJANGO_SETTINGS_MODULE','xiaochengxu_d.settings')
django.setup()

def logdemo():
    logger = logging.getLogger('django')
    logger.info('hello world')
if __name__=='__main__':
    logdemo()