import http from 'k6/http';
import { check } from 'k6';

export const option = {
    vus: 1,
    duration: '3s',
    threshoulds: {
        http_req_failed: ['rate < 0.01'], //falha seja inferior a 0,01
        http_req_duration: [{ threshoulds: 'p(95) < 200', abortOnFail: true }],
        checks: ['rate > 0.99']
    }
}
export default function () {
    const req = http.get('http://test.k6.io');

    check(res, {
        'status code é 200': (r) => r.status === 201
    })
}