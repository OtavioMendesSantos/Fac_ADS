import http from 'k6/http';
import { Counter} from 'k6/metrics'; // metricas de um contador
import { Gauge } from 'k6/metrics'; // metricas de medição
import { Rate } from 'k6/metrics'; // metricas de taxa de transferencia
import { Trend } from 'k6/metrics'; // metricas de tendências

export const option = {
    vus:1, //usuarios
    duration:'3s'
}

const chamadas = new Counter('qtde_chamadas');
const myGauge = new Gauge('tempo_bloqueio');
const myRate = new Rate('taxa200');
const myTrend = new Trend('tx_espera');

export default function(){
    const req = http.get('http://test.k6.io');
    chamadas.add(1)
    myGauge.add(req.timings.blocked);
    myRate.add(req.status === 200);
    myTrend.add(req.timings.waiting);
}