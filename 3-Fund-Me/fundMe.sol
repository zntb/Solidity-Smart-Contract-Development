// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract FundMe {
    uint256 public minimumUsd = 5;

    function fund() public payable {
        // allow users to send $
        // have a minimum of $ sent $5
        // 1. How do we send ETH to this contract?

        require(msg.value >= minimumUsd, "Did'nt send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
    }

    // function withdraw() public {}

    function getPrice() public {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
    }

    function getConversionRate() public {}

    function getVersion() public view returns (uint256) {
        return
            AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
                .version();
    }
}
