from django.db import models
from j29.generic import models as generic_models
from j29.generic import fields as generic_fields
from j29.generic.image_functions import resize_image_to_fixed_width
from news.models import ArticleBase


class Article(ArticleBase):
    """A news article."""
    image = models.ForeignKey('Image')


class Person(generic_models.Person):
    """A person who appears in a concert.

    For simplicity, the 'person' model is not linked to the 'conductor' model,
    which governs the conductors that appear on the conductors page. Moreover,
    the relationship is treated as many-to-one, rather than the more 'correct'
    many-to-many.
    """
    concert = models.ForeignKey('Concert')
    role = models.CharField(
        max_length=128, help_text='e.g. "conductor" or "trumpet"')
    weight = models.PositiveIntegerField(default=0)

    class Meta:
        verbose_name_plural = 'People'
        ordering = ['weight']


class Conductor(generic_models.Person):
    """A conductor of the orchestra."""
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to='conductors', blank=True)
    weight = models.PositiveIntegerField(default=0)

    def save(self, *args, **kwargs):
        """Resize image as appropriate."""
        if not self.id and not self.image:
            return
        super(Conductor, self).save()
        resize_image_to_fixed_width(self.image, width=200)

    class Meta:
        ordering = ['weight']


class Setting(generic_models.Singleton):
    about_the_orchestra = models.TextField()
    about_image_1 = models.ForeignKey('Image', related_name='about_image_1')
    about_image_2 = models.ForeignKey('Image', related_name='about_image_2')
    about_image_3 = models.ForeignKey('Image', related_name='about_image_3')
    quote_text = models.CharField(max_length=256)
    quote_source = models.CharField(max_length=128)
    facebook_link = models.URLField()
    twitter_link = models.URLField()


class Image(generic_models.Image):
    image = models.ImageField(upload_to="image_library")

    def save(self, *args, **kwargs):
        """Resize image as appropriate."""
        if not self.id and not self.image:
            return
        super(Image, self).save()
        resize_image_to_fixed_width(self.image, width=430)


class Location(generic_models.UKAddress):
    pass


class Season(generic_models.SlugFromTitle):
    # Inherit a title, unicode method and slug field.
    start_date = models.DateField(
        help_text="Not displayed - used for sorting only"
    )

    class Meta:
        ordering = ['start_date']


class Concert(models.Model):
    title = models.CharField(max_length=128)
    date_and_time = models.DateTimeField()
    season = models.ForeignKey('Season')
    image = models.ForeignKey('Image')
    location = models.ForeignKey('Location')
    full_price_ticket_cost = generic_fields.DecimalCurrencyField()
    booking_link = models.URLField(blank=True)
    description = models.TextField()

    @property
    def date(self):
        """String representation of the date, e.g. Sat 07 December 13"""
        return self.date_and_time.strftime('%A %d %B %y')

    @property
    def time(self):
        """String representation of the time, e.g. 9:30 am"""
        return self.date_and_time.strftime('%I:%M %p').lstrip('0').lower()

    @property
    def tickets_string(self):
        """String representation of the various tickets available"""
        s = '&pound;{0}'.format(self.full_price_ticket_cost)
        for ticket in self.concessionaryticket_set.all():
            s += ', &pound;{0} {1}'.format(ticket.ticket_cost, ticket.name)
        return s

    def __unicode__(self):
        return '{0} on {1}'.format(self.title, self.date)

    class Meta:
        ordering = ['date_and_time']


class Piece(models.Model):
    title = models.CharField(max_length=128)
    composer = models.CharField(max_length=128)
    concert = models.ForeignKey('Concert')
    weight = models.PositiveIntegerField(default=0)

    def __unicode__(self):
        return self.title

    class Meta:
        ordering = ['weight']


class ConcessionaryTicket(models.Model):
    name = models.CharField(max_length=128)
    ticket_cost = generic_fields.DecimalCurrencyField()
    concert = models.ForeignKey('Concert')
    weight = models.PositiveIntegerField(default=0)

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['weight']
