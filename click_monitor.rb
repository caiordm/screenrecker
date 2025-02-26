require 'mouse'
require 'mini_magick'
require 'fileutils'

output_dir = "clicks"
FileUtils.mkdir_p(output_dir)

puts "Monitorando cliques... Pressione Ctrl+C para sair."

Mouse.click do |button, x, y|
  puts "Clique detectado em: #{x}, #{y}"

  timestamp = Time.now.to_i
  output_file = "#{output_dir}/click_#{timestamp}.png"

  # Captura um print do clique
  system("screencapture -R#{x-100},#{y-100},200,200 #{output_file}")

  image.write(output_file)

  puts "Clique salvo com destaque!"
end
