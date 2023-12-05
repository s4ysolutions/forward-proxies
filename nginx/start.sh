#!/bin/sh

if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Error: Both USERNAME and PASSWORD environment variables must be set."
  exit 1
fi

htpasswd -cb /etc/nginx/.htpasswd "$USERNAME" "$PASSWORD"

# Set  User-Agent
chrome_user_agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'
user_agent=${USER_AGENT:=$chrome_user_agent}
sed "s/USER_AGENT/$user_agent/" </etc/nginx/nginx.tmpl >/etc/nginx/nginx.conf

# Start Nginx with the generated .htpasswd file
nginx -g "daemon off;"
