pragma solidity ^0.4.17;

contract Ticket {

    address[16] public attendees;

    // Get a seat
    function attend(uint seatId) public returns (uint) {
        require(seatId >= 0 && seatId <= 15);

        attendees[seatId] = msg.sender;

        return seatId;
    }

    // Retrieving the attendees
    function getAttendees() public view returns (address[16]) {

        return attendees;
    }
}