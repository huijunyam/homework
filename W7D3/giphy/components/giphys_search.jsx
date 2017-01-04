import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };
  }

  handleChange(e) {
    const input = e.target.value;
    this.setState({ searchTerm: input });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm.split(" ").join("+")).
    then(this.setState({ searchTerm: "" }));
  }

  render() {
    return (
      <div>
        <form>
          <input onChange={this.handleChange.bind(this)} type="text" value={this.state.searchTerm}></input>
          <button onClick={this.handleSubmit.bind(this)}>Search Giphy</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
