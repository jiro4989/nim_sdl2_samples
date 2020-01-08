import sdl2, sdl2/gfx, sdl2/image

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("sample_004_move_image.nim", 100, 100, 640,480, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  fpsman: FpsManager
fpsman.init

# new code
let texture = render.loadTexture("assets/hello_world.png")

var
  x, y: cint

while runGame:
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      runGame = false
      break

  render.setDrawColor 0,0,0,255
  render.clear

  var
    src = rect(0, 0, 110, 22)
    dst = rect(x, y, 110, 22)
  discard render.copyEx(texture,
    src,
    dst,
    angle = 0.0,
    center = nil,
    flip = SDL_FLIP_NONE,
    )

  render.present
  fpsman.delay
  x += 10
  y += 5
  if 200 < x:
    x = 0
  if 200 < y:
    y = 0

destroy render
destroy window

