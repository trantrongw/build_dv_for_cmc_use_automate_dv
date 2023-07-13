FROM python:3.10-alpine

RUN apk add \
    unixodbc-dev \
    g++ \
    curl

# Download and install the ODBC 18 driver package
RUN curl -O https://download.microsoft.com/download/1/f/f/1fffb537-26ab-4947-a46a-7a45c27f6f77/msodbcsql18_18.2.2.1-1_amd64.apk
RUN apk add --allow-untrusted msodbcsql18_18.2.2.1-1_amd64.apk
RUN apk add git
# End

WORKDIR /usr/src/
COPY . .
# Install the dbt Postgres adapter. This step will also install dbt-core
RUN pip install --upgrade pip wheel setuptools
RUN pip install Flask
RUN pip install pyodbc
RUN pip install dbt-fabric  

# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models, and snapshots (and run tests wherever applicable)
CMD dbt clean && dbt build && python api.py
EXPOSE 80
