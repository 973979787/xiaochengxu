from django.contrib import admin
from .models import APP
# Register your models here.
# admin.site.register(APP)
import hashlib
@admin.register(APP)
class AuthoizationAppAdmin(admin.ModelAdmin):
    exclude = ['appid']

    def save_model(self, request, obj, form, change):
        src = obj.category + obj.application
        appid = hashlib.md5(src.encode('utf-8')).hexdigest()
        obj.appid = appid
        super().save_model(request, obj, form, change)