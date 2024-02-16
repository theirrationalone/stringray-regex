// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.20;

// contract DecentralizedAudition {
//     error DecentralizedAudition__InvalidDataProvided(string invalidData);
//     error DecentralizedAudition__MustBeGreaterThanZero(string invalidData);
//     error DecentralizedAudition__ProposerAlreadyExists(string email);
//     error DecentralizedAudition__ProposerNotExists(string email);

//     uint256 private s_proposerCounter;
//     uint256 private s_auditCounter;

//     struct AuditProposer {
//         uint256 id;
//         string name;
//         uint256 auditCounter;
//         address proposer;
//         string email;
//         string locationCountry;
//         string locationState;
//         string contactInfo;
//         string otherDetails;
//     }

//     struct Actor {
//         string role;
//         string act;
//     }

//     struct SMC {
//         string name;
//         address testnetAddress;
//         bool isVerified;
//         string resonsibility;
//         string directoryLocation;
//     }

//     struct Dependency {
//         string name;
//         string resourceLink;
//         string protocolName;
//         string role;
//         string responsibility;
//     }

//     struct TokenType {
//         string name;
//         string protocolName;
//         string dexName;
//         string id;
//     }

//     struct Blockchain {
//         string name;
//         uint256 chaindId;
//     }

//     struct KnownIssue {
//         string name;
//         string description;
//         string provisionLink;
//         string otherInfo;
//     }

//     struct AdditionalIssue {
//         string name;
//         string description;
//         string provisionLink;
//         string otherInfo;
//     }

//     struct Audit {
//         uint256 id;
//         string title;
//         string startDate;
//         string endDate;
//         uint256 totalPrizePoolUSD;
//         uint256 highAwardsUSD;
//         uint256 mediumAwardsUSD;
//         uint256 lowAwardsUSD;
//         uint256 nSLOC;
//         uint256 complxityScore;
//         uint256 perComplexityUSD;
//         uint256 perNSOLC_USD;
//         uint256 numActors;
//         uint256 numScopeSMCs;
//         uint256 numDependencies;
//         uint256 numTokenTypes;
//         uint256 numBlockchains;
//         uint256 numKnownIssues;
//         uint256 numAdditionalIssues;
//         uint256 numResources;
//         string setupDetails;
//     }

//     mapping(address => mapping(string => AuditProposer)) private s_proposers;
//     mapping(uint256 => mapping(address => Audit)) private s_proposedAudits;
//     mapping(address => mapping(uint256 => Actor)) private s_auditActors;
//     mapping(address => mapping(uint256 => SMC)) private s_auditSmartContracts;
//     mapping(address => mapping(uint256 => Dependency)) private s_auditDependencies;
//     mapping(address => mapping(uint256 => TokenType)) private s_auditTokenTypes;
//     mapping(address => mapping(uint256 => Blockchain)) private s_auditSupportedBlockchains;
//     mapping(address => mapping(uint256 => KnownIssue)) private s_auditKnownIssues;
//     mapping(address => mapping(uint256 => AdditionalIssue)) private s_auditAdditionalIssues;

//     modifier isValidStringData(string memory _strKey, string calldata _strVal) {
//         if (keccak256(abi.encodePacked(_strVal)) == keccak256(abi.encodePacked(""))) {
//             revert DecentralizedAudition__InvalidDataProvided(_strKey);
//         }

//         _;
//     }

//     modifier isValidUintData(string memory _uintKey, uint256 _uintVal) {
//         if (_uintVal <= 0) {
//             revert DecentralizedAudition__MustBeGreaterThanZero(_uintKey);
//         }

//         _;
//     }

