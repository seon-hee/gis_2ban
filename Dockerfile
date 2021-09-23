FROM python:3.9.0

WORKDIR /home/

RUN echo 'dfasfDFSs'

RUN git clone https://github.com/seon-hee/gis_2ban.git

WORKDIR /home/gis_2ban/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=gis_2ban.settings.deploy && python manage.py collectstatic  --noinput --settings=gis_2ban.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_2ban.settings.deploy gis_2ban.wsgi --bind 0.0.0.0:8000"]