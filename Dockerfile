FROM tezos/tezos:latest-release
# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less python3 py-pip curl jq && \
	pip install awscli six && \
	rm /var/cache/apk/*

COPY ./start-tezos.sh /home/tezos/start-tezos.sh
RUN chmod 755 /home/tezos/start-tezos.sh

COPY ./utc-time-math.py /home/tezos/utc-time-math.py
RUN chmod 755 /home/tezos/utc-time-math.py

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-tezos.sh"]
