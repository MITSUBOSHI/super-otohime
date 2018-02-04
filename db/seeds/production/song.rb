3.times do |i|
  i += 1
  BaseSong.find_or_create_by(
    name: "hackathon_music#{i}",
    song_code: "code#{i}",
    has_effect: true
  )
end

5.times do |i|
  EffectSong.find_or_create_by(
    base_song_id: 1,
    level: i,
    path: "hoge#{i}"
  )
end
