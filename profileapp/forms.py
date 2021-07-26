from bs4.diagnose import profile

from django.forms import ModelForm


class ProfileCreationForm(ModelForm):
    class Meta:
        model = profile
        fields = ['image', 'nickname', 'message']