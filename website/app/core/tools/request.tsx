import axios, { Method } from 'axios';

axios.defaults.baseURL = 'http://127.0.0.1:3000/';

interface SendRequestParams {
    method: Method;
    route: string;
    body?: any;
}

export const sendRequest = async ({ method, route, body }: SendRequestParams) => {
    try {
        const token = localStorage.getItem('token');
        const response = await axios.request({
            method,
            url: route,
            data: body,
            headers: {
                'Content-Type': 'application/json',

                Authorization: `Bearer ${token}`,
            },
        });

        return response;
    } catch (error: any) {
        if (error.response && error.response.status === 401) {
            localStorage.removeItem('token');
        }
        throw error;
    }
};
