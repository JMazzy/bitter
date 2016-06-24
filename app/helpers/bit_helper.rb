module BitHelper

  def bit_to_block(bit)
    if bit == 1
      "<div class='bit-block one'></div>".html_safe
    else
      "<div class='bit-block zero'></div>".html_safe
    end
  end

  def bits_to_bytes(bits)
    bitstring = bits.map { |b| b.data }.join("")
    bytes = []
    while bitstring.length > 0
      bytes << bitstring.slice!(0..7)
    end

    bytes
  end

  def bits_to_dec(bits)
    bits_to_bytes(bits).map { |b| b.to_i(2) }
  end

  def bits_to_gray(bits)
    shades = bits_to_dec(bits)

    shades.map { |byte| "<span class='bit-block' style='background-color:rgb( #{byte}, #{byte}, #{byte} )'></span>".html_safe}
  end

  def bits_to_color8(bits)
    bytes = bits_to_bytes(bits)
    colors = []
    # 3 bits red, 3 bits green, 2 bits blue
    bytes.each do |byte|
      break if byte.length < 8

      red = (255 * ( byte[0...2].to_i(2) / 7.0 )).floor
      green = (255 * ( byte[3...5].to_i(2) / 7.0 )).floor
      blue = (255 * ( byte[6...7].to_i(2) / 3.0 )).floor

      colors << "<span class='bit-block' style='background-color:rgb( #{red}, #{green}, #{blue} )'></span>".html_safe
    end

    colors
  end

  def bits_to_color24(bits)
    shades = bits_to_dec(bits)

    colors = []
    while shades.length > 0
      color = shades.slice!(0..2)

      colors << "<span class='bit-block' style='background-color:rgb( #{color[0]}, #{color[1]}, #{color[2]} )'></span>".html_safe
    end

    colors
  end

end
