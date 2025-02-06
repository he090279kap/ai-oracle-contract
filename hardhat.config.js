require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.7",
  networks: {
    goerli: {
      url: "https://eth-goerli.alchemyapi.io/v2/YOUR_ALCHEMY_API_KEY",
      accounts: ["YOUR_PRIVATE_KEY"]
    }
  }
};
