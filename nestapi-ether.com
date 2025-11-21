upstream nestapi_backend {
    server 127.0.0.1:3000;
    keepalive 64;
}

server {
    listen 80;
    listen [::]:80;

    server_name _;

    access_log /var/log/nginx/nestapi-ether-access.log;
    error_log /var/log/nginx/nestapi-ether-error.log;

    client_max_body_size 10M;

    location / {
        proxy_pass http://nestapi_backend;
        proxy_http_version 1.1;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }

}
