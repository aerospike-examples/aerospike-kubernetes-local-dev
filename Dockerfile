FROM openkbs/jdk-mvn-py3
USER root
RUN apt-get update && apt-get install -y \
libssl-dev \
libz-dev \
python-pip


RUN pip3 install aerospike jupyter
RUN pip2 install aerospike

USER developer
WORKDIR /home/developer
#RUN ln -s /opt/projects projects
RUN npm install -g aerospike
EXPOSE 8888 8080 
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token='developer'"]