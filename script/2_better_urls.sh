curl -i http://localhost:9180/apisix/admin/plugin_configs/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "plugins": {
    "serverless-pre-function": {
      "phase": "rewrite",
      "functions" : [
        "return function(_, ctx)
          ctx.var.product_id = ctx.curr_req_matched.id;
        end"
      ]
    },
    "proxy-rewrite": {
      "uri": "/products?id=eq.$product_id"
    }
  }
}'

curl -i http://localhost:9180/apisix/admin/routes/2 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "uri": "/products/:id",
  "plugin_config_id": 1,
  "upstream_id": 1
}'
