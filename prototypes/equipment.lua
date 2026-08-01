local util = require('lib')

if settings.startup['xy-rebalance-equipment-solar'] then
    data.raw['solar-panel-equipment']['solar-panel-equipment'].power = '55kW'
    data.raw['solar-panel-equipment']['kr-big-solar-panel-equipment'].power = '264kW'
    data.raw['solar-panel-equipment']['kr-superior-solar-panel-equipment'].power = '120kW'
    data.raw['solar-panel-equipment']['kr-big-superior-solar-panel-equipment'].power = '576kW'
end