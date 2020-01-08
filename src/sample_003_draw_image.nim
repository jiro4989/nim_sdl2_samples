import sdl2, sdl2/gfx, sdl2/image

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("sample_003_draw_image.nim", 100, 100, 640,480, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  fpsman: FpsManager
fpsman.init

# new code
let texture = render.loadTexture("assets/sample_003_draw_image.png")

while runGame:
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      runGame = false
      break

  render.setDrawColor 0,0,0,255
  render.clear

  # ========================================
  # begin new code
  # ========================================
  var
    src = rect(0, 0, 110, 22)
    dst = rect(0, 0, 110, 22)
  discard render.copyEx(texture,
    src,
    dst,
    angle = 0.0,
    center = nil,
    flip = SDL_FLIP_NONE,
    )
  # ========================================
  # end new code
  # ========================================

  render.present
  fpsman.delay

destroy render
destroy window
