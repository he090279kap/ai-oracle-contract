
---

### ** `deploy.js` (Скрипт развертывания)**  
```javascript
const hre = require("hardhat");

async function main() {
    const AIOracle = await hre.ethers.getContractFactory("AIOracle");
    const aiOracle = await AIOracle.deploy(
        "0xYourOracleAddress",
        "0xYourJobID",
        "1000000000000000000",
        "0xYourLinkTokenAddress"
    );

    await aiOracle.deployed();
    console.log("AIOracle контракт развернут по адресу:", aiOracle.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
