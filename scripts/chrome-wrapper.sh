#!/usr/bin/env bash
# Chrome wrapper that adds --no-sandbox flag for headless environments
exec /home/yuni0928/.cache/puppeteer/chrome/linux-145.0.7632.77/chrome-linux64/chrome --no-sandbox "$@"
