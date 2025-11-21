# deploy
npm i

cp  ./nestapi-ether.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable nest-api-ether --now

apt install nginx -y

cp -ip /opt/testnest/nextapi-ether.com /etc/nginx/sites-available/
ln -nfs /etc/nginx/sites-available/nestapi-ether.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
nginx -t

systemctl restart nginx
