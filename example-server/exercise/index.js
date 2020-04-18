const getTriangleArea = require("./functions/triangle-area");
const getCircleArea = require("./functions/circle-area");
const squareOperations = require("./functions/square-operations");

const Matrix = require("./functions/matrix");

console.log("Test");

console.log("El area de mi triangulo es: ", getTriangleArea(5, 4));
console.log("El area de mi circulo es: ", getCircleArea(5));

console.log("El area del cuadrado es:", squareOperations.getArea(5.3));

console.log(
  "El perimetro del cuadrado es:",
  squareOperations.getPerimeter(5.3)
);
console.log("La diagonal del cuadrado es:", squareOperations.getDiagonal(5.3));

const matrixT = [
  [1, 9, 5],
  [3, 7, 6],
  [9, 4, 2]
];

const myMatrix = Matrix(matrixT);

/* console.log("TESTING SUBMATRIX:", matrixTest.getSubMatrix(matrixT, 0));
console.log("TESTING SUBMATRIX:", matrixTest.getSubMatrix(matrixT, 1));
console.log("TESTING SUBMATRIX:", matrixTest.getSubMatrix(matrixT, 2)); */

console.log(myMatrix.getDeterminant());
