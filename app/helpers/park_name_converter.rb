module ParkNameConverter
def park_codes
    {
      'ACADIA' => 'ACAD',
      'ARCHES' => 'ARCH',
      'BADLANDS' => 'BADL',
      'BIG BEND' => 'BIBE',
      'BISCAYNE' => 'BISC',
      'BLACK CANYON OF THE GUNNISON' => 'BLCA',
      'BRYCE CANYON' => 'BRCA',
      'CANYONLANDS' => 'CANY',
      'CAPITOL REEF' => 'CARE',
      'CARLSBAD CAVERNS' => 'CAVE',
      'CHANNEL ISLANDS' => 'CHIS',
      'CONGAREE' => 'CONG',
      'CRATER LAKE' => 'CRLA',
      'CUYAHOGA VALLEY' => 'CUVA',
      'DEATH VALLEY' => 'DEVA',
      'DENALI' => 'DENA',
      'DRY TORTUGAS' => 'DRTO',
      'EVERGLADES' => 'EVER',
      'GATES OF THE ARCTIC' => 'GAAR',
      'GLACIER' => 'GLAC',
      'GLACIER BAY' => 'GLBA',
      'GRAND CANYON' => 'GRCA',
      'GRAND TETON' => 'GRTE',
      'GREAT BASIN' => 'GRBA',
      'GREAT SAND DUNES' => 'GRSA',
      'GREAT SMOKY MOUNTAINS' => 'GRSM',
      'GUADALUPE MOUNTAINS' => 'GUMO',
      'HALEAKALA' => 'HALE',
      'HAWAII VOLCANOES' => 'HAVO',
      'HOT SPRINGS' => 'HOSP',
      'ISLE ROYALE' => 'ISRO',
      'JOSHUA TREE' => 'JOTR',
      'KATMAI' => 'KATM',
      'KENAI FJORDS' => 'KEFJ',
      'KINGS CANYON' => 'SEKI',
      'KOBUK VALLEY' => 'KOVA',
      'LAKE CLARK' => 'LACL',
      'LASSEN VOLCANIC' => 'LAVO',
      'MAMMOTH CAVE' => 'MACA',
      'MESA VERDE' => 'MEVE',
      'MOUNT RAINIER' => 'MORA',
      'NATIONAL PARK OF AMERICAN SAMOA' => 'NPSA',
      'NORTH CASCADES' => 'NOCA',
      'OLYMPIC' => 'OLYM',
      'PETRIFIED FOREST' => 'PEFO',
      'PINNACLES' => 'PINN',
      'REDWOOD' => 'REDW',
      'ROCKY MOUNTAIN' => 'ROMO',
      'SAGUARO' => 'SAGU',
      'SEQUOIA' => 'SEKI',
      'SHENANDOAH' => 'SHEN',
      'THEODORE ROOSEVELT' => 'THRO',
      'VIRGIN ISLANDS' => 'VIIS',
      'VOYAGEURS' => 'VOYA',
      'WIND CAVE' => 'WICA',
      'WRANGELL-ST. ELIAS' => 'WRST',
      'YELLOWSTONE' => 'YELL',
      'YOSEMITE' => 'YOSE',
      'ZION' => 'ZION'
    }
  end 
    
  def convert_to_park_code(park_name)
    park_codes[park_name]
  end

  def convert_to_park_name(park_code)
    new_hash = park_codes.invert
    new_hash[park_code]
  end
end