FROM golang:1.15 AS build
WORKDIR /app
RUN git clone https://github.com/polynetwork/mxc-relayer.git  && \
    cd mxc-relayer && \
    go build -o run_mxc_relayer main.go

FROM ubuntu:18.04
WORKDIR /app
COPY ./config.json config.json
COPY --from=build /app/mxc-relayer/run_mxc_relayer run_mxc_relayer
CMD ["/bin/bash"]