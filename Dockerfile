FROM python:3.9.0

WORKDIR /home/

RUN echo 'asdddddddasqw'

RUN git clone https://github.com/soohyoen/djangoProject1.git

WORKDIR /home/djangoProject1/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash","-c", "python manage.py collectstatic --settings=djangoProject1.settings.deploy && python manage.py migrate --settings=djangoProject1.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=djangoProject1.settings.deploy djangoProject1.wsgi --bind 0.0.0.0:8000"]