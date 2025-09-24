FROM nginx:1.25.3-bookworm as runner

WORKDIR /workspace

COPY nginx.conf /etc/nginx/nginx.conf
COPY --link --from=runner /workspace/index.html /usr/share/nginx/html/index.html

# Note:
# The default nginx configuration requires write access to the following folders:
# - /var/cache/nginx
# - /var/run
# Mount docker volumes to these locations to run the image in --read-only mode!