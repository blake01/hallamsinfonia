# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'News'
        db.create_table(u'hallamsinfonia_news', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('pub_date', self.gf('django.db.models.fields.DateField')()),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('content', self.gf('django.db.models.fields.TextField')()),
            ('image', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['hallamsinfonia.Image'])),
        ))
        db.send_create_signal(u'hallamsinfonia', ['News'])

        # Adding model 'Person'
        db.create_table(u'hallamsinfonia_person', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('concert', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['hallamsinfonia.Concert'])),
            ('role', self.gf('django.db.models.fields.CharField')(max_length=128)),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Person'])

        # Adding model 'Conductor'
        db.create_table(u'hallamsinfonia_conductor', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('description', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100, blank=True)),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Conductor'])

        # Adding model 'Setting'
        db.create_table(u'hallamsinfonia_setting', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('about_the_orchestra', self.gf('django.db.models.fields.TextField')()),
            ('about_image_1', self.gf('django.db.models.fields.related.ForeignKey')(related_name='about_image_1', to=orm['hallamsinfonia.Image'])),
            ('about_image_2', self.gf('django.db.models.fields.related.ForeignKey')(related_name='about_image_2', to=orm['hallamsinfonia.Image'])),
            ('about_image_3', self.gf('django.db.models.fields.related.ForeignKey')(related_name='about_image_3', to=orm['hallamsinfonia.Image'])),
            ('quote_text', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('quote_source', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('facebook_link', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('twitter_link', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('season_name', self.gf('django.db.models.fields.CharField')(max_length=128)),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Setting'])

        # Adding model 'Image'
        db.create_table(u'hallamsinfonia_image', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('upload_date', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Image'])

        # Adding model 'Location'
        db.create_table(u'hallamsinfonia_location', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('address_line_1', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('address_line_2', self.gf('django.db.models.fields.CharField')(max_length=128, blank=True)),
            ('city', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('postcode', self.gf('django.db.models.fields.CharField')(max_length=8)),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Location'])

        # Adding model 'Concert'
        db.create_table(u'hallamsinfonia_concert', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('date_and_time', self.gf('django.db.models.fields.DateTimeField')()),
            ('image', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['hallamsinfonia.Image'])),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['hallamsinfonia.Location'])),
            ('full_price_ticket_cost', self.gf('j29.generic.fields.DecimalCurrencyField')(max_digits=10, decimal_places=2)),
            ('booking_link', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Concert'])

        # Adding model 'Piece'
        db.create_table(u'hallamsinfonia_piece', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('composer', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('concert', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['hallamsinfonia.Concert'])),
        ))
        db.send_create_signal(u'hallamsinfonia', ['Piece'])

        # Adding model 'ConcessionaryTicket'
        db.create_table(u'hallamsinfonia_concessionaryticket', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('ticket_cost', self.gf('j29.generic.fields.DecimalCurrencyField')(max_digits=10, decimal_places=2)),
            ('concert', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['hallamsinfonia.Concert'])),
        ))
        db.send_create_signal(u'hallamsinfonia', ['ConcessionaryTicket'])


    def backwards(self, orm):
        # Deleting model 'News'
        db.delete_table(u'hallamsinfonia_news')

        # Deleting model 'Person'
        db.delete_table(u'hallamsinfonia_person')

        # Deleting model 'Conductor'
        db.delete_table(u'hallamsinfonia_conductor')

        # Deleting model 'Setting'
        db.delete_table(u'hallamsinfonia_setting')

        # Deleting model 'Image'
        db.delete_table(u'hallamsinfonia_image')

        # Deleting model 'Location'
        db.delete_table(u'hallamsinfonia_location')

        # Deleting model 'Concert'
        db.delete_table(u'hallamsinfonia_concert')

        # Deleting model 'Piece'
        db.delete_table(u'hallamsinfonia_piece')

        # Deleting model 'ConcessionaryTicket'
        db.delete_table(u'hallamsinfonia_concessionaryticket')


    models = {
        u'hallamsinfonia.concert': {
            'Meta': {'ordering': "['date_and_time']", 'object_name': 'Concert'},
            'booking_link': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'date_and_time': ('django.db.models.fields.DateTimeField', [], {}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'full_price_ticket_cost': ('j29.generic.fields.DecimalCurrencyField', [], {'max_digits': '10', 'decimal_places': '2'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Image']"}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Location']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.concessionaryticket': {
            'Meta': {'ordering': "['pk']", 'object_name': 'ConcessionaryTicket'},
            'concert': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Concert']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'ticket_cost': ('j29.generic.fields.DecimalCurrencyField', [], {'max_digits': '10', 'decimal_places': '2'})
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
            'Meta': {'ordering': "['pk']", 'object_name': 'Person'},
            'concert': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['hallamsinfonia.Concert']"}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'role': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'hallamsinfonia.piece': {
            'Meta': {'ordering': "['pk']", 'object_name': 'Piece'},
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
            'facebook_link': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'quote_source': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'quote_text': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'season_name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'twitter_link': ('django.db.models.fields.URLField', [], {'max_length': '200'})
        }
    }

    complete_apps = ['hallamsinfonia']
