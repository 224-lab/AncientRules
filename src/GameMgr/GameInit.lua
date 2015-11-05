--[[
    本文件均为全局变量
    项目下文件通过   `require("src.GameMgr.GameInit")` 引用本文件使用此处定义的全局变量
]]

SceneMgr        = require("src.GameMgr.Common.SceneMgr")
CSResourceMgr   = require ("src.GameMgr.CSResourceMgr")

---@function [parent=#src.GameMgr.GameInit] init
--@param isReInit boolean reinit-flag
function GameInit.init(isReInit)
    SceneMgr.init()
    CSResourceMgr.init()
end

return GameInit