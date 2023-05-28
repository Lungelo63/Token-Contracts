//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
//vulnerable contract***
contract Token {
    string public name;
    string public symbol;
    uint public decimals;
    uint public totalSupply;
    address public fromOwner = msg.sender;

    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint value);

    constructor( string memory _name, string memory _symbol, uint _decimals, uint _totalSupply){
        
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = totalSupply;

    }

    function transfer(address _to, uint _value) external returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] = balanceOf[msg.sender] - (_value);
        balanceOf[_to] = balanceOf[_to] - (_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
