local CSResourceMgr = {}

CSResourceMgr.CSObjTable = {}  --存放所有已创建的csb节点

function CSResourceMgr.init()
    print("CSResourceMgr初始化") 
    CSResourceMgr.CSObjTable = {}
end

---创建csb资源，并返回这个node
--@param scene node 资源的父节点
--@param resName string 资源名称，例如:"123.csb"
--@param tag string 标签名，重复创建同一个资源动画时用来区分
--@return #node 所创建的csb资源
function CSResourceMgr.createRes(scene, resName, tag)
    tag = tag or ""
    local fileExist = cc.FileUtils:getInstance():isFileExist(resName)
    if fileExist == false then
        print(resName.."不存在，创建csb资源失败")
        return nil
    end
    if CSResourceMgr.CSObjTable[resName..tag] then
        print(resName..tag.."已存在，将删除它重新创建")
        local ret,errMessage = pcall(function()
            transition.stopTarget(CSResourceMgr.CSObjTable[resName..tag])
            CSResourceMgr.CSObjTable[resName..tag]:removeAllChildren()
            CSResourceMgr.CSObjTable[resName..tag]:removeFromParent(true)
            CSResourceMgr.CSObjTable[resName..tag] = nil
        end)
        if ret==true then
            print(resName..tag.."删除成功")
        else
            print(resName..tag.."删除失败，可能是它的父节点已经被删除")
        end
    end
    local map = cc.CSLoader:createNode(resName)
    if scene then
        map:addTo(scene, 1, tag)
    end
    CSResourceMgr.CSObjTable[resName..tag] = map
    map.res = resName
    map.tag = tag
    return map
end

return CSResourceMgr