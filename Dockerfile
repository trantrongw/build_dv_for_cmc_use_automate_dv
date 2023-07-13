FROM python:3.10-alpine

RUN apk add \
    unixodbc-dev \
    g++ \
    curl

# Download and install the ODBC 18 driver package
RUN curl -O https://download.microsoft.com/download/1/f/f/1fffb537-26ab-4947-a46a-7a45c27f6f77/msodbcsql18_18.2.2.1-1_amd64.apk
RUN apk add --allow-untrusted msodbcsql18_18.2.2.1-1_amd64.apk
RUN apk add git

# Copy the dbt project to Docker.
WORKDIR /usr/src/
COPY . .

# Install adapter,lib
RUN pip install --upgrade pip wheel setuptools
RUN pip install -r requirements.txt

# Build seeds, models, and snapshots (and run tests wherever applicable)
CMD dbt clean && python api.py
EXPOSE 80