import React from "react";

export class MatrixInputData extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputValue: 0,
    };
  }

  render() {
    return (
      <div className="row">
        <div className="col-12">
          <p className="m-0 p-1">Tamaño de la matriz</p>
        </div>
        <div className="form-group col-12 col-md-8">
          <input
            type="text"
            placeholder="Tamaño de la matriz"
            className="form-control"
            onInput={(e) => this.setState({ inputValue: e.target.value })}
          />
        </div>
        <div className="col-12 col-md-4">
          <button
            className="btn btn-block btn-primary"
            onClick={() => this.props.onButtonClick(this.state.inputValue)}
          >
            Aceptar
          </button>
        </div>
      </div>
    );
  }
}
