from django.contrib import admin
from django.contrib.auth.models import Group
from generic.admin import SingletonAdmin
from hallamsinfonia.models import (News, Conductor, Setting, Image, Location, Season,
    Concert, Piece, ConcessionaryTicket)


class TicketInline(admin.TabularInline):
    model = ConcessionaryTicket
  
    
class PieceInline(admin.TabularInline):
    model = Piece


class ConcertAdmin(admin.ModelAdmin):
    inlines = (TicketInline, PieceInline)


admin.site.unregister(Group)
admin.site.register(News)
admin.site.register(Conductor)
admin.site.register(Image)
admin.site.register(Location)
admin.site.register(Season)
admin.site.register(Concert, ConcertAdmin)
admin.site.register(Setting, SingletonAdmin)
