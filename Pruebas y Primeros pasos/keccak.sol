// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

 contract hash{
                function calcularHash(string memory _a) public pure returns(bytes32){
                return keccak256(abi.encodePacked(_a));
                 }
 }