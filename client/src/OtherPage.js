import React from 'react';
import {Link} from 'react-router-dom';

export default () => {
    return (
      <div>
          Im some other pag
          <Link to="/">Go back home</Link>
      </div>
    );
};