pragma solidity 0.7.5;
pragma abicoder v2;
 
contract wallet {
    address[] public owners; 
	uint requiredApprovals;
 
	struct Transfer{
      	uint amount;
		address payable transfer;
        uint approvals;
        bool hasBeenSent;   
        uint id;
    }
 
    event TransferRequestCreated(uint _id, uint _amount, address _initiator, address _receiver);
    event ApprovalReceived(uint _id, uint _approvals, address _approver);
    event TransferApproved(uint _id);
 
    Transfer[] transferRequests;//store all TR
 
    mapping(address => mapping(uint => bool)) approvals;
 
    modifier onlyOwner() {
		bool owner = false;
		for (uint i=0; i<owners.length; i++){
			if (owners[i] == msg.sender){
		        owner = true;
            }
        }
    	require(owner == true);
		_;
    }
 
 
	//initialise owners’ addresses and # of required approvals(limit)
    constructor(address[] memory _owners, uint _limit) {
        owners = _owners;
        limit = _limit;
    }
  
	//Empty function
    //just need to deposit money. No need to execute anything
    function deposit() public payable {}
 
	//create an instance of transfer struct and add it to the transferRequest array
    function createTransfer(uint _amount, address payable _receiver) public onlyOwner {
	    emit TransferRequestCreated(transferRequests.length, _amount, msg.sender, _receiver);
        transferRequests.push(
            Transfer(_amount, _receiver, 0, false, transferRequests.length)
        );
    }
 	
 
//set your approval for one of the transfer requests
//need to update the transfer object
//When the amount of approvals reach is required number, this function will send transfer to the receiver
//An owner should not be able to vote twice
//An owner should not be able to vote on a transfer request that has already been sent
 
    function approval(uint _id) public onlyOwner {
	    require(approvals[msg.sender][_id] == false);
	    require(transferRequests[_id].hasBeenSent == false);
 
	    approvals[msg.sender][_id] == true;
	    transferRequests[_id].approvals++;
	
	    emit ApprovalReceived(_id, transferRequests[_id].approvals, msg.sender);
 
	    if (transferRequests[_id].approvals >= requiredApprovals){
		    transferRequests[_id].hasBeenSent = true;
		    transferRequests[_id].receiver.transfer(transferRequests[_id].amount);
		    emit TransferApproved(_id);
        }
    }
 
 
   //Should return all transfer requests
    function getTransferRequests() public view returns (Transfer[] memory){
	    return transferRequests;
    } 
}
