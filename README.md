# ETH101---Multisig-Wallet

In this project, a Multisig Wallet Smart Contract is built. A multisig wallet is a wallet where multiple “signatures” or approvals are needed for an outgoing transfer to take place. it requires at least 2 of us to sign any transfer before it happens. Anyone can deposit funds into this wallet. But as soon as we want to spend funds, it requires approvals from two out of three owners.
 
Here are the __requirements__ of the wallet:

– __Anyone__ should be able to __deposit ether__ into the smart contract<br>
– The __contract creator__ should be able to __input__ <br>
   &nbsp;&nbsp;&nbsp;&nbsp;(1): the __addresses of the owners__ and <br>
   &nbsp;&nbsp;&nbsp;&nbsp;(2):  the __numbers of approvals__ required for a __transfer__, in the constructor. <br>
   &nbsp;&nbsp;&nbsp;&nbsp;For example, input 3 addresses and set the approval limit to 2. <br>
– Anyone of the __owners__ should be able to __create a transfer request__. The __creator of the transfer__ request will specify what __amount__ and to what __address__ the transfer will be made.<br>
– Owners should be able to __approve transfer__ requests.<br>
– When a transfer request has the required approvals, the transfer should be sent. 

In multisig-wallet-v1.0.sol, I first created the wallet on my own without reading any hints or videos from the course. I tried to implement the principles and knowledge I have learned from the course. 
In multisig-wallet-v2.0.sol, I modified my code by following the code provided by the instructor with my code as a base template. 
