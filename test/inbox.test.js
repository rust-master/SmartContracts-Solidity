const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const web3 = new Web3(ganache.provider());

beforeEach(() => {
    web3.eth.getAccounts()
    .then((accounts) => {
        console.log('Accounts:', accounts);
    });
});

describe('Inbox', () => {
    it('deploys a contract', () => {});
});