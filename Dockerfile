FROM python:3.10

WORKDIR /root
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN . /root/.bashrc
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v18.19.0
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
RUN . $NVM_DIR/nvm.sh && \
  nvm install $NODE_VERSION && npm install i -g ganache

# This doesn't work - yay for python package management...
#COPY requirements.txt .
#RUN pip install -r requirements.txt
# According to https://github.com/yaml/pyyaml/issues/724#issuecomment-1848423837
RUN pip install "cython<3.0.0" wheel
RUN pip install "pyyaml==5.4.1" --no-build-isolation
RUN pip install "eth-brownie==1.19.3"
RUN pip install "Pillow==10.1.0"

RUN touch .env
COPY brownie-config.yaml .
COPY contracts contracts/
COPY scripts/sepolia.network .

RUN brownie compile
RUN brownie networks import sepolia.network
#RUN rm -rf *

WORKDIR /sismondi
ENTRYPOINT ["/usr/local/bin/brownie"]
