from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',

    url(r'^$', 'hallamsinfonia.views.home', name='home'),
    url(r'^about/$', 'hallamsinfonia.views.about', name='about'),
    url(r'^upcoming/$', 'hallamsinfonia.views.upcoming', name='upcoming'),
    url(r'^news/$', 'hallamsinfonia.views.news', name='news'),
    url(r'^conductors/$', 'hallamsinfonia.views.conductors', name='conductors'),

    url(r'^admin/', include(admin.site.urls)),
)
