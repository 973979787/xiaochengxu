#!/usr/bin/python                                                                  
# -*-encoding=utf8 -*-                                                             
# @Author         : imooc
# @Email          : imooc@foxmail.com
# @Created at     : 2018/11/2
# @Filename       : proxy.py
# @Desc           :

import xiaochengxu_d.settings


def proxy():
    if xiaochengxu_d.settings.USE_PROXY:
        # add your proxy here
        return {}
    else:
        return {}
