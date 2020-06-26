from  django.http import JsonResponse,HttpResponse
from django.views import View
from utils.response import CommonResponseMixin,ReturnCode
from thirdparty import juhe
from authorization.models import User
import json
from utils import auth
class Weather(View,CommonResponseMixin):
    def get(self,request):
        if not auth.already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.UNAUTHORIZED)
            return JsonResponse(data=response,safe=False)
        else:
            data = []
            openid = request.session.get('open_id')
            user = User.objects.get(openid=openid)
            cities = json.loads(user.focus_cities)
            for city in cities:
                result = juhe.weather(city.get('city'))
                result['city_info'] = city
                data.append(result)
            response = self.wrap_json_response(data=data,code=ReturnCode.SUCCESS)
            return JsonResponse(data=response,safe=False)


    def post(self,request):
        data = []
        receive_body = request.body.decode('utf-8')
        receive_body = json.loads(receive_body)
        cities = receive_body.get('cities')
        print(cities)
        for city in cities:
            result = juhe.weather(city.get('city'))
            result['city_info'] = city
            data.append(result)
        data = self.wrap_json_response(data=data)
        return JsonResponse(data=data,safe=False)