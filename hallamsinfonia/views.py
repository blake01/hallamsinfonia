# Temporary view work on the front-end as a static page.
from django.shortcuts import render

def home(request):
    return render(request, 'home.html')
    
def upcoming(request):
    return render(request, 'upcoming.html')
    
def news(request):
    return render(request, 'news.html')
    
def about(request):
    return render(request, 'about.html')
    
def conductors(request):
    return render(request, 'conductors.html')