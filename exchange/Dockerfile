FROM python:3.6
ENV PYTHONUNBUFFERED 1

# Build BLAS and LAPACK, required for scipy
RUN apt-get update && \
    apt-get install -y libblas-dev liblapack-dev gfortran

# create directory in which code will be present inside container
RUN mkdir /exchange
WORKDIR /exchange

# install requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy source code
COPY exchange .

CMD ["echo", "installed requirements and code copied, run cmds to run code"]
