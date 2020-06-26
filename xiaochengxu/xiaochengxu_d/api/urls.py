from django.conf.urls import url, include
from django.contrib import admin
from api.views import menu
from api.views import image
from api.views import weather
from api.views import stock
urlpatterns = [
    # url(r'', views.ceshi),
    url(r'menu/', menu.get_menu),
    # url(r'image/', image.image),
    # url(r'imagetext/', image.image_text),
    url('image/list', image.ImageListView.as_view()),
    url(r'image/',image.ImageView.as_view()),
    url(r'weather/',weather.Weather.as_view()),
    url(r'^stock/',stock.get_stock),
    url(r'^constellation/',stock.get_constellation),
    url(r'^joke/',stock.get_joke)

]