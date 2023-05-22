// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Token {
    // mapping from address to a uint, to store addresses and amount
    mapping(address => uint) public balances;
    //total supply of tokens
    uint public totalsupply;
    // constructor only runs onces
    //total supply of token is 3000
    constructor() {
        totalsupply = 3000;
        balances[msg.sender] = totalsupply / 3;

        balances[ /* Add a address*/] = totalsupply / 3;

        balances[ /* Add a different address */] = totalsupply / 3;

    }
    //transfer function. Transfering tokens
    function transfer(address _to, uint _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient funnds");
        balances[msg.sender] = balances[msg.sender] - _amount;
        balances[_to] = balances[_to] + _amount;
    }
}
