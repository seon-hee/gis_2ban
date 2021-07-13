from django.db.models import QuerySet
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse,reverse_lazy
from django.views.generic import CreateView

from accountapp.models import HelloWorld


def hello_world(request):
    if request.method == "POST":

        temp = request.POST.get('hello_world_input')

        new_data = HelloWorld()
        new_data.text = temp
        new_data.save()

        return HttpResponseRedirect(reverse('accountapp:hello_world'))
    else:
        hello_world_list = HelloWorld.objects.all()
        return render(request, 'accountapp/hello_world.html', context={'hello_world_list': hello_world_list})


class AccountCreateView(CreateView):
    model = User
    form_class = UserCreationForm
    success_url = reverse_lazy('accountapp:hello_world')
    template_name = 'accountapp/create.html'