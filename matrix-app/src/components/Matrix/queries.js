import axios from "axios";
import { endpoints } from '../../constants/endpoints';

export default {
  getDeterminant(matrix) {
    return axios.post(endpoints.matrix, { matrix })
      .then(res => res.data);
  },
};
