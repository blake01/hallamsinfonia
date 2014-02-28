from django.http import HttpResponse
from django.shortcuts import render
from django.utils import timezone
import random
from hallamsinfonia.models import News, Concert, Conductor, Setting


def common_context():
	"""
	Context elements used by all (non-Ajax) views
	"""
	return {
		'settings': Setting.objects.first(),
		'background_number': random.randint(1,16),
	}

"""
The non-Ajax views
"""

def home(request):
	common = common_context()
	now = timezone.now()
	context_dict = {
		'next_concert': Concert.objects.filter(date_and_time__gt=now).first(),
		'latest_news': News.objects.filter(pub_date__lte=now.date()).first(),
		'color': 'yellow',
	}
	context_dict.update(common)
	return render(request, 'home.html', context_dict)
    
def upcoming(request):
	common = common_context()
	now = timezone.now()
	context_dict = {
		'concerts': Concert.objects.filter(date_and_time__gt=now),
		'color': 'red',
	}
	context_dict.update(common)
	return render(request, 'upcoming.html', context_dict)
    
def news(request):
	now = timezone.now()
	stories = News.objects.filter(pub_date__lte=now.date())
	number_of_stories = stories.count()
	if number_of_stories > 3:
		news = stories[:3]
		more = True
	elif number_of_stories > 0:
		news = stories
		more = False
	else:
		news = None
		more = False
	context_dict = {
		'news': news,
		'more': more,
		'color': 'green',
	}
	context_dict.update(common_context())
	return render(request, 'news.html', context_dict)
    
def about(request):
	context_dict = {
		'color': 'blue',
	}
	context_dict.update(common_context())
	return render(request, 'about.html', context_dict)
    
def conductors(request):
	context_dict = {
		'conductors': Conductor.objects.filter(listed_on_conductors_page=True),
		'color': 'blue',
	}
	context_dict.update(common_context())
	return render(request, 'conductors.html', context_dict)

"""
The Ajax views
"""

def ajax_news(request, pk):
	"""
	Return the next news story.
	"""
	last_loaded_story = News.objects.get(pk=pk)
	next_story = last_loaded_story.get_previous_by_pub_date()
	try:
		temp = next_story.get_previous_by_pub_date()
		more = True
	except News.DoesNotExist:
		more = False
	context_dict = {
		'story': next_story,
		'more': more,
	}
	return render(request, 'news_fragment.html', context_dict)
	
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