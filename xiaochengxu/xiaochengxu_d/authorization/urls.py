from django.conf.urls import url, include
from django.contrib import admin
from authorization.views import get_author
from authorization.views import UserView
from authorization.views import logout
from authorization.views import get_status
urlpatterns = [

    url(r'authorize',get_author),
    url(r'user',UserView.as_view()),
    url(r'logout',logout),
    url(r'status',get_status),
]