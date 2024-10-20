# Rhizome Markets: A Synthetics and Lending Market Protocol Concept on Rootstock EVM based on Compound Finance v2 Contracts

As per the (LICENSE)[https://github.com/compound-finance/compound-protocol/blob/master/LICENSE] for the Compound v2 contracts, we have based the lending market contracts on Compound v2, and have added additional modifications to optimize the contracts for a synthetics protocol.
https://compound.finance/docs

An optimized interest rate model based on MakerDAO's original stability fee and Inverse Finance's implementation has been included for synthetics borrow rates:
https://andytudhope.github.io/community/scd-faqs/stability-fee/
https://github.com/InverseFinance/anchor

We have also included an automated Oracle to manually update prices of collaterals for assets that may not have an onchain oracle.
# Deployed Rootstock Contracts

Comptroller:               0xF714E8A4f7F4C8E16b35fF6f7E8480f99c796f49
Unitroller:                0x0d4c4fD591f90becFd7f2EfF3B01271068FdD3bc
Oracle:                    0xB2f69Dc0f3F8AF0A8649290fb95AEf4efdd8f9F4
Implementation:            0xF59e29A2e11DEbed7fDa66955b05260F8C68B807
MonetaryPolicy:            0x34449Cc01C0B6A2A7E2ff7c6C79B88f7302FeF93
rhUSD:                     0x9Ac9CC6C71902eEfE78902dCeAB135FE3ECCEcd0
rhUSD interestrate model:  0x12c604808E5A16DCdB94197F5b6F3c8A9CdE2c77
Factory:                   0xa74893A5808FB361C5089d134706A61E64ebBd8F
rBTC interest rate model:  0x2d29B5F122edd7BBF065f7B2f008398dBa07c036
rhrBTC:                    0x8e8b497609Fffebe0a0240cea7A5bBFA2036BC13