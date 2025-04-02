FROM jupyter/base-notebook:python-3.10

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY sample.ipynb /home/jovyan/work/

EXPOSE 8888

CMD ["start-notebook.sh"]