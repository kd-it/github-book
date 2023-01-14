FROM python:3

ARG USER=worker
ARG USER_UID=1000
ARG USER_GID=1000

RUN --mount=type=cache,target=/var/lib/apt \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update; apt-get install -y sudo; \
    type -p curl >/dev/null || sudo apt install curl -y; \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install gh -y \
    && ln -s `which gh` /usr/local/bin/gh

RUN groupadd -g ${USER_GID} ${USER}
RUN useradd -m -s /bin/bash -G sudo --gid ${USER_GID} --uid ${USER_UID} ${USER}
RUN echo "${USER} ALL = (ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER}; \
    chmod 400 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /workspace

COPY data/requirements.txt /etc/
ENV PATH=/home/worker/.local/bin:$PATH
RUN pip install -r /etc/requirements.txt
EXPOSE 8000
