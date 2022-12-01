FROM python:3.12.0a2-alpine3.16
RUN pip install virtualenv && chown 1001:1001 -R /opt
USER 1001
WORKDIR /opt
ADD geekslore/geeks-dj /opt
RUN python -m venv /opt/venv && \
source /opt/venv/bin/activate && \
pip install --cache-dir /tmp pip --upgrade && \
pip install --cache-dir /tmp -r /opt/requirement.txt
CMD /opt/venv/bin/gunicorn --bind 0.0.0.0:8000  geeks_dj.wsgi:application
EXPOSE 8000
