docker run -d -p 9000:9000 \
-e "MINIO_ACCESS_KEY=ACCESS_KEY_HERE" \
-e "MINIO_SECRET_KEY=SECRET_KEY_HERE" \
--name delta-object-storage \
--restart=unless-stopped \
-v /var/delta/object-storage:/data \
minio/minio server /data
