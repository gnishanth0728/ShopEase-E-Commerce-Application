import axios from "axios";

const productApi = axios.create({
  baseURL: "http://localhost:8081/api"
});

export default productApi;