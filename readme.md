# Punishment Contract

This Solidity contract implements a polling mechanism to determine whether to trigger punishment based on a given input value. The contract allows users to create polls, cast votes, and end polls to determine the punishment outcome.

## Features

- Create a poll triggered by an input value above 30.
- Cast votes in a poll to decide between punishment or no punishment.
- End a poll to determine the punishment outcome based on the votes.

## Usage

### Prerequisites

- Solidity development environment
- Ethereum-compatible development blockchain (e.g., Ganache)
- Web3.js or Ethereum client library

### Deployment

1. Deploy the contract to an Ethereum network or local development blockchain.

2. Obtain the contract address and ABI for interacting with the contract.

### Interacting with the Contract

1. Initialize the contract by deploying it and assigning an address to the `owner` variable.

2. Call the `checkAndTriggerPoll` function, passing an input value above 30 as a parameter. This will create a new poll and emit the `PollCreated` event.

3. Users can cast their votes using the `castVote` function. They need to provide the poll ID and select either `NoPunishment` or `Punishment` as the option.

4. Once the voting period ends, the contract owner can call the `endPoll` function with the poll ID. This will finalize the poll, determine the punishment outcome based on the votes, and emit the `PunishmentTriggered` event.

### Events

The contract emits the following events:

- `PollCreated`: Indicates that a new poll has been created.
- `VoteCasted`: Indicates that a vote has been cast in a poll.
- `PunishmentTriggered`: Indicates the end of a poll and whether punishment should be triggered.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
