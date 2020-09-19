import React from "react"
class Conditions extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      machine: '',
      product: '',
      conditions: []
    };
  }

  componentDidMount() {
    fetch('/conditions/search.json').then(
      res => res.json()
    ).then(
      (res) => {
        this.setState({
          conditions: res.conditions
        })
      }
    )
  }

  filter(e) {
    const { machine, product } = this.state
    if (e.target.id == 'machine-filter') {
      this.setState({
        machine: e.target.value
      })
      fetch('/conditions/search.json?machine=' + e.target.value + '&product=' + product).then(
        res => res.json()
      ).then(
        (res) => {
          this.setState({
            conditions: res.conditions
          })
        }
      )
    }
    if (e.target.id == 'product-filter') {
      this.setState({
        product: e.target.value
      })
      fetch('/conditions/search.json?machine=' + machine + '&product=' + e.target.value).then(
        res => res.json()
      ).then(
        (result) => {
          this.setState({
            conditions: result.conditions
          })
        }
      )
    }
  }

  render () {
    const { machine, product, conditions } = this.state
    return (
      <div className="border overflow-auto mb-3">
        <table className="table table-hover overflow-auto">
          <thead>
            <tr>
              <th className="text-center" scope="col">生産ライン</th>
              <th className="text-center" scope="col">品種</th>
              <th className="text-center" scope="col">金型</th>
              <th scope="col"></th>
            </tr>
            <tr className="bg-secondary">
              <th scope="col">
                <div className="input-group input-group-sm mx-auto filter">
                  <input id="machine-filter" type="search" className="form-control" aria-label="machine" aria-describedby="machine"
                    value={machine}
                    onChange={(e) => {this.filter(e)}}
                  />
                  <div className="input-group-append">
                    <span className="input-group-text" id="machine">号機</span>
                  </div>
                </div>
              </th>
              <th scope="col">
                <div className="input-group input-group-sm mx-auto filter">
                  <input id="product-filter" type="search" className="form-control"
                    value={product}
                    onChange={(e) => {this.filter(e)}}
                  />
                </div>
              </th>
              <th scope="col"></th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            { conditions.map((condition) => {
                return (
                  <tr>
                    <td className="text-center">{condition.machine}号機</td>
                    <td className="text-center">{condition.product}</td>
                    <td className="text-center">{condition.mold}次型</td>
                    <td className="text-center">
                      <a href={condition.show}>
                        <i className="fas fa-external-link-alt"></i>
                      </a>
                      <a className="ml-2" href={condition.edit  }>
                        <i className="fas fa-edit"></i>
                      </a>
                    </td>
                  </tr>
                )
              })
            }
          </tbody>
        </table>
      </div>
    );
  }
}

export default Conditions
