from django.db import models

# Create your models here.
class APP(models.Model):
    appid = models.CharField(primary_key=True,max_length=32)
    category = models.CharField(max_length=128)#分类
    application = models.CharField(max_length=128)#功能名字
    name = models.CharField(max_length=128) #中文名字
    publish_date = models.DateField() #发布时间
    url = models.CharField(max_length=128) #请求链接
    desc = models.TextField() #描述

    def to_dict(self):
        return {
            'appid':self.appid,
            'category':self.category,
            'application':self.application,
            'name':self.name,
            'publish_date':self.publish_date,
            'url':self.url,
            'desc':self.desc
        }
    def __str__(self):
        return str(self.to_dict())

    def __repr__(self):
        return str(self.to_dict())

