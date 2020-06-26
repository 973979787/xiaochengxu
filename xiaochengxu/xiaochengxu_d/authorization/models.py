from django.db import models
from api.models import APP
# Create your models here.
class User(models.Model):
    openid = models.CharField(max_length=32,unique=True)
    nickname = models.CharField(max_length=128,db_index=True)
    focus_cities = models.TextField(default='[]')
    focus_constellations = models.TextField(default='[]')
    focus_stocks = models.TextField(default='[]')
    menu = models.ManyToManyField(APP)

    def __str__(self):
        return '%s'%(self.nickname)

