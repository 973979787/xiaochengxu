import datetime
import logging

logger = logging.getLogger('django')
def demo():
    message = 'crontab job is run '+ str(datetime.datetime.now())
    logger.info(message)
