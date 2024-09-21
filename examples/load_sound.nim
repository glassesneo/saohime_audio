import
  std/os,
  pkg/saohime,
  pkg/saohime/default_plugins,
  ../src/saohime_audio

proc setup(
    audio: Resource[Audio],
) {.system.} =
  audio.gain = 1
  let sound = newSound(getAppDir()/"assets/coin.wav")
  commands.create()
    .attach(SoundSpeaker.new(sound))

proc pollEvent(appEvent: Event[ApplicationEvent]) {.system.} =
  for e in appEvent:
    let app = commands.getResource(Application)
    app.terminate()

proc play(
    entities: [All[SoundSpeaker]],
    keyboardEvent: Event[KeyboardEvent],
) {.system.} =
  for e in keyboardEvent:
    if e.isPressed(K_Space):
      for _, speaker in entities[SoundSpeaker]:
        speaker.play()

let app = Application.new()

app.loadPluginGroup(DefaultPlugins)
app.loadPlugin(AudioPlugin)

app.start:
  world.registerStartupSystems(setup)
  world.registerSystems(pollEvent, play)

