FROM shinymayhem/dev

RUN \
	useradd -m reese -s /bin/bash && \
	usermod -a -G admin reese && \
	cd /home/reese && \
	git clone http://github.com/shinymayhem/home && \
	cp -R home/. . && \
	echo 'so ~/.syncedvimrc' > .vimrc


ADD run.sh /opt/deploy/run.sh
ADD init-home.sh /opt/deploy/init-home.sh

RUN chmod +x /opt/deploy/*.sh

RUN \
	apt-get update && \
	apt-get install -y screen && \
    rm -rf /var/lib/apt/lists/*
