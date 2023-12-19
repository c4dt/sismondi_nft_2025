FROM python:3.10

WORKDIR /root
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN . /root/.bashrc
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v18.19.0
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
RUN . $NVM_DIR/nvm.sh && \
  nvm install $NODE_VERSION && npm install i -g ganache

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN touch .env
COPY brownie-config.yaml .
COPY contracts contracts/
COPY scripts/sepolia.network .

RUN brownie compile
RUN brownie networks import sepolia.network
RUN rm -rf *

WORKDIR /sismondi
ENTRYPOINT ["/usr/local/bin/brownie"]
