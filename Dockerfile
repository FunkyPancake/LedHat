FROM ubuntu:22.04 as base
RUN apt update -y

FROM base as toolchain
RUN apt install -y build-essential cmake make gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib git
RUN apt install -y python3
RUN apt autoremove --purge && apt clean

FROM toolchain as sdk
RUN mkdir -p /opt/sdk && git clone --recurse-submodules https://github.com/raspberrypi/pico-sdk.git /opt/sdk
RUN mkdir /project
ENV PICO_SDK_PATH=/opt/sdk
RUN echo ${PATH}
ENTRYPOINT ["top", "-b"]