FROM certbot/certbot:latest
ENTRYPOINT []
ENV CONFIG /root/.config/gcloud
ENV PATH /root/google-cloud-sdk/bin:/root/script:$PATH
RUN apk add curl bash
RUN curl https://sdk.cloud.google.com | bash > /dev/null
# CMD ["bash", "sh"]