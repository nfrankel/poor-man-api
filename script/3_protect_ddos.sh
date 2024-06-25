#!/bin/sh
curl -i http://localhost:9180/apisix/admin/global_rules/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "plugins": {
    "limit-count": {
      "count": 1,
      "time_window": 5,
      "rejected_code": 429
    }
  }
}'
