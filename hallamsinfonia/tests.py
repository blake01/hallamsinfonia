from django.test import TestCase
from hallamsinfonia.models import Season, Concert
from datetime import timedelta
from django.utils import timezone

class SeasonsTestCase(TestCase):

    def setUp(self):
        """ Create some dummy seasons, distributed before and
        after today's date. """
        data = {
            'Past A': -50,
            'Past B': -30,
            'Current': -10,
            'Next': 10,
            'Future': 30
        }
        for title, delta in data.iteritems():
            date = timezone.now() + timedelta(days=delta)
            s = Season(title=title, start_date=date)
            s.save()
        Season.objects.filter(title='Default Season').delete()

    def test_current(self):
        s = Season.objects.current()
        self.assertEqual(s.title, 'Current')

    def test_next(self):
        s = Season.objects.next()
        self.assertEqual(s.title, 'Next')

    def test_previous_1(self):
        s = Season.objects.previous()
        most_recent = s.first()
        self.assertEqual(most_recent.title, 'Past B')

    def test_previous_2(self):
        s = Season.objects.previous()
        oldest = s[1]  # For some reason, '.last()' returns incorrectly
        self.assertEqual(oldest.title, 'Past A')
