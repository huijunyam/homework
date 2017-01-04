import React, { Component } from 'react';

const giphysIndexItems = (giphys) => (
    giphys.map((giphy, idx) => (<li key={idx}><img src={giphy.images.fixed_height.url}/></li>))
);

class GiphysIndex extends React.Component {
  render() {
    const { giphys } = this.props;
    return (
      <div>
        <ul>
          {giphysIndexItems(giphys)}
        </ul>
      </div>
    );
  }
}

export default GiphysIndex;
