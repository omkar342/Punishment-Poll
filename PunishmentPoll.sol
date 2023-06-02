// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PunishmentContract {
    enum PollOption { NoPunishment, Punishment }

    struct Poll { //
        bool active;
        mapping(address => bool) hasVoted;
        uint256 punishmentVotes;
        uint256 noPunishmentVotes;
    }

    mapping(uint256 => Poll) public polls; //
    uint256 public currentPollId = 0; //
    address public owner; //

    event PollCreated(uint256 pollId);
    event VoteCasted(uint256 pollId, PollOption option);
    event PunishmentTriggered(uint256 pollId, bool punish);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() { 
        owner = msg.sender; 
    }

    function checkAndTriggerPoll(uint256 inputValue) public {
        require(inputValue > 30, "Input value must be above 30 to trigger the poll");
        currentPollId++;
        polls[currentPollId].active = true;
        emit PollCreated(currentPollId);
    }

    function castVote(uint256 pollId, PollOption option) public {
        require(polls[pollId].active, "Poll is not active");
        require(!polls[pollId].hasVoted[msg.sender], "Already voted in this poll");
        polls[pollId].hasVoted[msg.sender] = true;

        if (option == PollOption.Punishment) {
            polls[pollId].punishmentVotes++;
        } else {
            polls[pollId].noPunishmentVotes++;
        }

        emit VoteCasted(pollId, option);
    }

    function endPoll(uint256 pollId) public onlyOwner {
        require(polls[pollId].active, "Poll is not active");
        polls[pollId].active = false;

        bool punish = polls[pollId].punishmentVotes > polls[pollId].noPunishmentVotes;
        emit PunishmentTriggered(pollId, punish);
    }
}
