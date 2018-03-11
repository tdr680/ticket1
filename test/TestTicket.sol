pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Ticket.sol";

contract TestTicket {

  Ticket ticket = Ticket(DeployedAddresses.Ticket());

  // Test initial attendees
  function testInitialAttendees() public {
 
    address[16] memory attendees = ticket.getAttendees();
 
    for (uint i = 0; i < 16; i++) {
        Assert.isZero(attendees[i], "All seats should be initially empty");
    }
  }

  // Test attend function
  function testUserCanAttend() public {
 
    uint returnedSeatId = ticket.attend(8);

    uint expected = 8;

    Assert.equal(returnedSeatId, expected, "Seat 8 should be recorded.");
  }

  // Testing retrieval of a single attendee
  function testGetAttendeeAddressBySeatId() public {
    // Expected owner is this contract
    address expected = this;

    address attendee = ticket.attendees(8);

    Assert.equal(attendee, expected, "Attendee with seat 8 should be recorded.");
  }

  // Testing retrieval of all attendees
  function testGetAttendeeAddressBySeatIdInArray() public {
    // Expected owner is this contract
    address expected = this;

    // Store attendees in memory rather than contract's storage
    address[16] memory attendees = ticket.getAttendees();

    Assert.equal(attendees[8], expected, "Attendee with seat 8 should be recorded.");
  }

  // Testing initial event name
  function testGetEventName() public {
    
    bytes32 expected = "*** back to the future ***";

    bytes32 eventName = ticket.getEventName();

    Assert.equal(eventName, expected, "Initial event name should be '*** back to the future ***'.");
  }
}
