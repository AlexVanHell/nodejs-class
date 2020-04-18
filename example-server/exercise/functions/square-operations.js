const operations = {
  /**
   * Get the area of a square
   * @param {number} side
   */
  getArea: function(side) {
    return Math.pow(side, 2);
  },
  /**
   * Get the perimeter of a square
   * @param {number} side
   */
  getPerimeter: function(side) {
    return side * 4;
  },
  /**
   * Get the diagonal of a square
   * @param {number} side
   */
  getDiagonal: function(side) {
    return Math.sqrt(2 * Math.pow(side, 2));
  }
};

module.exports = operations;
