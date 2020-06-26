import os
import json
import yaml
import django
import hashlib
from xiaochengxu_d.settings import BASE_DIR
from xiaochengxu_d import settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'xiaochengxu_d.settings')
django.setup()
from api.models import APP
def init():
    path = os.path.join(BASE_DIR,'app.yaml')
    with open(path,'r',encoding='utf-8') as f:
        apps = yaml.load(f)
        published = apps.get('published')
        for item in published:
            #使用哈希函数来生成唯一的appid
            src = item['app']['application'] + item['app']['url']
            appid = hashlib.md5(src.encode('utf-8')).hexdigest()
            if APP.objects.filter(appid=appid):
                print('already exists')
                app = APP.objects.filter(appid=appid)[0]
                print(app)
            else:
                app = APP()
                print('not exits')

            app.appid =appid
            app.category = item['app']['category']
            app.application = item['app']['application']
            app.name = item['app']['name']
            app.publish_date = item['app']['publish_date']
            app.url = item['app']['url']
            app.desc = item['app']['desc']
            app.save()


if __name__ == '__main__':
    init()
