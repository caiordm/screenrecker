require 'io/console'
require 'fileutils'
require 'time'

output_dir = "frames"
FileUtils.mkdir_p(output_dir)

puts "Pressione [ENTER] para começar a gravação e [Q] para parar."
STDIN.getch  # Espera o usuário pressionar Enter

fps = 30
frame_interval = 1.0 / fps
frame_count = 0
start_time = Time.now  # Marca o início da gravação

puts "Gravando... Pressione [Q] para parar."

begin
  loop do
    start_frame_time = Time.now  # Marca o início da captura do frame
    system("screencapture -x -C #{output_dir}/frame_#{frame_count}.png")

    frame_count += 1

    # Calcula o tempo restante até o próximo frame
    next_frame_time = start_time + (frame_count * frame_interval)
    sleep_time = next_frame_time - Time.now

    # Se o tempo de captura exceder o frame_interval, ajuste o próximo frame
    if sleep_time > 0
      sleep(sleep_time)
    else
      puts "Aviso: Frame #{frame_count} atrasado. Ajustando o tempo..."
    end

    # Verifica se o usuário pressionou "Q" sem bloquear a execução
    if IO.select([STDIN], nil, nil, 0)
      char = STDIN.getch.downcase
      break if char == 'q'
    end
  end
rescue Interrupt
  puts "\nGravação interrompida pelo usuário."
end

puts "Gravação encerrada!"
