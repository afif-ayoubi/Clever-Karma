import { sendRequest } from '@/app/core/tools/request';
import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';


const initialState = {
    user: null,
    loading: false,
    error: null,
};

export const loginUser = createAsyncThunk(
    'user/loginUser',
    async (credentials: { email: string; password: string }, { rejectWithValue }) => {
        try {
            const response = await sendRequest({
                method: 'POST',
                route: '/user/login',
                body: credentials,
            });

            localStorage.setItem('token', response.token);

            return response; 
        } catch (error:any) {
            return rejectWithValue(error.response?.data); 
        }
    }
);
const userSlice = createSlice({
    name: 'user',
    initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder

            .addCase(loginUser.pending, (state) => {
                state.loading = true;
                state.user = null;
                state.error = null;
            })
            .addCase(loginUser.fulfilled, (state, action) => {
                state.loading = false;
                state.user = action.payload.user;
                state.error = null;
            })
            .addCase(loginUser.rejected, (state, action: any) => {
                state.loading = false;
                state.user = null;
                state.error = action.payload?.message ?? 'An error occurred';
            });
    },
}); 

export default userSlice.reducer;