// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CertificateVerification {

    address public owner;

    struct Certificate {
        string certificateId;   
        string studentName;     
        string courseName;
        uint256 issueDate;      
        string certificateHash; 
        address issuerAddress;  
        bool exists;            
    }

    
    mapping(string => Certificate) public certificates;


    event CertificateIssued(
        string certificateId,
        string studentName,
        string courseName,
        address indexed issuer
    );

    event CertificateVerified(
        string certificateId,
        address indexed verifier,
        uint256 timestamp
    );


    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Only the owner (issuer) can perform this action");
        _; 
    }

    
    constructor() {
        owner = msg.sender; 
    }


    function issueCertificate(
        string memory _certificateId,
        string memory _studentName,
        string memory _courseName,
        string memory _certificateHash
    ) public onlyOwner {
        
        require(!certificates[_certificateId].exists, "Error: Certificate with this ID already exists");

        
        certificates[_certificateId] = Certificate({
            certificateId: _certificateId,
            studentName: _studentName,
            courseName: _courseName,
            issueDate: block.timestamp, 
            certificateHash: _certificateHash,
            issuerAddress: msg.sender,
            exists: true
        });

        
        emit CertificateIssued(_certificateId, _studentName, _courseName, msg.sender);
    }

    
    function getCertificate(string memory _certificateId)
        public
        view
        returns (
            string memory certificateId,
            string memory studentName,
            string memory courseName,
            uint256 issueDate,
            string memory certificateHash,
            address issuerAddress
        )
    {
        require(certificates[_certificateId].exists, "Error: Certificate does not exist");

        Certificate memory cert = certificates[_certificateId];
        return (
            cert.certificateId,
            cert.studentName,
            cert.courseName,
            cert.issueDate,
            cert.certificateHash,
            cert.issuerAddress
        );
    }

    
    function verifyCertificate(string memory _certificateId) public returns (bool) {
        bool exists = certificates[_certificateId].exists;

        if (exists) {
            emit CertificateVerified(_certificateId, msg.sender, block.timestamp);
        }

        return exists;
    }


    function certificateExists(string memory _certificateId) public view returns (bool) {
        return certificates[_certificateId].exists;
    }
    function authenticateCertificate(
        string memory _certificateId,
        string memory _providedHash
    ) public view returns (bool isAuthentic){
        require(certificates[_certificateId].exists, "Error: Certificate does not exist");

        
        isAuthentic = keccak256(bytes(certificates[_certificateId].certificateHash))
                        == keccak256(bytes(_providedHash));
    }
}

