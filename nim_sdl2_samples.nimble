# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @[
  "sample_001_window",
  "sample_002_keyevent",
  "sample_003_draw_image",
  "sample_004_move_image",
  ]
binDir        = "bin"


# Dependencies

requires "nim >= 1.0.4"
requires "sdl2 >= 2.0.2"
