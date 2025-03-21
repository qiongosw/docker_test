FROM python:3.10

WORKDIR /app
COPY src/requirements.txt .

RUN pip install -r requirements.txt

COPY src/ .

CMD [ "python3", "print_hello.py" ]