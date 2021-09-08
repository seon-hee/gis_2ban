FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/seon-hee/gis_2ban.git

WORKDIR /home/gis_2ban/

RUN echo "SECRET_KEY=django-insecure-7^r%8*lnpkv-+g%+cga@a2s3#=o2#$0zv1ds$cym9wy4b+v6*j" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "gis_2ban.wsgi", "--bind", "0.0.0.0:8000"]