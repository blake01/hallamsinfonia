from django.db import models
from generic import models as generic_models
from generic import fields as generic_fields
from generic.image_functions import resize_image_to_fixed_width
import datetime


class News(generic_models.News):
    image = models.ForeignKey('Image')
    

class Conductor(generic_models.Person):
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to='conductors', blank=True)
    listed_on_conductors_page = models.BooleanField()
    
    def save(self, *args, **kwargs):
        """
        Resize image as appropriate.
        """
        if not self.id and not self.image:
            return
        super(Conductor, self).save()
        resize_image_to_fixed_width(self.image, width=180)


class Setting(generic_models.Singleton):
    about_the_orchestra = models.TextField()
    about_image_1 = models.ForeignKey('Image', related_name='about_image_1')
    about_image_2 = models.ForeignKey('Image', related_name='about_image_2')
    about_image_3 = models.ForeignKey('Image', related_name='about_image_3')
    quote_text = models.CharField(max_length=256)
    quote_source = models.CharField(max_length=128)
    
    
class Image(generic_models.Image):
    image = models.ImageField(upload_to="image_library")
    
    def save(self, *args, **kwargs):
        """
        Resize image as appropriate.
        """
        if not self.id and not self.image:
            return
        super(Image, self).save()
        resize_image_to_fixed_width(self.image, width=430)
    
    
class Location(generic_models.UKAddress):
    pass
        
            
class Concert(models.Model):
    title = models.CharField(max_length=128)
    date_and_time = models.DateTimeField()
    image = models.ForeignKey('Image')
    location = models.ForeignKey('Location')
    full_price_ticket_cost = generic_fields.DecimalCurrencyField()
    booking_link = models.URLField(blank=True)
    conductors = models.ManyToManyField('Conductor')
    description = models.TextField()

    @property
    def date(self):
        """ Return a string representation of the date, e.g. 07 December """
        return self.date_and_time.strftime('%d %B')
    
    @property
    def time(self):
        """ Return a string representation of the time, e.g. 19:30 """
        return self.date_and_time.strftime('%H:%M')

    def __unicode__(self):
        return '%s on %s'%(self.title, self.date)
        
    class Meta:
		ordering = ['date_and_time']
    
   
class Piece(models.Model):
    title = models.CharField(max_length=128)
    composer = models.CharField(max_length=128)
    concert = models.ForeignKey('Concert')
    
    def __unicode__(self):
        return self.title
    
    
class ConcessionaryTicket(models.Model):
    name = models.CharField(max_length=128)
    ticket_cost = generic_fields.DecimalCurrencyField() 
    concert = models.ForeignKey('Concert')
    
    def __unicode__(self):
        return self.name

