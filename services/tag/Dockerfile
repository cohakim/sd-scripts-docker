FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

RUN apt-get update
ENV TZ=Asia/Tokyo
ENV LANG=en_US.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN --mount=type=cache,target=/var/cache/apt/archives \
  apt-get install -yq --no-install-recommends \
        build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev \
        libreadline-dev libsqlite3-dev libopencv-dev tk-dev
RUN --mount=type=cache,target=/var/cache/apt/archives \
  apt-get install -yq --no-install-recommends \
        ca-certificates \
        curl \
        git git-lfs

SHELL ["/bin/bash", "-c"]
RUN curl https://pyenv.run | bash && \
    echo '' >> ~/.bashrc && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.bashrc && \
    echo 'eval "$(pyenv init --path)"' >> $HOME/.bashrc && \
    source ~/.bashrc
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:$PATH

RUN --mount=type=cache,target=~/.pyenv \
    pyenv install 3.10.9
RUN pyenv global 3.10.9
RUN pip install --upgrade pip

RUN curl -sSL https://install.python-poetry.org | python -
ENV PATH /root/.local/bin:$PATH


RUN git clone https://github.com/kohya-ss/sd-scripts.git -b v0.6.5

WORKDIR /sd-scripts
RUN mkdir openai && ln -s /cache/openai/clip-vit-large-patch14 openai/clip-vit-large-patch14
RUN ln -s /cache/wd-v1-4-convnext-tagger-v2 wd-v1-4-convnext-tagger-v2

COPY pyproject.toml pyproject.toml
RUN --mount=type=cache,target=~/.cache/poetry \
    poetry install
