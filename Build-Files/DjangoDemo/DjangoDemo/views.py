from django.shortcuts import render
import datetime


def index(request):
    now = datetime.datetime.now()
    context = {
        'year': str(now.year),
    }
    return render(request, 'index.html', context)
