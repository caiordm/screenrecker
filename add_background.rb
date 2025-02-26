puts "Adicionando fundo ao vídeo..."
system("ffmpeg -loop 1 -i background_hd.jpg -i output.mp4 -filter_complex '[1:v]scale=iw*0.8:-1[vid];[0:v][vid]overlay=(W-w)/2:(H-h)/2' -c:a copy -shortest final_video.mp4")
puts "Vídeo final salvo como final_video.mp4!"