//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyBro{
    uint public reward;
    string public calle;
    bool public answered;

    receive() external payable{}

    function brother(uint _reward, string calldata _calle) external payable {
        reward = _reward;
        calle = _calle;
       // _answered = !answered;
    } 
}


contract MySis{
    uint public reward;
    string public calle;
    bool public answered;
    function callBro(address _contract, uint _theReward, string calldata _theReply) external payable{
        // Make a delegatecall to MyBro
        (bool outcome,) = _contract.delegatecall(abi.encodeWithSignature("brother(uint256,string)", _theReward, _theReply));
        require(outcome, "Bro didn't answer ");


    }
}
