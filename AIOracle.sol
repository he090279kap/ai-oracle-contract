// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AIOracle is ChainlinkClient, Ownable {
    using Chainlink for Chainlink.Request;

    // Переменные для Chainlink
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    // Запросы AI
    mapping(bytes32 => string) public aiResponses;

    event AIRequested(bytes32 indexed requestId, string query);
    event AIReceived(bytes32 indexed requestId, string response);

    constructor(address _oracle, bytes32 _jobId, uint256 _fee, address _link) {
        setChainlinkToken(_link);
        oracle = _oracle;
        jobId = _jobId;
        fee = _fee;
    }

    // Функция отправки запроса AI
    function requestAIResponse(string memory _query) public returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        request.add("query", _query);
        requestId = sendChainlinkRequestTo(oracle, request, fee);

        emit AIRequested(requestId, _query);
    }

    // Функция получения ответа от AI
    function fulfill(bytes32 _requestId, string memory _response) public recordChainlinkFulfillment(_requestId) {
        aiResponses[_requestId] = _response;
        emit AIReceived(_requestId, _response);
    }

    // Функция просмотра ответа AI
    function getAIResponse(bytes32 _requestId) public view returns (string memory) {
        return aiResponses[_requestId];
    }
}
