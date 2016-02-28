from django.contrib import admin
from django.contrib.auth.models import Group
from j29.generic.admin import SingletonAdmin
from adminsortable2.admin import SortableAdminMixin, SortableInlineAdminMixin
from hallamsinfonia.models import (
    Conductor, Setting, Image, Location,
    Concert, Piece, ConcessionaryTicket, Person)


class TicketInline(SortableInlineAdminMixin, admin.TabularInline):
    model = ConcessionaryTicket


class PeopleInline(SortableInlineAdminMixin, admin.TabularInline):
    model = Person


class PieceInline(SortableInlineAdminMixin, admin.TabularInline):
    model = Piece


class ConcertAdmin(admin.ModelAdmin):
    inlines = (TicketInline, PeopleInline, PieceInline,)


class ConductorAdmin(SortableAdminMixin, admin.ModelAdmin):
    model = Conductor


admin.site.unregister(Group)
admin.site.register(Conductor, ConductorAdmin)
admin.site.register(Image)
admin.site.register(Location)
admin.site.register(Concert, ConcertAdmin)
admin.site.register(Setting, SingletonAdmin)
