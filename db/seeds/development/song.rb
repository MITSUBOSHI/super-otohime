BaseSong.find_or_create_by(name: 'hackathon_music', has_effect: true)

4.times do |i|
  i += 1
  EffectSong.find_or_create_by(
    base_song_id: 1,
    level: i,
    path: "file#{i}"
  )
end
