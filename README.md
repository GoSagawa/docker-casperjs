# CasperJs for Japanese site

You can use CasperJs as below.

`
docker run -d --name mycasperjs-daemon -v /your_host_pass:/home/casperjs  --restart always gsagawa/casperjs
`

check CasperJs version

`
docker exec mycasperjs-daemon casperjs --version
`

execute CasperJs with your script

`
docker exec mycasperjs-daemon casperjs test.js
`

