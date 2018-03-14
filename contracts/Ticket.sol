pragma solidity ^0.4.17;

contract Ticket {

     struct Date {
        uint day;
        uint month;
        uint year;
    }

    struct Location {
        uint latitude;
        uint longitude;
    }

    bytes32 eventName = "*** back to the future ***";

    Date date = Date({day:1, month:4, year:2018});

    Location location = Location({latitude: 47381527, longitude: 8537093});

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

    function getEventName() public view returns (bytes32) {

        return eventName;
    }

    function getDate() public view returns (uint, uint, uint) {

        return (date.day, date.month, date.year);
    }

    function getLocation() public view returns (uint, uint) {

        return (location.latitude, location.longitude);
    }

    function getNow() public view returns (uint256) {
        return now;
    }
}