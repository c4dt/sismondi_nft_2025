FROM python:3.9

RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN . /root/.bashrc
ENV NVM_DIR /root/.nvm
RUN . $NVM_DIR/nvm.sh && \
  nvm install 18 && npm install i -g ganache
RUN pip install eth-brownie
WORKDIR /root
RUN touch .env
COPY . ./
#COPY brownie-config.yaml ./
#COPY contracts contracts/
RUN . $NVM_DIR/nvm.sh && \
    brownie compile
