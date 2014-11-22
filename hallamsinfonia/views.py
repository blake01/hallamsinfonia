from django.shortcuts import render
from django.utils import timezone
import random
from hallamsinfonia.models import Article, Concert, Conductor, Setting
from news.views import NewsEndlessListView


def common_context():
    """
    Context elements used by all (non-Ajax) views
    """
    return {
        'settings': Setting.objects.first(),
        'background_number': random.randint(1, 16),
    }

"""
The non-Ajax views
"""

def home(request):
    common = common_context()
    now = timezone.now()
    context_dict = {
        'next_concert': Concert.objects.filter(date_and_time__gt=now).first(),
        'latest_news': Article.objects.latest(),
        'color': 'yellow',
    }
    context_dict.update(common)
    return render(request, 'home.html', context_dict)

def upcoming(request):
    common = common_context()
    now = timezone.now()
    context_dict = {
        'concerts': Concert.objects.filter(date_and_time__gt=now),
        'past_concerts': Concert.objects.filter(date_and_time__lt=now),
        'color': 'red',
    }
    context_dict.update(common)
    return render(request, 'upcoming.html', context_dict)


class NewsListView(NewsEndlessListView):
    """ Overriden from the News app to give HS-specific requirements."""
    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(NewsListView, self).get_context_data(**kwargs)
        # Add extra context
        context.update(common_context())
        context['color'] = 'green'
        return context


def about(request):
    context_dict = {'color': 'blue',}
    context_dict.update(common_context())
    return render(request, 'about.html', context_dict)

def conductors(request):
    context_dict = {
        'conductors': Conductor.objects.all(),
        'color': 'blue',
    }
    context_dict.update(common_context())
    return render(request, 'conductors.html', context_dict)

"""
The Ajax views
"""

def ajax_conductor(request, pk):
    """
    Return a conductor with primary key pk
    """
    context_dict = {'conductor': Conductor.objects.get(pk=pk)}
    return render(request, 'conductor_fragment.html', context_dict)

def ajax_concert(request, pk):
    """
    Return a concert with primary key pk
    """
    context_dict = {'concert': Concert.objects.get(pk=pk)}
    return render(request, 'concert_fragment.html', context_dict)
