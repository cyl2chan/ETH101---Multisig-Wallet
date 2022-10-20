# ETH101---Multisig-Wallet

In multisig-wallet-v1.0.sol, I first created the wallet on my own without reading any hints or videos from the course. I tried to implement the principles and knowledge I have learned from the course. 
In multisig-wallet-v2.0.sol, I modified my code by following the code provided by the instructor with my code as a base template. 

In this project, a Multisig Wallet Smart Contract is built. A multisig wallet is a wallet where multiple “signatures” or approvals are needed for an outgoing transfer to take place. it requires at least 2 of us to sign any transfer before it happens. Anyone can deposit funds into this wallet. But as soon as we want to spend funds, it requires approvals from two out of three owners.
 
Here are the requirements of the wallet:
– Anyone should be able to deposit ether into the smart contract
– The contract creator should be able to input (1): the addresses of the owners and (2):  the numbers of approvals required for a transfer, in the constructor. For example, input 3 addresses and set the approval limit to 2. 
– Anyone of the owners should be able to create a transfer request. The creator of the transfer request will specify what amount and to what address the transfer will be made.
– Owners should be able to approve transfer requests.
– When a transfer request has the required approvals, the transfer should be sent. 
