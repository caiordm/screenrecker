puts "Criando video"
system("ffmpeg -framerate 3 -i frames/frame_%d.png -c:v libx264 -pix_fmt yuv420p output.mp4")
puts "Video salvo como output.mp4"