#!/usr/bin/env bash
python manage.py migrate
gunicorn broker.wsgi:application \
--bind 0.0.0.0:8000 \
--workers ${SERVER_WORKERS} \
