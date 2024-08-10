const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("electronUtilsRender", {
  gamepadButtonPress: (buttonName) =>
    ipcRenderer.send("gamepadButtonPress", buttonName),
  exitApp: () => ipcRenderer.send("exitApp"),
});
