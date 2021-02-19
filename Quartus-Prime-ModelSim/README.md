# Tutorial de Simulação Utilizando o ModelSim apartir do Quartus Prime

Neste tutorial você irá projetar um circuito combinacional de três entradas e uma saída. O circuito trata de um Somador Completo de um bit, entradas `A`, `B` e `Carry_in`, e saída `Sum`. Note que um somador completo possui ainda uma segunda saída, `Carry_out`.

O procedimento desta parte será fazer o seguinte:

- Criar um novo projeto
- Adicionar um arquivo Verilog que descreve o circuito
- Adicionar um arquivo Verilog que fornece as entradas
- Simular o circuito
- Observar as saídas e verificar se elas estão corretas

## Criando um projeto

Crie uma pasta no seu computador onde você irá clonar este repositório. Certifique-se de que não há espaços no caminho para os arquivos! No diretório `proj` você verá a estrutura de diretórios a seguir.

- `fpga`: diretório onde será criado o projeto do Quartus Prime.
- `sim`: diretório onde serão armazenados os arquivos de simulação.
- `rtl`: diretório onde serão armazenados os arquivos HDL.

Abra o Quartus Prime clicando duas vezes no ícone da sua área de trabalho, ou digitando o comando `quartus &` no termina, e crie um novo projeto usando o _New Project Wizard_.

![New Project Wizard](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/0-new_project.png)

Na primeira caixa de diálogo, escolha o caminho para o diretório do projeto: `caminho/para/a/pasta/gcet231/tutorial3-simulacao-hdl/proj/fpga`. Na segunda caixa de diálogo, informe o nome do projeto: tutorial-adder. Por último, a terceira caixa de diálogo indica qual será o circuito a ser analisado. Deixe como está por enquanto e clique em _Next_.

![Especificações básicas do projeto](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/1-create_project.png)

Em seguida:

- Na janela de diálogo `Project Type`, escolha `Empty projet` e clique em `Next`.
- Na janela de diálogo `Add Files`, clique em `Next`.
- Na janela `Family, Device & Board Settings` escolha a família `Cyclone IV E` e o dispositivo `EP4CE115F29C7`, como mostrado a seguir e clique no botão `Finish` (não vamos nos preocupar com essa parte por enquanto).

![Family, Device and Board Settings](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/4-device.png)

Você acabou de finalizar a criação de um novo projeto vazio. Você deve ver uma janela como esta:

![Tela inicial do projeto](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/5-quartus-prime.png)

## Adicionando um Novo Arquivo Fonte

Na barra de tarefas, clique em no botão `New`, escolha a opção `Verilog HDL File` e clique em `OK`.

![New file](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/6-add_new_file.png)

Salve o arquivo e chame-o de `halfadder.v`. Em seguida na janela de tarefas `Project Navigator`, selecione a aba `File`. Clique com o botão direito sobre o arquivo `halfadder.v` e marque o item `Set as Top-Level Entity`.

![Set top level entity](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/7-top_level.png)

Agora, vamos escrever nosso primeiro arquivo Verilog. Preencha a sua descrição com o código apresentado a seguir:

```verilog
module halfadder (
   input A,
   input B,
   input Cin,
   output Sum
);

   assign Sum = Cin ^ A ^ B;
endmodule
```

Note que `^` é o símbolo para a operação ou-exclusivo (XOR). Este fragmento de código corresponde à equação Booleana extraída da Tabela Verdade do meio somador. Não esqueça de salvar o arquivo.

## Simulação Simples

Para simular seu circuito, você precisará especificar um conjunto de entradas (que mudarão ao longo do tempo). Para isso, novamente, clique com o botão direito na janela `Project Navigator` e selecione `Add/Remove Files in Project...`

![Add new file to project...](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/8-add_tb.png)

Na janela de diálogo `Add Files`, clique no botão indicado por "`...`" para selecionar os arquivos do projeto. Navegue até o diretório sim e selecione o arquivo `halfadder_test.v` e clique em `OK`.

![Add files](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/9-add_tb-2.png)

O papel do arquivo de testes é fornecer entradas e receber saídas do módulo meio somador. Para isso, o testador envolve o circuito, de modo que ele não possua nenhuma entrada ou saída
(verificar diagrama).

![Diagrama Simulação](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/tester.png)

Antes de darmos início aos testes, iremos configurar a ferramenta de simulação. Primeiramente, clique em `Tools > Options > EDA Tool Options` para especificar a localização do simulador. Em `ModelSim-Intel`, introduza o caminho onde se encontra o executável do ModelSim Intel FPGA Edition:

- No Linux: `<QUARTUS_INSTALL_DIR>/modelsim_ase/linuxaloem`
- No Windows: `<QUARTUS_INSTALL_DIR>/modelsim_ase/win32aloem`

![Configuração do Diretório do ModelSim](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/91-eda_tools.png)

Clique em `Assignments > Settings > EDA Tool Settings > Simulation` e especifique as informações especificadas a seguir.

![Configurações Simulation](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/92-eda_settings.png)

Em `NativeLink settings`, selecione a opção `Compile test bench`, e então clique no botão `TestBenches`. Clique em `New` e especifique o `Testbench name` e o `Top level module in test bench` como `halfadder_test`. Em `Testbench and simulation files`, selecione o arquivo `halfadder_test.sv`, clique em `Add`, e então clique em `OK`.

![Testbench config](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/93-tester.png)

Antes de simular seu circuito`, é preciso compilar seu projeto. Para compilar, clique em `Processing > Start > Start Analysis and Elaboration`. Clique em `Tools > Run Simulation Tool > RTL Simulation`.

O simulador irá executar e uma janela de saída será produzida mostrando o resultado do seu teste. A janela do ModelSim surgirá como descrito abaixo.

![ModelSim](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/94-modelsim.png)

Clique na janela `Wave` para visualizar a forma de onda da simulação. Para visualizar a simulação completa clique em `Wave > Zoom > Zoom Full`.

![ModelSim Waveform](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/Quartus-Prime-ModelSim/images/95-zoom_full.png)

Agora você vera a forma de onda resultante de todas as entradas, e também da saída!