//     function addProposer(
//         string calldata _name,
//         string calldata _email,
//         string calldata _locationCountry,
//         string calldata _locationState,
//         string calldata _contactInfo,
//         string calldata _otherDetails
//     )
//         public
//         isValidStringData("name", _name)
//         isValidStringData("email", _email) // threat: could be invalid also
//         isValidStringData("country", _locationCountry)
//         isValidStringData("state", _locationState)
//     {
//         if (s_proposers[msg.sender][_email].id != 0) {
//             revert DecentralizedAudition__ProposerAlreadyExists(_email);
//         }

//         AuditProposer memory proposer = AuditProposer({
//             id: ++s_proposerCounter,
//             name: _name,
//             email: _email,
//             proposer: msg.sender,
//             auditCounter: 0,
//             locationCountry: _locationCountry,
//             locationState: _locationState,
//             contactInfo: _contactInfo,
//             otherDetails: _otherDetails
//         });

//         s_proposers[msg.sender][_email] = proposer;
//     }

//     // how can we access proposer specific audits???
//     function addAudit(
//         string calldata _email,
//         string calldata _startDate,
//         string calldata _endDate,
//         string calldata _title,
//         uint256 _totalPrizePoolUSD,
//         uint256 _highAwardsUSD,
//         uint256 _mediumAwardsUSD,
//         uint256 _lowAwardsUSD,
//         uint256 _nSLOC,
//         uint256 _complxityScore,
//         uint256 _perComplexityUSD,
//         uint256 _perNSOLC_USD,
//         uint256 _numActors,
//         uint256 _numScopeSMCs,
//         uint256 _numDependencies,
//         uint256 _numTokenTypes,
//         uint256 _numBlockchains,
//         uint256 _numKnownIssues,
//         uint256 _numAdditionalIssues,
//         uint256 _numResources,
//         string calldata _setupDetails
//     )
//         public
//         isValidStringData("start date", _startDate)
//         isValidStringData("end date", _startDate)
//         isValidStringData("title", _title)
//         isValidUintData("total USD pool prize", _totalPrizePoolUSD)
//         isValidUintData("high USD awards", _highAwardsUSD)
//         isValidUintData("medium USD awards", _mediumAwardsUSD)
//         isValidUintData("low USD awards", _lowAwardsUSD)
//         isValidUintData("nSLOC", _nSLOC)
//         isValidUintData("complexity score", _complxityScore)
//         isValidUintData("USD per complexity", _perComplexityUSD)
//         isValidUintData("USD per NSOLC", _perNSOLC_USD)
//         isValidUintData("number of actors", _numActors)
//         isValidUintData("number of Scoped SMCs", _numScopeSMCs)
//         isValidUintData("number of blockchains", _numBlockchains)
//         isValidUintData("num resources", _numResources)
//     {
//         AuditProposer memory proposer = s_proposers[msg.sender][_email];

//         if (proposer.id == 0) {
//             revert DecentralizedAudition__ProposerNotExists(_email);
//         }

//         Audit memory audit = Audit({
//             id: proposer.auditCounter + 1,
//             title: _title,
//             startDate: _startDate,
//             endDate: _endDate,
//             totalPrizePoolUSD: _totalPrizePoolUSD,
//             highAwardsUSD: _highAwardsUSD,
//             mediumAwardsUSD: _mediumAwardsUSD,
//             lowAwardsUSD: _lowAwardsUSD,
//             nSLOC: _nSLOC,
//             complxityScore: _complxityScore,
//             perComplexityUSD: _perComplexityUSD,
//             perNSOLC_USD: _perNSOLC_USD,
//             numActors: _numActors,
//             numScopeSMCs: _numScopeSMCs,
//             numBlockchains: _numBlockchains,
//             numDependencies: _numDependencies,
//             numTokenTypes: _numTokenTypes,
//             numKnownIssues: _numKnownIssues,
//             numAdditionalIssues: _numAdditionalIssues,
//             setupDetails: _setupDetails,
//             numResources: _numResources
//         });

//         s_proposedAudits[proposer.id][msg.sender] = audit;
//         s_proposers[msg.sender][_email].auditCounter += 1;
//     }

//     // function addActor()
// }
