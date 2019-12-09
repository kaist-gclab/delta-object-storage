#!/usr/bin/env bash
: "${DELTA_OBJECT_STORAGE_ACCESS_KEY?DELTA_OBJECT_STORAGE_ACCESS_KEY}"
: "${DELTA_OBJECT_STORAGE_SECRET_KEY?DELTA_OBJECT_STORAGE_SECRET_KEY}"
: "${DELTA_OBJECT_STORAGE_DATA_DIRECTORY?DELTA_OBJECT_STORAGE_DATA_DIRECTORY}"

sudo docker run -d -p 9000:9000 \
-e "MINIO_ACCESS_KEY=$DELTA_OBJECT_STORAGE_ACCESS_KEY" \
-e "MINIO_SECRET_KEY=$DELTA_OBJECT_STORAGE_SECRET_KEY" \
--name delta-object-storage \
--restart=unless-stopped \
-v "$DELTA_OBJECT_STORAGE_DATA_DIRECTORY:/data1" \
minio/minio server /data1
