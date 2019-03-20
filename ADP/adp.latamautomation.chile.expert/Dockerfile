FROM 10.150.254.244:8123/automation_base_image
ADD . /usr/src/app/
WORKDIR /usr/src/app/
RUN pip3 install --upgrade pip
RUN pip3 install -r ./requirements.txt
RUN pip3 install -e .
