import axios, { AxiosRequestConfig, AxiosResponse, AxiosError } from 'axios';

axios.defaults.baseURL = 'http://localhost:3000/';

interface SendRequestParams {
    method: 'GET' | 'POST' | 'PUT' | 'DELETE';
    route: string;
    body?: any;
}

export const sendRequest = async ({ method, route, body }: SendRequestParams) => {
    try {
        const token = localStorage.getItem('token');

        const config: AxiosRequestConfig = {
            method,
            url: route,
            headers: {
                'Content-Type': 'application/json',
                Authorization: `Bearer ${token}`,
            },
        };

        if (body) {
            config.data = body;
        }

        const response: AxiosResponse = await axios(config);

        return response.data;
    } catch (error:any) {
        handleRequestError(error);
        throw error;
    }
};

const handleRequestError = (error: AxiosError) => {
    if (axios.isAxiosError(error)) {
        const { response, message } = error;

        if (response) {
            console.error('Response data:', response.data);
            console.error('Response status:', response.status);
            console.error('Response headers:', response.headers);
        } else if (message) {
            console.error('Error message:', message);
        }
    } else {
        console.error('Error message:', error);
    }
};
