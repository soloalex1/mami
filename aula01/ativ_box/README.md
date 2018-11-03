# Atividade 2

Assim como na atividade anterior, para representar graficamente de uma maneira mais
compreensível, espera-se que haja algum tipo de interação. Contudo, cabe uma
explicação sobre formas 3D no Processing para fins de registro.

Ao contrário das formas 2D convencionais (como `rect()` e `ellipse()`), o Processing não permite posicionar via
argumentos (uma vez que `box()` e `sphere()` recebem apenas argumentos de dimensionamento). Entretanto, é possível
utilizar os métodos `rotate()` e `translate()`, descritos com mais detalhes na documentação do Processing. 

Com isso em mente, sabe-se que é possível redimensionar as formas 3D em tempo de execução, dado algum input do 
usuário. Para tal, fiz uso da biblioteca ControlP5 para criar uma GUI simples para o usuário.

Para calcular a área, é empregada a função `calcVol()`, que retorna o valor do produto entre as dimensões. Essa função
é chamada a cada clique no botão "Área", e o resultado é exibido na caixa de texto do lado direito da tela.

Contudo, acredito que o fato mais importante dessa abordagem é o redimensionamento da forma em tempo de execução, que dá
um retorno visual imediato para o usuário. Os valores dos sliders são configurados em `setup()`, recuperados pelas variáveis globais (`valX`, `valY` e `valZ`)
e aplicados na forma em `draw()`, sendo utilizados como parâmetros da própria função `box()`. A natureza do método `draw()`, por sua vez, garante o redimensionamento 
da figura de acordo com as interações dos usuários com os sliders.