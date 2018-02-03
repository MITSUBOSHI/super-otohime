Toilet.find_or_create_by(longitude: '139.703023', latitude: '35.6598498', floor_no: 3, current_base_song_id: 1)
Toilet.find_or_create_by(longitude: '', latitude: '', floor_no: 1, current_base_song_id: nil)
Toilet.find_or_create_by(longitude: '', latitude: '', floor_no: 3, current_base_song_id: nil)

Room.find_or_create_by(toilets_id: 1, device_code: '21075C', room_state_id: 1)
Room.find_or_create_by(toilets_id: 2, device_code: 'hogehoge', room_state_id: 1)
Room.find_or_create_by(toilets_id: 3, device_code: 'hogehoge2', room_state_id: 1)
