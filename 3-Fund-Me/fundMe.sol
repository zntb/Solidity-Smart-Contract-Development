// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
// This import work only in Remix!
import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded)
        public addressToAmountFunded;

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= minimumUsd,
            "Did'nt send enough ETH"
        ); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18

        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        // for loop
        for (
            uint256 founderIndex = 0;
            founderIndex < funders.length;
            founderIndex++
        ) {
            address funder = funders[founderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // Reset the array
        funders = new address[](0);
        // Withdraw the funds

        // 1- Transfer:
        // msg.sender = address
        // payable(msg.sender) = payable address
        payable(msg.sender).transfer(address(this).balance);
        // 2 Send:
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed");
        // 3 Call - recomended way
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");

        require(callSuccess, "Call failed");
    }
}
