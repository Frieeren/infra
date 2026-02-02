## certbot

**전제:** nginx 80 블록이 켜져 있어야 함. `/.well-known/acme-challenge/` 를 서빙해야 Let's Encrypt 검증이 통과함. (80 블록 주석 처리되어 있으면 certbot 실패)

```bash
docker compose run --rm certbot certonly --webroot \
  -w /var/www/certbot \
  -d time-align.frieeren.com \
  --email {EMAIL_EXAMPLE} \
  --agree-tos \
  --no-eff-email \
  --force-renewal

docker compose run --rm certbot certonly --webroot \
  -w /var/www/certbot \
  -d chart-pattern.frieeren.com \
  --email {EMAIL_EXAMPLE} \
  --agree-tos \
  --no-eff-email \
  --force-renewal
```

## certbot 갱신 cron (매일 새벽 3시)

- `certbot renew` 는 만료 임박한 인증서만 갱신함.
- 갱신 후 nginx reload 해야 새 인증서가 적용됨.
- cron에서는 `docker compose exec nginx nginx -s reload` (nginx 두 번: 컨테이너 이름 + 실행할 명령).

```bash
# ⚠️ 아래 줄을 터미널에 그대로 붙여넣어 실행하지 말 것 (0이 명령으로 인식됨).
# crontab -e 로 편집기 열어서, 파일 안에 한 줄로 붙여넣기.
0 3 * * * cd {PATH} && docker compose run --rm certbot renew && docker compose exec nginx nginx -s reload
```
