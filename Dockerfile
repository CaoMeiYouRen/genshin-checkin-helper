FROM python:3-alpine

WORKDIR /app

# 安装python3环境
RUN python3 -V && pip3 -V\
    && ln -sf /usr/bin/pip3 /usr/bin/pip \
    && mkdir -p ~/.pip \
    && echo "[global]" > ~/.pip/pip.conf \
    && echo "index-url=http://mirrors.cloud.aliyuncs.com/pypi/simple/" >> ~/.pip/pip.conf \
    && echo "[install]" >> ~/.pip/pip.conf \
    && echo "trusted-host=mirrors.cloud.aliyuncs.com" >> ~/.pip/pip.conf \
    && pip install --upgrade pip && pip install wheel

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY genshincheckinhelper ./genshincheckinhelper

CMD [ "python3", "./genshincheckinhelper/main.py" ]
