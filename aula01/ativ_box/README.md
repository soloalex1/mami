# Atividade 2

`
Discutir e justificar o uso de funções num modelo computacional que, empregando a instrução box() do Processing, demonstra graficamente que o cubo é o paralelepípedo que apresenta o melhor aproveitamento de volume.
`

Assim como na atividade anterior, para representar graficamente de uma maneira mais compreensível para um usuário comum, espera-se que haja algum tipo de interação. Antes disso, cabe aqui uma explicação sobre formas 3D no Processing para fins de esclarecimento.

Ao contrário das formas 2D convencionais (como `rect()` e `ellipse()`), o Processing não permite posicionar formas tridimensionais através dos argumentos (uma vez que `box()` e `sphere()` recebem apenas as dimensões da forma). Entretanto, é possível utilizar as funções `rotate()` e `translate()`, descritos com mais detalhes na documentação do Processing.

Com isso em mente, pensei em uma maneira de redimensionar as formas 3D em tempo de execução, dado algum input do usuário.

Pesquisei um pouco sobre interfaces no Processing e encontrei a biblioteca ControlP5, ideal para criação e manipulação de elementos de interação como sliders, botões e áreas de output de texto para o usuário. Após uma consulta rápida à referência, vi que a biblioteca seria ideal para a demonstração, por ser simples e dinâmica.

Para tal, criei três sliders: um para cada eixo (x, y, z) da minha forma. Por recuperar os seus valores em tempo real pelo método `draw()`, é possível redimensionar o cubo em tempo de execução.

Acredito que o ponto forte dessa abordagem é o redimensionamento da forma em tempo de execução, que dá um retorno visual imediato para o usuário. Os valores dos sliders são configurados em setup(), recuperados pelas variáveis globais dos eixos (`valX`, `valY` e `valZ`) e aplicados na forma em `draw()`, sendo utilizados como parâmetros da própria função box(). A natureza do método draw(), por sua vez, garante o redimensionamento da figura de acordo com as interações dos usuários com os sliders.

Dito isso, a disposição dos elementos em tela não era um retorno suficiente para o usuário. Reagrupei os sliders no lado esquerdo da tela e expandi a caixa de texto para ocupar toda a parte inferior.

Para calcular a área, é empregada a função `calcVol()`, que retorna o valor do produto entre as dimensões. Essa função é chamada a cada clique no botão “Calcular área”, e o resultado é exibido na caixa de texto. Contudo, o resultado ainda não era suficientemente intuitivo. Optei por adicionar uma mudança de cor na ocasião de aproveitamento máximo, alterando os parâmetros do preenchimento do cubo. 

O código está comentado nas partes que julguei mais importantes.
