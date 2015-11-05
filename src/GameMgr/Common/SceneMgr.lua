local SceneMgr = {}

SceneMgr.isProcessing = false
SceneMgr.previousScene = ""
SceneMgr.currentScene = ""
SceneMgr.getRunningScene = nil

function SceneMgr.init()
    print("SceneMgr初始化")
    SceneMgr.isProcessing = false
    SceneMgr.previousScene = ""
    SceneMgr.currentScene = ""
    SceneMgr.getRunningScene = nil
end

---场景切换
--@param curScene node 当前场景，一般传self
--@param sceneName string 场景的名称，例如要加载MainScene.lua就填"MainScene"
--@param loadingView string loading界面csb文件
function SceneMgr.replaceScene(curScene, nextSceneName, loadingView)
     
end



return SceneMgr