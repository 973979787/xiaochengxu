import os
import random
from django.core.cache import cache
from utils.timeutil import get_day_left_in_second
from authorization.models import User
from thirdparty.juhe import stock,constellation
from utils.response import CommonResponseMixin,ReturnCode
from django.http import JsonResponse
import json
from xiaochengxu_d import settings
from utils import auth
all_jokes = []
all_constellations = ['白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座', '天秤座', '天蝎座', '射手座', '摩羯座', '水瓶座', '双鱼座']
all_stocks = [
    {
        'code': '000001',
        'name': '平安银行',
        'market': 'sz'
    },
    {
        'code': '000002',
        'name': '万科A',
        'market': 'sz'
    },
    {
        'code': '600036',
        'name': '招商银行',
        'market': 'sh'
    },
    {
        'code': '601398',
        'name': '工商银行',
        'market': 'sh'
    }
]
def get_stock(request):
    resp_data = []
    if auth.already_authorized(request):
        openid = request.session.get('open_id')
        user = User.objects.get(openid=openid)
        popular_stocks =json.loads(user.focus_stocks)
    else:
        popular_stocks= all_stocks
    for item in popular_stocks:
        print(item['code'])
        item_data = stock(item['market'],item['code'])
        resp_data.append(item_data)
    resp_data = CommonResponseMixin.wrap_json_response(data=resp_data,code=ReturnCode.SUCCESS)
    return JsonResponse(data=resp_data,safe=False)
def get_constellation(request):
    resp_data = []
    if auth.already_authorized(request):
        openid = request.session.get('open_id')
        user = User.objects.get(openid=openid)
        constellations =json.loads(user.focus_constellations)
    else:
        constellations = all_constellations
    for item in constellations:
        data = cache.get(item)
        if not data:
            data = constellation(item)
            timeout = get_day_left_in_second()
            cache.set(item,data,timeout)
        resp_data.append(data)
    resp_data = CommonResponseMixin.wrap_json_response(data=resp_data)
    return JsonResponse(data = resp_data,safe=False)

def get_joke(request):
    global all_jokes
    if not all_jokes:
        all_jokes = json.load(open(os.path.join(settings.BASE_DIR,'jokes.json'),'r'))
    limits = 10
    sample_jokes = random.sample(all_jokes,limits)
    resp_data = CommonResponseMixin.wrap_json_response(data=sample_jokes)
    return JsonResponse(data=resp_data,safe=False)


