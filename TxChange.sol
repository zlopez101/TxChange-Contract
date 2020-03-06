pragma solidity ^0.5.10;

import "./ownable.sol";

contract TxChange is Ownable {
    constructor() public {
    }
    event NewTicket(uint id, string artist, string venue);

    struct ticket {
        string artist;
        string venue;
        uint dateTime;
        //bool oneDayAway;
        //bool oneWeekAway;
    }
    
    ticket[] public tickets;

    mapping(uint=>address) ticketToOwner;
    mapping(address=>uint) ownerticketCount;

    modifier ownerOf(_ticket_id) {
        require(ticketToOwner[_ticket_id] == msg.sender);
    }

    function _createticket(string memory _artist, string _venue) external {
        uint _ticket_id = tickets.push(ticket(_artist, _venue, now)) -1;
        ticketToOwner[_ticket_id] = msg.sender;
        ownerticketCount[msg.sender]++;
        emit NewTicket(_ticket_id, _artist, _venue);
    }

    function transferticket(uint _ticket_id) ownerOf(_ticket_id) {
         
    }






}
