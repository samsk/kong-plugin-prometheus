local prometheus = require "kong.plugins.prometheus.exporter"
local kong = kong


prometheus.init()


local PrometheusHandler = {
  PRIORITY = 13,
  VERSION  = "1.1.0",
}

function PrometheusHandler.init_worker()
  prometheus.init_worker()
end


function PrometheusHandler.log(self, conf)
  local message = kong.log.serialize()
  prometheus.log(conf, message)
end


return PrometheusHandler
