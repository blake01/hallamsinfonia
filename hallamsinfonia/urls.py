from django.conf.urls import patterns, include, url, static
from django.conf import settings
from hallamsinfonia import views

from django.contrib import admin
admin.autodiscover()

urlpatterns = [
    # Main views
    url(r'^$', views.home, name='home'),
    url(r'^about/$', views.about, name='about'),
    url(r'^upcoming/$', views.upcoming, name='upcoming'),
    url(r'^news/$', views.NewsListView.as_view(), name='news'),
    url(r'^conductors/$', views.conductors, name='conductors'),
    # Ajax views
    url(r'^conductors/(?P<pk>[\d]+)/$', views.ajax_conductor,
        name='ajax_conductor'),
    url(r'^upcoming/(?P<pk>[\d]+)/$', views.ajax_concert, name='ajax_concert'),
    # Admin
    url(r'^admin/', include(admin.site.urls)),
]

urlpatterns += static.static(
    settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
