# -*- coding: utf-8 -*-
# Generated by Django 1.11.18 on 2020-06-19 02:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authorization', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='focus_cities',
            field=models.TextField(default='[]'),
        ),
        migrations.AddField(
            model_name='user',
            name='focus_constellations',
            field=models.TextField(default='[]'),
        ),
        migrations.AddField(
            model_name='user',
            name='focus_stocks',
            field=models.TextField(default='[]'),
        ),
    ]
