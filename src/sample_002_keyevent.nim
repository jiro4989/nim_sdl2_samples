import sdl2, sdl2/gfx

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("sample_002_keyevent.nim", 100, 100, 640,480, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  fpsman: FpsManager
fpsman.init

while runGame:
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      echo "Quit event: " & $evt
      runGame = false
      break

    # ========================================
    # begin new code
    # ========================================
    case evt.kind
    of KeyDown, KeyUp:
      let scancode = evt.key.keysym.scancode
      case scancode
      of SDL_SCANCODE_UP: echo "Key = up arrow, Code = " & $scancode
      of SDL_SCANCODE_RIGHT: echo "Key = right arrow, Code = " & $scancode
      of SDL_SCANCODE_DOWN: echo "Key = down arrow, Code = " & $scancode
      of SDL_SCANCODE_LEFT: echo "Key = left arrow, Code = " & $scancode
      else:
        discard
    else:
      discard
    # ========================================
    # end new code
    # ========================================

  let dt = fpsman.getFramerate() / 1000

  render.setDrawColor 0,0,0,255
  render.clear

  render.present
  fpsman.delay

destroy render
destroy window
