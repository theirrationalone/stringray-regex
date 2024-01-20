// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract DecentralizedAudition {
    uint256 private s_proposerCounter;

    struct AuditProposer {
        string name;
        uint256 auditCounter;
        address proposer;
        string email;
        string headquarter;
        string contactInfo;
        string otherDetails;
    }

    struct Actor {
        string role;
        string act;
    }

    struct SMC {
        string name;
        address testnetAddress;
        bool isVerified;
        string resonsibility;
        string directoryLocation;
    }

    struct Dependency {
        string name;
        string resourceLink;
        string protocolName;
        string role;
        string responsibility;
    }

    struct Token {
        string name;
        string protocolName;
        string dexName;
        string id;
    }

    struct Blockchain {
        string name;
        uint256 chaindId;
    }

    struct KnownIssue {
        string name;
        string description;
        string provisionLink;
        string otherInfo;
    }

    struct AdditionalIssue {
        string name;
        string description;
        string provisionLink;
        string otherInfo;
    }

    struct Audit {
        string startDate;
        string endDate;
        uint256 totalPricePoolUSD;
        uint256 highAwardsUSD;
        uint256 mediumAwardsUSD;
        uint256 lowAwardsUSD;
        uint256 nSLOC;
        uint256 complxityScore;
        uint256 perComplexityUSD;
        uint256 perNSOLC_USD;
        uint256 numActors;
        uint256 numScopeSMCs;
        uint256 numDependencies;
        uint256 numTokens;
        uint256 numBlockchains;
        uint256 numKnownIssues;
        uint256 numAdditionalIssues;
        string setupDetails;
        string resourceLink;
        string resourceTreeId;
    }

    mapping(uint256 => mapping(address => Audit)) private s_proposedAudits;
    mapping(address => mapping(uint256 => Actor)) private s_auditActors;
    mapping(address => mapping(uint256 => SMC)) private s_auditSmartContracts;
    mapping(address => mapping(uint256 => Dependency)) private s_auditDependencies;
    mapping(address => mapping(uint256 => Token)) private s_auditTokens;
    mapping(address => mapping(uint256 => Blockchain)) private s_auditSupportedBlockchains;
    mapping(address => mapping(uint256 => KnownIssue)) private s_auditKnownIssues;
    mapping(address => mapping(uint256 => AdditionalIssue)) private s_auditAdditionalIssues;

    function addProposer() public {}
}
