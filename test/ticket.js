var Ticket = artifacts.require("./Ticket.sol");

contract('Ticket', function (accounts) {
    it("All 16 seats should be initially empty", function () {
        var event;
        return Ticket.deployed().then(function (instance) {
            event = instance;
            return event.getAttendees.call();
        }).then(function (value) {
            assert.lengthOf(value, 16, 'Should have 16 seats')
            value.forEach(element => {
                assert.equal(web3.toDecimal(element), 0, 'Seats should be empty')
            });
        });
    });

    it("Event name", function () {
        var event;
        return Ticket.deployed().then(function (instance) {
            event = instance;
            return event.getEventName.call();
        }).then(function (value) {
            assert.equal(web3.toUtf8(value), '*** back to the future ***', 'Expected event name')
        });
    });

    it("Any account can attend", function () {
        var event;
        let seatNr = 7;
        let attendeeAddress = accounts[1];
        return Ticket.deployed().then(function (instance) {
            event = instance;

            return event.attend(seatNr, { from: attendeeAddress });
        }).then(function (trx) {
            assert.equal(trx.receipt.status, '0x01', 'Transaction successfully executed');

            // check that the correct seat has been registered
            return event.attendees.call(seatNr);
        }).then(function (value) {
            assert.equal(value, attendeeAddress, 'Attendee address has been registered');
        });
    });

    it("Invalid seat numbers are rejected", function () {
        return Ticket.deployed().then(function (instance) {
            return instance.attend(999);
        }).then(function (trx) {
            assert.ok(false, "attend should throw but didn't.");
        }).catch(function (error) {
            if (error.message.indexOf("satisfies all conditions set by Solidity `require` statements") != -1) {
                assert.ok(
                    true,
                    "crashed due to expected 'require'"
                );
            } else {
                throw error;
            }
        });
    });

    it("Seats cannot be reserved twice", function () {
        var event;
        let seatNr = 7;
        let attendeeAddress = accounts[3];
        return Ticket.deployed().then(function (instance) {
            event = instance;

            return event.attend(seatNr, { from: attendeeAddress });
        }).then(function (trx) {
            assert.notEqual(trx.receipt.status, '0x01', 'Transaction expected to fail!');
        }).catch(function (error) {
            if (error.message.indexOf("satisfies all conditions set by Solidity `require` statements") != -1) {
                assert.ok(
                    true,
                    "crashed due to expected 'require'"
                );
            } else {
                throw error;
            }
        });
    });

});