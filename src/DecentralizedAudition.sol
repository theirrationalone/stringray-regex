// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract DecentralizedAudition {
    struct AuditProposer {
        string name;
        address proposer;
        string email;
    }

    struct Audit {
        string startDate;
        string endDate;
        uint256 totalPricePoolUSD;
        uint256 highAwardsUSD;
        uint256 mediumAwardsUSD;
        uint256 lowAwardsUSD;
        uint256 nSOLC;
        uint256 complxityScore;
        uint256 perComplexityUSD;
        uint256 perNSOLCUSD;
        uint256 numActors;
    }
}
