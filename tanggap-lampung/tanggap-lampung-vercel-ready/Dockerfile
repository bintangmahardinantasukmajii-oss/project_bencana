FROM rust:1.75 as builder
WORKDIR /usr/src/app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates libssl-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /usr/src/app/target/release/tanggap_lampung /app/
COPY --from=builder /usr/src/app/static /app/static
COPY --from=builder /usr/src/app/templates /app/templates
EXPOSE 3000
CMD ["/app/tanggap_lampung"]
