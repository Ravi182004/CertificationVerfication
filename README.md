 Blockchain Certificate Verification System

A decentralized certificate verification system built using Solidity and Ethereum Smart Contracts. This project enables educational institutions or organizations to issue, store, verify, and authenticate certificates securely on the blockchain.

 Features
Certificate Issuance: Only the authorized issuer (contract owner) can create certificates.
Unique Certificate IDs: Prevents duplicate certificate creation.
Certificate Storage: Stores student name, course name, issue date, certificate hash, and issuer details on-chain.
Certificate Verification: Anyone can verify whether a certificate exists on the blockchain.
Certificate Authentication: Validates certificate integrity by comparing cryptographic hashes.
Event Logging: Tracks issuance and verification activities through blockchain events.
Tamper-Proof Records: Ensures certificate data cannot be altered after issuance.

Technologies Used
Solidity ^0.8.20
Ethereum Blockchain
Smart Contracts
Remix IDE / Hardhat (for deployment and testing)

Smart Contract Functions
issueCertificate() – Issues a new certificate.
getCertificate() – Retrieves certificate details.
verifyCertificate() – Checks whether a certificate exists.
authenticateCertificate() – Confirms certificate authenticity using hash comparison.
certificateExists() – Returns the existence status of a certificate.

Security Features
Owner-based access control using the onlyOwner modifier.
Duplicate certificate prevention.
Cryptographic hash verification for document authenticity.

Use Cases
University Degree Verification
Online Course Certification
Employee Training Certificates
Professional Skill Certifications
Academic Credential Validation

This project demonstrates how blockchain technology can provide a secure, transparent, and tamper-resistant solution for digital certificate management and verification.
