FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/base:latest

RUN curl -s -L 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | \
  tar zxf - -C /usr/local/bin

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ffmpeg \
    htop \
    git-lfs \
    tig \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
 && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | tee /etc/apt/sources.list.d/ngrok.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    ngrok \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

COPY *.sh /etc/workstation-startup.d/