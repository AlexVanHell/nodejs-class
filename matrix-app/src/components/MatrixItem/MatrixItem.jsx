import React from "react";
import "./MatrixItem.css";

export class MatrixItem extends React.Component {

  handleValueChange(value) {
    if (isNaN(value)) {
      value = 0;
    } else {
      value = Number(value);
    }

    this.props.onValueChanges(value);
  }

  render() {
    return (
      <div className="matrixItem">
        <input
          type="text"
          placeholder="0"
          className="itemInput"
          onInput={(e) => this.handleValueChange(e.target.value)}
        />
      </div>
    );
  }
}
