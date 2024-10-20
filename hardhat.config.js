require("@nomiclabs/hardhat-waffle");
require("@nomicfoundation/hardhat-verify");

require("hardhat-gas-reporter");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

module.exports = {
  networks: {
    localhost: {
      //Requires start of local network at port:
      url: "http://127.0.0.1:8545",
    },
    // hardhat: {
    //   forking: {
    //     url: "https://sepolia.base.org",
    //     accounts: [process.env.PRIVATE_KEY],
    //   },
    // },
    // goerli: {
    //   url: process.env.GOERLI_URL,
    //   //Consider any address posted here to be compromised
    //   accounts: [process.env.PRIVATE_KEY_1, process.env.PRIVATE_KEY_2],
    // },
    // base: {
    //   url: process.env.BASE_URL,
    //   //Consider any address posted here to be compromised
    //   accounts: [process.env.PRIVATE_KEY],
    //   saveDeployments: true,
    //   gasPrice: 300000000, // 0.3 gwei
    // },
    rootstock: {
      url: process.env.ROOTSTOCK_URL,
      chainId: 30,
      accounts: [process.env.PRIVATE_KEY],
      saveDeployments: true,
      gasPrice: 100000000, // 0.1 gwei
    },
    rootstock_testnet: {
      url: process.env.ROOTSTOCKTESTNET_URL,
      chainId: 31,
      accounts: [process.env.PRIVATE_KEY],
      saveDeployments: true,
      gasPrice: 100000000, // 0.1 gwei
    },
    base_sepolia: {
      url: process.env.BASE_SEPOLIA_URL,
      chainId: 84532,
      accounts: [process.env.PRIVATE_KEY],
      saveDeployments: true,
      gasPrice: 300000000, // 0.1 gwei,
      gasMultiplier: 2,
    }
  },
  solidity: {
    compilers: [
      {
        version: "0.5.16",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  mocha: {
    timeout: 10000000000,
  },
  gasReporter: {
    enabled: false,
    currency: "USD",
    gasPriceApi:
      "https://api.etherscan.io/api?module=proxy&action=eth_gasPrice",
  },
  etherscan: {
    apiKey: {
      base_sepolia: process.env.ETHERSCAN_KEY,
    },
    customChains: [
      {
        network: "base_sepolia",
        chainId: 84532,
        urls: {
          apiURL: "https://api-sepolia.basescan.org/api",
          browserURL: "https://sepolia.basescan.org",
        },
      },
      {
        network: "rootstock",
        chainId: 30,
        urls: {
          apiURL: "https://rootstock.blockscout.com/api/v2/",
          browserURL: "https://rootstock.blockscout.com/",
        }
      },
      {
        network: "rootstock_testnet",
        chainId: 31,
        urls: {
          apiUrl: "https://rootstock-testnet.blockscout.com/api/v2/",
          browserURL: "https://rootstock-testnet.blockscout.com/",
        }
      },
    ],
  },
};