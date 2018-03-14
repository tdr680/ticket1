## ticket

* <https://github.com/ConsenSys/truffle-webpack-demo>
* <http://truffleframework.com/boxes/webpack>


```javascript
truffle(develop)> var accounts;
truffle(develop)> web3.eth.getAccounts(function(err,res) { accounts = res; }); // web3.eth.accounts
truffle(develop)> var metaCoin;
truffle(develop)> MetaCoin.deployed().then(function(deployed) {metaCoin = deployed;});
truffle(develop)> metaCoin.getBalance.call(web3.eth.accounts[0])
truffle(develop)> metaCoin.sendCoin(accounts[9], 1, {from: accounts[0]});

truffle(develop)> var ticket;
truffle(develop)> Ticket.deployed().then(function(deployed) {ticket = deployed;});
truffle(develop)> now = ticket.getNow();
truffle(develop)> var ts;
truffle(develop)> now.then(function(res) {ts = res);});
truffle(develop)> ts.toNumber();
truffle(develop)> date = new Date(ts * 1000);
```

### How to test this project
1. Install all dependencies `npm install`
2. Start ganache to run your local blockchain
3. Deploy the contracts `truffle migrate`
4. Run the test suite `truffle test`
5. Run the development webserver `npm run dev`
6. Visit http://localhost:8080 with your browser (make sure you have NetMask plugin installed and configured to access your local blockchain)
