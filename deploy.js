const HDWalletProvider = require('@truffle/hdwallet-provider')
const Web3 = require('web3')
const { abi, evm } = require('./compile')

const provider = new HDWalletProvider('rabbit pony forget jeans oak powder hedgehog gravity used clown inhale whip','https://goerli.infura.io/v3/4040f29fdf294c08b5f1163082f1715f')
const web3 = new Web3(provider)
const deploy = async () => {
    accounts = await web3.eth.getAccounts()
    result = await new web3.eth.Contract(abi).deploy({data:evm.bytecode.object}).send({from:accounts[0],gas:'1000000'})
    console.log('Contract deployed to', result.options.address);
    provider.engine.stop()
}
deploy()