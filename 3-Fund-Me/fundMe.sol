// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
// This import work only in Remix!
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded)
        public addressToAmountFunded;

    function fund() public payable {
        // allow users to send $
        // have a minimum of $ sent $5
        // 1. How do we send ETH to this contract?

        require(
            getConversionRate(msg.value) >= minimumUsd,
            "Did'nt send enough ETH"
        ); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18

        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
    }

    // function withdraw() public {}

    function getPrice() public view returns (uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI

        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );

        (, int256 price, , , ) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        return uint256(price * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount
    ) public view returns (uint256) {
        // 1 ETH ?
        // 2000_000000000000000000
        uint256 ethPrice = getPrice();
        // 2000_000000000000000000 * 1_000000000000000000 / 1e18
        // $2000 = 1 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return
            AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
                .version();
    }
}
