// Desenvolver  um programa que resolva

function calcularValores(){
    const result = document.querySelector('#result')

    const horasTrabalhadas = +(document.querySelector('#horas').value) || 0
    const valHora = +(document.querySelector('#hora').value) || 0
    const descontoInss = +(document.querySelector('#desconto').value) || 0

    const temHorasTrabalhadas = horasTrabalhadas <= 180 && horasTrabalhadas >= 135
    const temValHora = valHora <= 50 && valHora >= 25
    const temInss = descontoInss <= 15 && descontoInss >= 5

    if (horasTrabalhadas == 0 || valHora == 0 || descontoInss == 0) {
        result.innerHTML = 'Preencha todos os campos'
    } else if ( temHorasTrabalhadas && temValHora && temInss) {
        const salarioBruto = (horasTrabalhadas * valHora)
        const inss = (salarioBruto * descontoInss) / 100
        const salarioLiquido = (salarioBruto - inss)
        const salarioInsuficiente = (salarioLiquido <= 3000)

        result.innerHTML = `
           Salário Bruto - R$ ${salarioBruto.toFixed(2)} <br/>
           Total do desconto INSS - R$ ${inss.toFixed(2)} <br/>
           Salário Liquido - R$ ${salarioLiquido.toFixed(2)} ${salarioInsuficiente ? '(<strong>Salário Insatisfatório!</strong> Menor ou igual a R$ 3000)' : ''} <br/>
        
        `
    } else {
        result.innerHTML = `Informe Valores Dentro dos Parâmetros`
    }
}

const btn = document.querySelector('#calcular')
btn.addEventListener('click', calcularValores)
