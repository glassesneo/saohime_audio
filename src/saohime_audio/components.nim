import
  pkg/seiryu,
  pkg/slappy

type
  SoundSpeaker* = ref object
    sound: Sound

proc new*(T: type SoundSpeaker, sound: Sound): T {.construct.}

proc play*(speaker: SoundSpeaker) =
  discard speaker.sound.play()

