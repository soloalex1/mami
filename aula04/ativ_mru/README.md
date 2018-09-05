# Atividade 3

`
Explicar as alterações necessárias no código para a execução da simulação a 60 FPS, mantendo o tempo real.
`

Em sala, fizemos no Processing uma atividade que seria a primeira parte da construção de um simulador de lançamento balístico. Para facilitar a compreensão e resolução do problema, adotamos algumas convenções:

 - Adotamos a escala de 1px = 1m para deixar os cálculos de movimento e velocidade mais simplificados;
 - Adotamos o tempo real como unidade de tempo, com um segundo da aplicação correspondendo a um segundo do tempo real.

Neste último, diminuímos a velocidade da simulação através da função `frameRate()` do Processing, alterando a taxa de quadros de 60FPS (padrão da IDE) para 1FPS, o que nos dá a impressão de tempo real.

Durante a aula, simulamos um movimento uniforme horizontal de um círculo de raio 5m com velocidade de 10m/s, mantendo o rastro das posições do corpo na tela, com uma grade regular ao fundo para facilitar a visualização do movimento.

Conforme solicitado na atividade, a alteração seria para simular em tempo real, removendo a alteração na taxa de quadros citada acima. Obviamente, somente essa alteração causaria um efeito indesejado na animação.

Visivelmente, não é o efeito buscado. Para atingi-lo, no entanto, precisamos analisar a situação atual: dado o incremento da variável de tempo passada como argumento da função de movimentação, o círculo atinge a velocidade de 60m/s, correspondente à taxa de atualização de quadros por segundo no Processing.

Para atingir o efeito pretendido, no entanto, é necessário encontrar um valor de incremento que corresponda ao tempo real, fazendo que o círculo se mova 1m a cada quadro, na taxa atual de 60FPS. Logo, a divisão seria de um segundo pela quantidade de quadros, chegando à divisão de 1 / 60.

Contudo, até aqui utilizamos números inteiros para calcular a movimentação, o que torna o resultado impreciso, por arredondar para 0, uma vez que números inteiros não permitem utilização de casas decimais. Assim, o corpo não chega a se mover de fato. 

Para corrigir esse erro, utilizei números do tipo float (ou ponto flutuante), que ao contrário dos números inteiros, permite utilização de casas decimais, dando uma maior precisão na simulação e passando o valor de 0.016 (aproximadamente). 