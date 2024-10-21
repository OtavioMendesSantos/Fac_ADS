import http from 'k6/http';
import { check } from 'k6';
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";

export const option = {
    vus: 1,
    duration: '3s',
    threshoulds: {
        checks: ['rate > 0.99']
    }
}

export default function () {
    const BASE_URL = 'http://test.k6.io/contacts.php'
    const res = http.get(BASE_URL)

    check(res, {
        'status code é 200': (r) => r.status === 200
    })
}

export function handleSummary(data) {
    return {
        "relatorio.html": htmlReport(data),
    };
}

