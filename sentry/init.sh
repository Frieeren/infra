#!/bin/bash

set -e  # 에러 발생 시 스크립트 중단

# Sentry 버전 설정 (24.1.0 이상)
VERSION="24.1.0"
git clone https://github.com/getsentry/self-hosted.git
cd self-hosted
git checkout ${VERSION}
sudo ./install.sh

# 참고 링크 : https://infiduk.github.io/2024/10/30/sentry.html
# 이슈
# ERROR: failed to solve: error getting credentials - err: exit status 1, out: ``
# 해결방법
# sudo vi ~/.docker/config.json
# "credsStore": "osxkeychain" 으로 변경