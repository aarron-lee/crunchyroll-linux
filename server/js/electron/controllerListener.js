function debounce(func, timeout = 300) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      func.apply(this, args);
    }, timeout);
  };
}

const requestAnimationFrame = window.requestAnimationFrame;

const cancelAnimationFrame = window.cancelAnimationFrame;

let gpIndex = -1;
let animationFrameId;

let enabled = window.localStorage.getItem("controllerSupport") === "ENABLE";

const setupGamepadEventListener = () => {
  const handleController = (event) => {
    gpIndex = event.gamepad.index;
    const gp = navigator.getGamepads()[gpIndex];
    if (!gp) return;

    updateLoop();
  };
  const handleControllerDisconnect = (event) => {
    // Do something on disconnect
    gpIndex = -1;
    if (animationFrameId) {
      cancelAnimationFrame(animationFrameId);
      animationFrameId = undefined;
    }
  };

  window.addEventListener("gamepadconnected", handleController);

  window.addEventListener("gamepaddisconnected", handleControllerDisconnect);
};

const updateLoop = () => {
  if (gpIndex >= 0) {
    const gp = navigator.getGamepads()[gpIndex];
    if (gp) {
      // gamepad is connected
      if (enabled) {
        controllerNavigation(gp);
      }
    }
    animationFrameId = requestAnimationFrame(updateLoop);
  }
};

const controllerNavigation = (gp) => {
  const el = document.activeElement;
  const dPadUp = gp.buttons[12];
  const dPadDown = gp.buttons[13];
  const dPadLeft = gp.buttons[14];
  const dPadRight = gp.buttons[15];
  const aButton = gp.buttons[0];
  const bButton = gp.buttons[1];

  try {
    if (dPadUp.pressed) {
      if (el?.role === "menuitemradio") {
        sendButtonPressToElectron("up");
      } else {
        sendButtonPressToElectron("dPadUp");
      }
    }
    if (dPadDown.pressed) {
      if (el?.role === "menuitemradio") {
        sendButtonPressToElectron("down");
      } else {
        sendButtonPressToElectron("dPadDown");
      }
    }
    if (dPadLeft.pressed) {
      sendButtonPressToElectron("dPadLeft");
    }
    if (dPadRight.pressed) {
      sendButtonPressToElectron("dPadRight");
    }
    if (aButton.pressed) {
      sendButtonPressToElectron("aButton");
    }
    if (bButton.pressed) {
      sendButtonPressToElectron("bButton");
    }
  } catch (e) {
    console.error("error while listening for section buttons", e);
  }
};

const sendButtonPressToElectron = debounce(
  sendButtonPressToElectronOriginal,
  70
);

function sendButtonPressToElectronOriginal(buttonPressed) {
  if (window.electronUtilsRender?.gamepadButtonPress) {
    window.electronUtilsRender.gamepadButtonPress(buttonPressed);
  }
}

window.setControllerEnabled = (b) => {
  enabled = Boolean(b);
};

setupGamepadEventListener();
