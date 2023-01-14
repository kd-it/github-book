FROM python:3

ARG USER=worker
ARG USER_UID=1000
ARG USER_GID=1000

RUN --mount=type=cache,target=/var/lib/apt \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update; apt-get install -y sudo
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
