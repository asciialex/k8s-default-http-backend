FROM rust:latest as build
ENV USER root
COPY ./k8s-default-http-backend /opt
WORKDIR /opt
RUN apt-get update -y && \
    apt-get install musl-tools -y && \
    rustup target add x86_64-unknown-linux-musl && \
    cd /opt && cargo build --release --target x86_64-unknown-linux-musl

FROM scratch
COPY --from=build /opt/target/x86_64-unknown-linux-musl/release/k8s-default-http-backend /k8s-default-http-backend
CMD ["/k8s-default-http-backend"]
