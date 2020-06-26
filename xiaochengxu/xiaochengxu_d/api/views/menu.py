
import yaml
import os
from xiaochengxu_d import settings
from django.http import JsonResponse
from utils import response
def init_app_data():
    data_file = os.path.join(settings.BASE_DIR,'app.yaml')
    with open(data_file,'r',encoding='utf-8') as f:
        apps = yaml.load(f)
        print(apps)
        return apps


def get_menu(request):
    global_app_data = init_app_data()
    published_app_data = global_app_data.get('published')
    resp = response.wrap_json_response(data=published_app_data,
                                       code=response.ReturnCode.SUCCESS)
    return JsonResponse(data=resp,safe=False)
