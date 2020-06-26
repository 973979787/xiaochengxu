from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [

    url(r'service/',include('api.urls')),
    url(r'auth/',include('authorization.urls')),
]
