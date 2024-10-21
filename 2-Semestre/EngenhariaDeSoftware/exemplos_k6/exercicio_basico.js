//inicializar
import sleep from 'k6';

//config
export const option = {
    vus:1, //usuarios
    duration:'10s'
}

// execução
export default function(){
    console.log("teste do k6");
    sleep(1);
}

//desmonta a função
export function teardown(data){
    console.log(data)
}