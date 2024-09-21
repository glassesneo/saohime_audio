import
  pkg/saohime,
  pkg/slappy

proc initAudio* {.system.} =
  slappyInit()

proc quitAudio* {.system.} =
  slappyClose()

