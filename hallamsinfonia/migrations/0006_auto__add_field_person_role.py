# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Person.role'
        db.add_column(u'hallamsinfonia_person', 'role',
                      self.gf('django.db.models.fields.CharField')(default='conductor', max_length=128),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Person.role'
        db.delete_column(u'hallamsinfonia_person', 'role')


    models = {
        u'hallamsinfonia.concert': {
            'Meta': {'ordering': "['date_and_time']", 'object_name': 'Concert'},
            'booking_link': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'date_and_time': ('django.db.models.fields.DateTimeField', [], {}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'full_price_ticket_cost': ('generic.fields.DecimalCurrencyField', [], {'max_digits': '10', 'decimal_places': '2'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Image']"}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Location']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.concessionaryticket': {
            'Meta': {'object_name': 'ConcessionaryTicket'},
            'concert': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Concert']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'ticket_cost': ('generic.fields.DecimalCurrencyField', [], {'max_digits': '10', 'decimal_places': '2'})
        },
        u'hallamsinfonia.conductor': {
            'Meta': {'ordering': "['last_name', 'first_name']", 'object_name': 'Conductor'},
            'description': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'blank': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.image': {
            'Meta': {'ordering': "['-upload_date']", 'object_name': 'Image'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'upload_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        u'hallamsinfonia.location': {
            'Meta': {'object_name': 'Location'},
            'address_line_1': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'address_line_2': ('django.db.models.fields.CharField', [], {'max_length': '128', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'postcode': ('django.db.models.fields.CharField', [], {'max_length': '8'})
        },
        u'hallamsinfonia.news': {
            'Meta': {'ordering': "['-pub_date']", 'object_name': 'News'},
            'content': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Image']"}),
            'pub_date': ('django.db.models.fields.DateField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.person': {
            'Meta': {'object_name': 'Person'},
            'concert': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Concert']"}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'role': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.piece': {
            'Meta': {'object_name': 'Piece'},
            'composer': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'concert': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Concert']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.setting': {
            'Meta': {'object_name': 'Setting'},
            'about_image_1': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'about_image_1'", 'to': u"orm['hallamsinfonia.Image']"}),
            'about_image_2': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'about_image_2'", 'to': u"orm['hallamsinfonia.Image']"}),
            'about_image_3': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'about_image_3'", 'to': u"orm['hallamsinfonia.Image']"}),
            'about_the_orchestra': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'quote_source': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'quote_text': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['hallamsinfonia']