
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract WorldToken {

    string public  name;
    string public  symbol;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    uint256 _totalSupply;
    address payable owner;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(uint256 totalSupply)  {
        _totalSupply = totalSupply;
        owner = payable(msg.sender);

        balances[msg.sender] = _totalSupply;
        
        name = "WorldToken";
        symbol = "WOT";
    }
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from] - _value;
        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(_from, _to, _value);
        return true;
    }


    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] =  allowed[msg.sender][_spender] + _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    function buyTokens() public payable returns (bool success) {
        require (msg.value > 0);
        uint256 num_of_tokens = ((msg.value/1000000000000000000) *10);
        balances[msg.sender] = balances[msg.sender] + num_of_tokens;
        balances[owner] = balances[owner] - num_of_tokens;
        owner.transfer(msg.value);
        return true;
    }

    receive() external payable {
        require (msg.value > 0);
        uint256 num_of_tokens = ((msg.value/1000000000000000000) *10);
        balances[msg.sender] = balances[msg.sender] + num_of_tokens;
        balances[owner] = balances[owner] - num_of_tokens;
        owner.transfer(msg.value);
    } 

}
