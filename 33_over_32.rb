require 'bloops'

b = Bloops.new
b.tempo = 135

base = b.sound Bloops::SQUARE
base.volume = 0.35
base.punch = 0.3
base.sustain = 0.3
base.decay = 0.3
base.phase = 0.2
base.lpf = 0.115
base.resonance = 0.55
base.slide = -0.4

snare = b.sound Bloops::NOISE
snare.attack = 0.075
snare.sustain = 0.01
snare.decay = 0.33
snare.hpf = 0.55
snare.resonance = 0.44
snare.dslide = -0.452

chord = b.sound Bloops::SQUARE
chord.volume = 0.275
chord.attack = 0.05
chord.sustain = 0.2
chord.decay = 0.9
chord.phase = 0.35
chord.psweep = -0.25
chord.vibe = 0.0455
chord.vspeed = 0.255

bass_riff = 4.times.map { 
  "16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A " + 
  "16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A 16 16A 16A 16A "
}.join

snare_riff = 4.times.map {                                                                                                                                                                                                            
  "16 16 16A 16 16 16 16A 16 16 16 16A 16 16 16 16A 16 16 16 16A 16 16 16 16A 16 16 16 " +
  "8A 8 8A 8 8A 8 8A 8 8A 8 8A 8 8A 8 8A 8 8A 8 8A 8 "
}.join   

chord_riff = 4.times.map {
  "8B 8A 8F 8G 8 8 8 8 8F 8B 8F 8G 8 " +
   " + 8C 8 8D 8 8C 8 - 8B 8 8G# 8 8B 8 8G# 8 8B 8 + 8C# 8 8D 8 - "
}.join

standard_time_bass = 24.times.map { "4A 4 4A 4 4A 4 4A 4 " }.join
standard_time_snare = 24.times.map { "4 4A 4 4A 4 4A 4 4A " }.join
standard_rhythm_backer =  2.times.map {" 16D 16D 16D 16D 16D 16D 16D 16D 16A 16A 16A 16A 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16A 16A 16A 16A 16D + 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16A 16A 16A 16A 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16D 16A 16A 16A 16A 16 16D 16D 16D - "}.join
alternating_melody = " - - " + 2.times.map { chord_riff + standard_rhythm_backer }.join

# part 1, no 4/4 backing beat
b.tune base, bass_riff
b.tune snare, snare_riff
b.tune chord, chord_riff
b.play
sleep 1 while !b.stopped?

# sleep 0.25

# part 2, with backing beat
b = Bloops.new
b.tempo = 135

b.tune base, standard_time_bass
b.tune snare, standard_time_snare
b.tune chord, alternating_melody
b.play
sleep 1 while !b.stopped?
