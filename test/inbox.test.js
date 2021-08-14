const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const web3 = new Web3(ganache.provider());

let accounts;

beforeEach(async () => {
  accounts = await web3.eth.getAccounts();
  console.log(accounts);
});

describe('Inbox', () => {
    it('deploys a contract', () => {});
});