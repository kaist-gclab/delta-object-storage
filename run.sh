#!/usr/bin/env bash
: "${DELTA_OBJECT_STORAGE_ACCESS_KEY?DELTA_OBJECT_STORAGE_ACCESS_KEY}"
: "${DELTA_OBJECT_STORAGE_SECRET_KEY?DELTA_OBJECT_STORAGE_SECRET_KEY}"

docker run -d -p 9000:9000 \
-e "MINIO_ACCESS_KEY=$DELTA_MINIO_ACCESS_KEY" \
-e "MINIO_SECRET_KEY=$DELTA_MINIO_SECRET_KEY" \
--name delta-object-storage \
--restart=unless-stopped \
-v /mnt/data1/delta/object-storage:/data1 \
minio/minio server /data1
