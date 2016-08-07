json.extract! puzzle_piece, :id, :x_coord, :y_coord, :image_uri, :note, :created_at, :updated_at
json.url puzzle_piece_url(puzzle_piece, format: :json)