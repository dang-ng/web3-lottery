const assert = require('assert')
const ganache = require('ganache-cli')
const Web3 = require('web3')
const web3 = new Web3(ganache.provider())
const { abi, evm } = require('../compile')

let account
let inbox

beforeEach(async ()=>{
    account = await web3.eth.getAccounts()
    inbox = await new web3.eth.Contract(abi).deploy({data:evm.bytecode.object}).send({from:account[0],gas:'1000000'})
})

describe('Inbox',()=>{
    it('test1',()=>{
        assert.ok(inbox.option.address)
    })
})
