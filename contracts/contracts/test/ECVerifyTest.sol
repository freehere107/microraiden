pragma solidity ^0.4.17;

import "../lib/ECVerify.sol";

contract ECVerifyTest {
    function verify(
        string _prefixed_message,
        bytes _signed_message)
        public
        constant
        returns (address)
    {
        // Hash the prefixed message string
        bytes32 prefixed_message_hash = keccak256(_prefixed_message);

        // Derive address from signature
        address signer = ECVerify.ecverify(prefixed_message_hash, _signed_message);
        return signer;
    }

    function verify_ecrecover_output(
        bytes32 hash,
        bytes32 r,
        bytes32 s,
        uint8 v)
        returns (address signature_address)
    {
        signature_address = ecrecover(hash, v, r, s);

        // ecrecover returns zero on error
        require(signature_address != 0x0);

        return signature_address;
    }
}
