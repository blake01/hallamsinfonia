# Temporary view work on the front-end as a static page.
from django.shortcuts import render

def static(request):
    return render(request, 'base.html')