FROM ubuntu:latest
ARG userflask=flaskexuser
RUN	useradd -m ${userflask} &&\ 
	apt-get update &&\
	apt-get install -y git python3-pip &&\
	apt-get clean
USER ${userflask}
WORKDIR /home/${userflask}
RUN 	git clone https://github.com/anfederico/flaskex &&\
	cd flaskex &&\
	pip install -r requirements.txt
CMD  	cd flaskex &&\
	python3 app.py
EXPOSE 5000
