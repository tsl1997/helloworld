phpCopy codepragma solidity ^0.8.0;

contract BatchTransfer {
    function batchTransfer(address[] memory _to, uint256[] memory _value) public returns (bool) {
        require(_to.length == _value.length, "to and value array length mismatch");
        for (uint256 i = 0; i < _to.length; i++) {
            require(payable(_to[i]).send(_value[i]), "transfer failed");
        }
        return true;
    }
}