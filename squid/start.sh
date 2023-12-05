#!/bin/sh

if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Error: Both USERNAME and PASSWORD environment variables must be set."
  exit 1
fi

htpasswd -cb /etc/squid/.htpasswd "$USERNAME" "$PASSWORD"


# Start Nginx with the generated .htpasswd file
squid -N
