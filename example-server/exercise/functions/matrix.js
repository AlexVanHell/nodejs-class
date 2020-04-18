/**
 * Get a submatrix deleting a row and column
 * @param {number[][]} matrix Original matrix
 * @param {number} column Index of the column to delete
 */
function getSubMatrix(matrix, column) {
  const resultSubMatrix = [];

  for (let i = 1; i < matrix.length; i++) {
    // This adds a new row in the submatrix
    resultSubMatrix.push([]);

    for (let j = 0; j < matrix.length; j++) {
      if (j !== column) {
        resultSubMatrix[resultSubMatrix.length - 1].push(matrix[i][j]);
      }
    }
  }

  return resultSubMatrix;
}

/**
 *
 * @param {number[][]} matrix
 */
function Matrix(matrix) {
  return {
    getDeterminant: function(auxMatrix = matrix) {
      let totalSum = 0;
      let sign = 1;

      if (auxMatrix.length === 1) {
        return auxMatrix[0][0];
      }

      // Iterate columns
      for (let i = 0; i < auxMatrix.length; i++) {
        const elem = auxMatrix[0][i];
        const submatrix = getSubMatrix(auxMatrix, i);

        totalSum += sign * (elem * this.getDeterminant(submatrix));
        sign = -sign;
      }

      return totalSum;
    }
  };
}

module.exports = Matrix;
