// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeletableMapping {
    // Input is keccak256(bytes memory)
    mapping (bytes32 => string) carfaxReports;
    uint32 currentMappingVersion;

    function getCarfaxReport(string memory _carVIN) external view returns(string memory) {
        bytes32 key = keccak256(bytes(string.concat(uintToString(currentMappingVersion),_carVIN)));
        return carfaxReports[key];
    }

    function setCarfaxReport(string memory _carVIN, string memory _reportJSON) external {
        bytes32 key = keccak256(bytes(string.concat(uintToString(currentMappingVersion),_carVIN)));
        carfaxReports[key] = _reportJSON;
    }

    function deleteAllReports() external {
        currentMappingVersion++;
    }

    function recoverGas(uint32 _version, string memory _carVIN) external {
        require(_version < currentMappingVersion);
        bytes32 key = keccak256(bytes(string.concat(uintToString(_version),_carVIN)));
        delete(carfaxReports[key]);
    }

    function uintToString(uint _i) internal pure 
      returns (string memory) {
      
      if (_i == 0) {
         return "0";
      }
      uint j = _i;
      uint len;
      
      while (j != 0) {
         len++;
         j /= 10;
      }
      bytes memory bstr = new bytes(len);
      uint k = len - 1;
      
      while (_i != 0) {
         bstr[k--] = bytes1(uint8(48 + _i % 10));
         _i /= 10;
      }
      return string(bstr);//access local variable
   }
}