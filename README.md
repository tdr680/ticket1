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
```
