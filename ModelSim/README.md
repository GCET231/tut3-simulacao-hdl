# Tutorial de Simulação Utilizando o ModelSim

Neste tutorial você irá projetar um circuito combinacional de três entradas e uma saída. O circuito trata de um Somador Completo de um bit, entradas `A`, `B` e `Carry_in`, e saída `Sum`. Note que um somador completo possui ainda uma segunda saída, `Carry_out`.

O procedimento desta parte será fazer o seguinte:

- Criar um novo projeto no ModelSim
- Adicionar um arquivo Verilog que descreve o circuito
- Adicionar um arquivo SystemVerilog que fornece as entradas
- Simular o circuito
- Observar as saídas e verificar se elas estão corretas

## Criando um projeto

Crie uma pasta no seu computador onde você irá clonar este repositório. Certifique-se de que não há espaços no caminho para os arquivos! No diretório `proj` você verá a estrutura de diretórios a seguir.

- `fpga`: diretório onde será criado o projeto do Quartus Prime.
- `sim`: diretório onde serão armazenados os arquivos de simulação.
- `rtl`: diretório onde serão armazenados os arquivos HDL.

Abra o ModelSim clicando duas vezes no ícone da sua área de trabalho, ou digitando o comando `vsim &` no terminal, e crie um novo projeto Clicando em `File -> New -> Project`.

Você verá uma janela semelhante à que é apresentada abaixo. Escolha onde o seu novo projeto será armazenado. Para o nosso exemplo: `caminho/para/a/pasta/gcet231/tutorial3-simulacao-hdl/proj/sim/modelsim` e chame-o de tutorial-adder. Projetos no ModelSim possuem a extensão `.prj`. Deixe as outras configuração com as opções padrão.

![Criando novo projeto](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/01-create_project.png)

## Adicionando um Novo Arquivo Fonte

Clique em `Create New File`.

![Criando novo arquivo](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/02-create_new_file.png)

Na janela que segue chame seu arquivo de halfadder e salve-o dentro do diretório `rtl`. Na opção **Add file as type** escolha `Verilog`.

![Criando novo arquivo](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/03-name_file.png)

De volta para a janela de criação do projeto, clique em `Add Existing File`. Navegue até o diretório `sim` e adicione o arquivo `halfadder_test.sv` ao seu projeto. Mantenha as demais configuração com seus valores padrão. Clique em `OK` quando finalizar.

![Adicionando novo arquivo](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/04-add_file.png)

Agora, vamos escrever nosso primeiro arquivo Verilog. Clique duas vezes para abrir o arquivo `halfadder.v` e preencha a sua descrição com o código apresentado a seguir:

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

![Janela do Modelsim com os novos arquivos](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/05-code_halfadder.png)

Agora observe aquelas duas interrogações azuis na janela `Project` da figura acima. Isso significa que o ModelSim não compilou os arquivos ainda. Você precisa compilar os códigos clicando com o botão direito em `halfadder.v`, em seguida selecione `Compile -> Compile All`. Você deve visualizar algumas mensagem na janela `Console` em verde indicando que a compilação foi bem sucedida.

![Compilação do Código no ModelSim](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/06-compile_result.png)

Para iniciar sua simulação, clique em `Simulate` na barra de menus, então clique em `Start Simulation`. Isso fará com que seja aberta a janela de simulação. Escolha `work -> halfadder_test` e clique em `OK`.

![Janela de seleção da simulação](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/07-start_simulation.png)

A simulação está pronta e aguardando os próximos comandos. Agora vamos nos concentrar na visualização de forma de onda do ModelSim. A janela de waveforms apresenta formas de onda (0's e 1's binários, dígitos em hexadecimal, binários, tipos enumerados, etc.) para todos os sinais do seu circuito. Ele representa como seu circuito reage a diferentes estímulos.

No nosso exemplo, vamos monitorar todos os sinais do nosso testador. Para isso, clique com o botão direito em `halfadder_test` e em seguida `Add Wave`. Você também pode clicar e arrastar sinais para a janela de waveforms do ModelSim.

![Add Waveforms](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/08-add_wave.png)

Note agora que todos os sinais do _testbench_ foram adicionados. Para executar a simulação clique no ícone com um pequeno pedaço de papel e uma seta para baixo, modificando antes o tempo de simulação para `100 ns`. Ao final da simulação, uma janela deve se abrir perguntando se deseja encerrar a simulação. Clique em `NO`.

![Não encerrando a simulação](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/09-finish.png)

O procedimento acima fará com que sua simulação seja executada por 100 nanosegundos. Para visualizar toda a forma de onda, clique no botão `Zoom Full`, indicado na figura abaixo. Agora observe os sinais alternando!

![Waveform finalizado](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/main/ModelSim/images/10-waveform.png)

Parabéns! Você acabou de criar sua primeira simulação no ModelSim!

---

Esse tutorial mostrou como criar seu próprio projeto no ModelSim, adicionar arquivos (novo e existente), compilar seus arquivos, iniciar sua própria simulação e visualizar as formas de onda do teste. Agora você está pronto para explorar todos os recursos do ModelSim e desenvolver seus próprios projetos.
