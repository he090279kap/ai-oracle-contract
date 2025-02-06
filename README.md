# 🤖 AI Oracle Smart Contract  

Этот смарт-контракт на **Solidity** позволяет отправлять запросы в **AI (ChatGPT)** с использованием **Chainlink Oracle**.  

## 🚀 Как развернуть?  
1. **Установите зависимости:**  
   ```bash
   npm install
2. Настройте переменные в hardhat.config.js
3. Разверните контракт:npx hardhat run scripts/deploy.js --network goerli


---

## **📜 3. Скрипт развертывания (`deploy.js`)**
```javascript
const hre = require("hardhat");

async function main() {
    const AIOracle = await hre.ethers.getContractFactory("AIOracle");
    const aiOracle = await AIOracle.deploy(
        "0xYourOracleAddress",  // Oracle адрес
        "0xYourJobID",          // Job ID
        "1000000000000000000",  // Chainlink fee
        "0xYourLinkTokenAddress" // LINK токен адрес
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

📌 Возможности
✅ Пользователь отправляет вопрос
✅ Контракт фиксирует запрос
✅ Оракул получает ответ от AI
✅ Контракт сохраняет и возвращает ответ
✅ Может быть использован в dApp


🌟 Поставьте звезду, если проект полезен! ⭐