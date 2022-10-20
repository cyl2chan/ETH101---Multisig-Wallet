pragma solidity 0.7.5;
pragma abicoder v2;


//func deposit
//func input, owner addresses n # of required approvals(in constructor)
//func ownerTransfer
//func approve 
//func transferSent, when hv 2 out of 3 sig
 
contract wallet {
 
	modifier onlyOwner {
		require(msg.sender == owner);
    }
 
    event approved(address, transferID, bool);
 
    constructor(){
	    OwnersAddresses = _ownersAddresses;
	    requiredApprovals = _requiredApprovals;
    }
 
    struct Transfer{
	    uint approvals;
    }
 
    transfer[] transferRequests;//store all TR
 
    mapping(address => mapping(uint => bool)) approvals;
 
    //mapping[address][transferID] => true/false
    //mapping[msg.sender][5] = true;
 
	function deposit() public payable returns (uint) {
		balance[msg.sender] += msg.value;
		emit depositDone(msg.value, msg.sender);
		return balance[msg.sender];
    }
 
    function input() memory private {
	    ownerAddress = _ownerAddress;
	    requiredApprovals = _requiredApprovals;
    }
 
    function transfer(toAddress, uint amount) onlyOwner {
	    require(balance[msg.sender] >= amount, “Insufficient balance!”);
      require(msg.sender != recipient, “You aren’t allowed to transfer money to yourself”);
 
	    uint previousBalance = balance[msg.sender];
 
	    _transfer(msg.sender, recipient, amount);
 
	    uint balance[msg.sender] -= amount;
    }
 
    function approval(_address, _transferID, _bool) public onlyOwner {
	    emit approve(_address, _transferID, _bool);
    }
 
    function depositSent {
	    if (_bool = true) {
	        _recipient.send(msg.value);
        } else {
	        return “Deposit Denied”;
    }
}
