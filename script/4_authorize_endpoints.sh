#!/bin/sh
curl http://localhost:9180/apisix/admin/routes/2 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PATCH -d '
{
  "methods": ["GET", "HEAD"]
}'

curl http://localhost:9180/apisix/admin/consumers -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "username": "admin",
  "plugins": {
    "key-auth": {
      "key": "admin"
    }
  }
}'

curl http://localhost:9180/apisix/admin/routes/3 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "uri": "/products/:id",
  "methods": ["DELETE", "POST", "PUT", "PATCH"],
  "plugin_config_id": 1,
  "upstream_id": 1,
  "plugins": {
    "key-auth": {}
  }
}'
