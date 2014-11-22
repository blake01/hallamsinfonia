from django.conf.urls import patterns, include, url, static
from django.conf import settings
from hallamsinfonia.views import NewsListView

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns(
    '',
    # Main views
    url(r'^$', 'hallamsinfonia.views.home', name='home'),
    url(r'^about/$', 'hallamsinfonia.views.about', name='about'),
    url(r'^upcoming/$', 'hallamsinfonia.views.upcoming', name='upcoming'),
    url(r'^news/$', NewsListView.as_view(), name='news'),
    url(r'^conductors/$', 'hallamsinfonia.views.conductors', name='conductors'),
    # Ajax views
    url(r'^conductors/(?P<pk>[\d]+)/$', 'hallamsinfonia.views.ajax_conductor',
        name='ajax_conductor'),
    url(r'^upcoming/(?P<pk>[\d]+)/$', 'hallamsinfonia.views.ajax_concert',
        name='ajax_concert'),
    # Admin
    url(r'^admin/', include(admin.site.urls)),
)

urlpatterns += static.static(
    settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
