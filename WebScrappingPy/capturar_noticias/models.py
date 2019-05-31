from django.db import models

# Create your models here.

class Noticias(models.Model):
    new_title = models.TextField(blank=True)
    url = models.TextField(blank=True)