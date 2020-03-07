import React from 'react';
import { Link } from 'react-router-dom';
import { Dropdown, ButtonGroup, Button } from 'react-bootstrap';
import { auth } from '../../firebase/firebase.util';

import { ReactComponent as Logo } from '../../assets/untitled.svg';

import './header.styles.scss';

const Header = ({ currentUser }) => (
    <div className='header'>
        <Link className='logo-container'>
            <Logo className='logo' />
        </Link>
        <div className='options'>

{
    currentUser ? 
        <div class="bootstrap-iso">
  <Dropdown as={ButtonGroup}>
  <Button variant="success">Update</Button>

  <Dropdown.Toggle split variant="success" id="dropdown-split-basic"/>
  <Dropdown.Menu data-toggle="dropdown">
    <Dropdown.Item href="#/action-1">5 min</Dropdown.Item>
    <Dropdown.Item href="#/action-2">30 min</Dropdown.Item>
    <Dropdown.Item href="#/action-3">1 hr</Dropdown.Item>
  </Dropdown.Menu>
  </Dropdown>
  </div>
        :
        <div/>
}
            {
             currentUser ?
             <div className='option' onClick={() => auth.signOut()}>SIGN OUT</div>
             :
             <Link className='option' to='/signin'>Sign In</Link>
            }
        </div>
    </div>
)

export default Header;