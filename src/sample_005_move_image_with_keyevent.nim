import sdl2, sdl2/gfx, sdl2/image

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("sample_005_move_image_with_keyevent.nim", 100, 100, 640,480, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  fpsman: FpsManager
fpsman.init

# new code
let texture = render.loadTexture("assets/hello_world.png")

# new code
var
  x, y: cint

while runGame:
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      runGame = false
      break

    # ========================================
    # begin new code
    # ========================================
    case evt.kind
    of KeyDown:
      let scancode = evt.key.keysym.scancode
      case scancode
      of SDL_SCANCODE_UP:
        dec(y, 10)
      of SDL_SCANCODE_RIGHT:
        inc(x, 10)
      of SDL_SCANCODE_DOWN:
        inc(y, 10)
      of SDL_SCANCODE_LEFT:
        dec(x, 10)
      else:
        discard
    else:
      discard
    # ========================================
    # end new code
    # ========================================

  render.setDrawColor 0,0,0,255
  render.clear

  var
    src = rect(0, 0, 110, 22)
    dst = rect(x, y, 110, 22) # new code
  discard render.copyEx(texture,
    src,
    dst,
    angle = 0.0,
    center = nil,
    flip = SDL_FLIP_NONE,
    )

  render.present
  fpsman.delay

destroy render
destroy window
