from django.contrib import admin
from django.contrib.auth.models import Group
from j29.generic.admin import SingletonAdmin
from hallamsinfonia.models import (News, Conductor, Setting, Image, Location,
    Concert, Piece, ConcessionaryTicket, Person)


class TicketInline(admin.TabularInline):
    model = ConcessionaryTicket
    

class PeopleInline(admin.TabularInline):
    model = Person
  
    
class PieceInline(admin.TabularInline):
    model = Piece


class ConcertAdmin(admin.ModelAdmin):
    inlines = (TicketInline, PeopleInline, PieceInline,)


admin.site.unregister(Group)
admin.site.register(News)
admin.site.register(Conductor)
admin.site.register(Image)
admin.site.register(Location)
admin.site.register(Concert, ConcertAdmin)
admin.site.register(Setting, SingletonAdmin)
