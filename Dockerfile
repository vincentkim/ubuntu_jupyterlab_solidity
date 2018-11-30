FROM ubuntu:16.04

MAINTAINER taeohkim <oe3216@gmail.com>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


RUN su -

#update&upgrade essential program
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get -y upgrade

#download&install normal program
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev git-core gcc make

#install pyenv & python
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash



ENV PATH="/root/.pyenv/bin:$PATH"
RUN eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

RUN pyenv update && pyenv install 3.6.5
RUN pyenv global 3.6.5

ENV PATH="/root/.pyenv/versions/3.6.5/bin:$PATH"



#RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
#RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
#RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
#RUN /bin/bash -c "source ~/.profile"

#install py-solc& web3 and solc_0.4.24
RUN pip install web3 && pip install py-solc
RUN python -m solc.install v0.4.24
ENV SOLC_BINARY=/root/.py-solc/solc-v0.4.24/bin/solc

#install jupyterlab
RUN pip install jupyter && pip install jupyterlab

RUN jupyter lab --generate-config

RUN mkdir -p /marker/notebooks

ADD jupyterlab_start.sh /jupyterlab_start.sh

WORKDIR /marker/notebooks

CMD /jupyterlab_start.sh
