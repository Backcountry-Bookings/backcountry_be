module ParkNameConverter
  def convert_to_park_code(park_name)
    park_codes = {
      'acadia' => 'ACAD',
      'rocky mountain' => 'ROMO',
      'zion' => 'ZION'
    }

    park_codes[park_name]
  end
end