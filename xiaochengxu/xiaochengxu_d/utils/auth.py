#!/usr/bin/python
# -*-encoding=utf8 -*-
# @Author         :
# @Email          : imooc@foxmail.com
# @Created at     : 2018/11/2
# @Filename       : auth.py
# @Desc           :
from xiaochengxu_d import settings
import requests
import json
from utils import proxy
from authorization.models import User

def c2s(appid, code):
    return code2session(appid, code)

'''
return data 的格式
{
  "session_key": "JmRNs6uPEpFzlMRmg4NqJQ==",
  "expires_in": 7200,
  "openid": "oXSML0ZH05BItFTFILfgCGxXxxik"
}
'''


def code2session(appid, code):
    API = 'https://api.weixin.qq.com/sns/jscode2session'
    params = 'appid=%s&secret=%s&js_code=%s&grant_type=authorization_code' % \
             (appid, settings.WX_APP_SECRET, code)
    url = API + '?' + params
    response = requests.get(url=url, proxies=proxy.proxy())
    data = json.loads(response.text)
    print(data)
    return data

#判断是否已经授权
def already_authorized(request):
    is_authorized = False
    if request.session.get('is_authorized'):
        is_authorized = True
    return is_authorized

