from django.shortcuts import render
from authorization.models import User
from utils.auth import already_authorized
from utils.response import ReturnCode,CommonResponseMixin
from django.http import JsonResponse
from utils import auth
from django.views import View
import json
# Create your views here.
def get_author(request):
    post_data = request.body.decode('utf-8')
    post_data = json.loads(post_data)
    code = post_data.get('code').strip()
    appid = post_data.get('appid').strip()
    nickName = post_data.get('nickName').strip()
    response = {}
    if not code or not appid:
        response['message'] = 'authorize failed'
        response['code'] = ReturnCode.BROKEN_AUTHORIZED_DATA
        return JsonResponse(data=response,safe=False)
    data = auth.c2s(appid,code)
    openid = data.get('openid')
    if not openid:
        response['message'] = 'authorize failed'
        response['code'] = ReturnCode.BROKEN_AUTHORIZED_DATA
        return JsonResponse(data=response, safe=False)
    request.session['open_id'] = openid
    request.session['is_authorized'] = True
    if not User.objects.filter(openid=openid):
        user = User(openid=openid,nickname=nickName)
        user.save()
    response = CommonResponseMixin.wrap_json_response(code=ReturnCode.SUCCESS,message='success auth')
    return JsonResponse(data=response,safe=False)

class UserView(View,CommonResponseMixin):

    def get(self,request):
        if not already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.BROKEN_AUTHORIZED_DATA)
            return JsonResponse(data=response,safe=False)
        open_id = request.session.get('open_id')
        user = User.objects.get(openid=open_id)
        data = {}
        data['focus'] = {}
        data['focus']['city'] = json.loads(user.focus_cities)
        data['focus']['stock'] = json.loads(user.focus_stocks)
        data['focus']['constellation'] = json.loads(user.focus_constellations)
        response = self.wrap_json_response(data=data,code=ReturnCode.SUCCESS)
        return JsonResponse(data=response,safe=False)
    def post(self,request):
        print(request.session.get('is_authorized'))
        print(request.session.get('open_id'))
        if not already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.BROKEN_AUTHORIZED_DATA)
            return JsonResponse(data=response,safe=False)
        open_id = request.session.get('open_id')
        user = User.objects.get(openid=open_id)
        receive_body = request.body.decode('utf-8')
        receive_body = json.loads(receive_body)
        cities = receive_body.get('city')
        stocks = receive_body.get('stock')
        constellations = receive_body.get('constellation')
        user.focus_constellations = json.dumps(constellations)
        user.focus_stocks = json.dumps(stocks)
        user.focus_cities = json.dumps(cities)
        user.save()
        response = self.wrap_json_response(code=ReturnCode.SUCCESS,message='modify user_info success')
        return JsonResponse(data=response,safe=False)

def logout(request):
    request.session.clear()
    response = CommonResponseMixin.wrap_json_response(code=ReturnCode.SUCCESS)
    return JsonResponse(data=response,safe=False)

#获取登录状态
def get_status(request):
    if already_authorized(request):
        data = {
            'is_authorized':1
        }
    else:
        data = {
            'is_authorized': 0
        }
    response = CommonResponseMixin.wrap_json_response(data=data,code=ReturnCode.SUCCESS)
    return JsonResponse(data=response,safe=False)
