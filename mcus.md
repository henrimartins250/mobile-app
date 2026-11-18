# 1. conceitos fundamentais

sistemas embarcados se trata da junção entre codigo e hardware, onde um sistema passa a controlar sistemas fisicos atravez de sensores, atuadores, etc,
exemplos disto podem ser vistos em simples equipamentos do dia dia como um teclado onde um microcontrolador é responsavel por ler a matriz e enviar a tecla
correnspondente para o computador desde a sistemas complexos como drones e robos onde são usados para diversos propositos como calcular o trote nescessario
de um motor, captar respostas do ambiente e processar imagens.

# 2. Sistemas embarcados e Iot 
sistemas embarcados tem um grande papel dentro da internet das coisas, ao conectar um microcontrolador a internet, você passa a poder controlar
ou visualizar elementos atravez da internet, você pode visualizar isto com o exemplo de uma impressora 3d com um sistema Iot como o mainsail em que atraves
de uma SBC(single board computer), o sistema pode servir uma aplicação web, onde você pode controlar e monitorar elementos como temperatura da cama,
temperatura da extrusora, velocidade de impressão, falhas etc, porem nem todo sistema embarcado precisa estar conectado a internet, continuando
com o exemplo de uma impressora 3d, uma MCU(microcontroller unit) já é o suficiente para controlar uma impressão, e a interação com o usuario pode ser
feita atravez de um display lcd por exemplo. 

# 3. Microntroladores
microcontroladores são elementos essenciais dentro do conceito de sistemas embarcados, estes se tratam de pequenos processadores programaveis em que você
pode enviar um programa para ser executado pela MCU, frequentemente esses microcontroladores podem ser adquiridos em formato de uma devboard, estas são 
placas de circuito com uma mcu embutida, uma porta de comunicação, como uma entrada usb, e pinos gpio, que são o elemento principal para interagir
com hardware, dentre os microcontroladores mais comuns estão o ATMEGA, frequentemente encontrado em placas arduino como porta de entrada para aprender
o basico de sistemas embarcado, ESP32 com modulo de wifi embutido frequentemente usado em aplicaçãoes Iot, STM32 frequentemente usado em aplicações industriais
se tratando de uma mcu mais potente, RPxxxx(raspberry Pi) sendo frequentemente usado em projetos de hobby, devido a sua facilidade de uso e melhor capacidade
de processamento entre outras.

# 4. processamento e memoria

microcontroladores veem com uma memoria flash especifica, esta deve estar de acordo com a aplicação a ser usada, assim como a capacidade de processamento,
por exemplo, um processador stm32Go31 é capaz de realizar tarefas simples e ocupa um espaço minusculo, sendo ideal para aplicaçãos compactas,
possuindo um processador de 64 Mhz e cerca de 64kb de memoria flash e 8kb de memoria ram, é capaz de realizar uma ampla gama de tarefas simples, 
porem não seria capaz de realizar aplicaçãoes que precisem de muitos calculos, como exemplo um drone, neste caso uma mcu como o stm32f411 seria um melhor
candidato para este fim, possuindo um processador de 100mhz, supporte para calculos usando numeros reais com precisão e velocidade, 512kb de memoria flash,
128kb de ram, permanecendo compacto, seria ideal para os requisitos de um drone simples.

# 5. sensores e atuadores

imagine uma estufa inteligente que precise monitorar a temperatura e acionar um ventilador automaticamente para resfriar o local, este problema pode ser
resolvido de varias formas, porem uma solução simples pode envolver apeanas um sensor de temperatura(sensor), um relé(atuador) e um microcontrolador,
neste contexto, o microcontrolador deverá ser programado para monitorar a temperatura lida pelo sensor, e ao chegar em uma certa temperatura, enviar um sinal
eletrico para o atuador, que então ira fechar o circuito ligando o ventilador, quando a temperatura normalizar, o microcontrolador deve enviar novamente um sinal eletrico para desligar o rele, cortando a corrente do vetilador, e repetindo o ciclo.

# 6. 
