import
  pkg/saohime,
  saohime_audio/components,
  saohime_audio/resources,
  saohime_audio/systems

type
  AudioPlugin* = ref object

proc build*(plugin: AudioPlugin, world: World) =
  world.addResource(Audio.new())
  world.registerStartupSystems(initAudio)
  world.registerTerminateSystems(quitAudio)

export
  components,
  resources,
  systems

