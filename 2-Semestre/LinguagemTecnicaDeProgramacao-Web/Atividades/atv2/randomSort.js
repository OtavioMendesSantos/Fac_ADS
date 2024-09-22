const numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

//* Como Funciona
// Sort tem 1 argumento: uma funcao que pode receber dois parametros
// a - o primeiro elemento para comparação
// b - o segundo elemento para comparação 

//* Condicoes de Ordenacao
// Valor negativo -> a vem antes de b
// Valor positivo -> b vem antes de a
// 0 ou NaN -> a e b sao iguais

console.log(numeros.sort(function(){return 0.5 - Math.random()}));
//* Explicacao
// O que essa função faz é pular essa validação e sortear os valores 
// de forma aleatória.
// Math.random retorna um valor entre 0 e 1
// Se o valor for menor que 0.5, o resultado é negativo
// Se o valor for maior ou igual a 0.5, o resultado é positivo

let i = 0
console.log(numeros.sort((a,b)=>{
    console.log(a, '-',b, '->', a - b);
    i++
    return a - b
}));

console.log(i)