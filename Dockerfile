FROM python:3.8
run groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
run python -m pip install --upgrade pip
run pip install Flask==1.0.2 uWSGI==2.0.19 requests==2.5.1 redis==3.0
WORKDIR /app
copy app /app
copy cmd.sh /
EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]
