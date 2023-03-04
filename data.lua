-- Containers

local containers = {
  "kr-medium-container",
  "kr-big-container",
}

local logistic_containers = {
  "kr-medium-active-provider-container",
  "kr-medium-buffer-container",
  "kr-medium-passive-provider-container",
  "kr-medium-requester-container",
  "kr-medium-storage-container",
  "kr-big-active-provider-container",
  "kr-big-buffer-container",
  "kr-big-passive-provider-container",
  "kr-big-requester-container",
  "kr-big-storage-container",
}

local function upgradeGraphics(entity)
  if entity.picture ~= nil and entity.picture.hr_version ~= nil then
    entity.picture = entity.picture.hr_version
  end
  if entity.animation ~= nil and entity.animation.hr_version ~= nil then
    entity.animation = entity.animation.hr_version
  end
end

for ___, container in pairs(containers) do
  upgradeGraphics(data.raw["container"][container])
end

for ___, container in pairs(logistic_containers) do
  upgradeGraphics(data.raw["logistic-container"][container])
end

-- Storage Tanks

local storage_tanks = {
  "kr-fluid-storage-1",
  "kr-fluid-storage-2"
}

local function upgradeGraphicsTank(entity)
  entity.pictures.picture.sheets[1] = entity.pictures.picture.sheets[1].hr_version
  entity.pictures.picture.sheets[2] = entity.pictures.picture.sheets[2].hr_version
--entity.picture.gas_flow = entity.picture.gas_flow.hr_version
end

for ___, tank in pairs(storage_tanks) do
  upgradeGraphicsTank(data.raw["storage-tank"][tank])
end

