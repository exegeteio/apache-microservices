FROM rust AS rust
WORKDIR /app
ADD ./rust /app
RUN cargo build --release

FROM golang AS go
ENV CGO_ENABLED=0
WORKDIR /app
ADD ./go /app
RUN go build hello.go

FROM httpd:2.4 AS final
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY bin/ /usr/local/apache2/cgi-bin/
COPY htdocs/ /usr/local/apache2/htdocs
COPY --from=rust /app/target/release/rust /usr/local/apache2/cgi-bin/
COPY --from=go /app/hello /usr/local/apache2/cgi-bin/go
RUN chmod +x /usr/local/apache2/cgi-bin/* && \
    chown -R www-data:www-data /usr/local/apache2/cgi-bin/
