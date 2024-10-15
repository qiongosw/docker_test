FROM python:3.10

WORKDIR /app
COPY src/ /app

RUN apt-get update && \
apt-get install -y --no-install-recommends apt-transport-https

CMD [ "python3", "-m", "print_hello" ]