`timescale 1ns / 1ps
// -----------------------------------------------------------------------------
// Universidade Federal do Recôncavo da Bahia
// -----------------------------------------------------------------------------
// Author : João Bittencourt
// File   : halfadder_test.sv
// Editor : Sublime Text 3, tab size (3)
// -----------------------------------------------------------------------------
// Description:
//      Módulo de teste para o circuito meio-somador
// -----------------------------------------------------------------------------
module halfadder_test();

   logic A;
   logic B;
   logic Cin;
   wire  Sum;

   halfadder myhalfadder (A, B, Cin, Sum);

   initial begin
      // Inicializa as entradas
      A = 0;
      B = 0;
      Cin = 0;
      // Espere, digamos, 10 ns antes das entradas começarem a mudar
      #10;

      // Adicione os estímulos aqui
      // As entradas mudam a cada 1 ns, indo de 000 até 111
      #1 {A, B, Cin} = 3'b001;
      #1 {A, B, Cin} = 3'b010;
      #1 {A, B, Cin} = 3'b011;
      #1 {A, B, Cin} = 3'b100;
      #1 {A, B, Cin} = 3'b101;
      #1 {A, B, Cin} = 3'b110;
      #1 {A, B, Cin} = 3'b111;
      // Espere por outros 5 ns, e então encerre a simulação
      #5 $finish;
   end

endmodule
