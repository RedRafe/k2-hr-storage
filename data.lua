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

local tank1 = data.raw["storage-tank"]["kr-fluid-storage-1"]
log(serpent.block(tank1))
tank1.pictures.picture.sheets[1] = tank1.pictures.picture.sheets[1].hr_version
tank1.pictures.picture.sheets[2] = tank1.pictures.picture.sheets[2].hr_version
--tank1.picture.gas_flow = tank1.picture.gas_flow.hr_version

local tank2 = data.raw["storage-tank"]["kr-fluid-storage-2"]
tank2.pictures.picture.sheets[1] = tank2.pictures.picture.sheets[1].hr_version
tank2.pictures.picture.sheets[2] = tank2.pictures.picture.sheets[2].hr_version
--tank2.picture.gas_flow = tank2.picture.gas_flow.hr_version
