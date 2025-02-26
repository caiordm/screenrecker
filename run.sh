#!/bin/bash
ruby recorder.rb &  # Inicia a gravação em background
ruby click_monitor.rb  # Inicia monitoramento de cliques
wait  # Espera até a gravação terminar
ruby merge.rb  # Junta os frames em vídeo
ruby add_background.rb  # Adiciona o fundo
echo "Vídeo finalizado!"
