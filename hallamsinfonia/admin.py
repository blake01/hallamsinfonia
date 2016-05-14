from django.contrib import admin
from django.contrib.auth.models import Group
from j29.generic.admin import SingletonAdmin
from adminsortable2.admin import SortableAdminMixin, SortableInlineAdminMixin
from hallamsinfonia.models import (
    Conductor, Setting, Image, Location, Season,
    Concert, Piece, ConcessionaryTicket, Person)


class TicketInline(SortableInlineAdminMixin, admin.TabularInline):
    model = ConcessionaryTicket


class PeopleInline(SortableInlineAdminMixin, admin.TabularInline):
    model = Person


class PieceInline(SortableInlineAdminMixin, admin.TabularInline):
    model = Piece


class ConcertInline(admin.TabularInline):
    model = Concert
    fields = ('title', 'date_and_time')

    def has_add_permission(self, request, obj=None):
        return False


class ConcertAdmin(admin.ModelAdmin):
    inlines = (TicketInline, PeopleInline, PieceInline,)
    readonly_fields = ('season',)


class ConductorAdmin(SortableAdminMixin, admin.ModelAdmin):
    model = Conductor


class SeasonAdmin(admin.ModelAdmin):
    inlines = (ConcertInline,)


admin.site.unregister(Group)
admin.site.register(Conductor, ConductorAdmin)
admin.site.register(Image)
admin.site.register(Location)
admin.site.register(Season, SeasonAdmin)
admin.site.register(Concert, ConcertAdmin)
admin.site.register(Setting, SingletonAdmin)
