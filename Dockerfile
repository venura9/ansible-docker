FROM alpine:3.16

RUN apk add zsh git py3-pip; \
    pip install 'ansible[azure]'; \
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"; 
