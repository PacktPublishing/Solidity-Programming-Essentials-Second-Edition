// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0; 

contract TransactionAndMessageVariables { 

    event logstring(string); 

    event loguint(uint); 

    event logbytes(bytes); 

    event logaddress(address); 

    event logbyte4(bytes4); 

    event logblock(bytes32); 

     

    function globalVariable() public payable { 

        emit logaddress( block.coinbase ); // miners address 

        emit loguint( block.difficulty ); //70762765929000 

        emit loguint( block.gaslimit ); // 160000000 

        emit loguint(  gasleft() ); //79975149 

        emit loguint(  tx.gasprice ); // 1 

        emit loguint(  block.number ); //123 

        emit loguint( block.timestamp ); //1513061946  

        emit logbytes( msg.data ); // 0x4048d797 

        emit logbyte4(   msg.sig  ); // // 0x4048d797 

        emit loguint( msg.value ); // 0 or in Wei if ether are send 

        emit logaddress( msg.sender ); // sender address 

        emit logaddress( tx.origin ); // caller address 

        emit logblock ( blockhash( block.number) ); // current number 

    } 

} 