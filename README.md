# Rhizome Markets: A Synthetics and Lending Market Protocol Concept on Rootstock EVM based on Compound Finance v2 Contracts

As per the (LICENSE)[https://github.com/compound-finance/compound-protocol/blob/master/LICENSE] for the Compound v2 contracts, we have based the lending market contracts on Compound v2, and have added additional modifications to optimize the contracts for a synthetics protocol.
https://compound.finance/docs

An optimized interest rate model based on MakerDAO's original stability fee and Inverse Finance's implementation has been included for synthetics borrow rates:
https://andytudhope.github.io/community/scd-faqs/stability-fee/
https://github.com/InverseFinance/anchor
We have also included an automated Oracle to manually update prices of collaterals for assets that may not have an onchain oracle.

# Bitcoin Collateralized Synthetics
A Bitcoin synthetics protocol allows users to create and trade synthetic assets—tokens that represent and track the value of other assets like fiat currencies, commodities, or equities—while using Bitcoin as collateral. With Rhizome, Bitcoin holders can participate on complex financial activities such as hedging, yield farming, and CDPs directly on the Rootstock EVM.

### Capital Efficiency Through Multicollateralization of rhUSD
Synthetics, primarily the rhUSD dollar pegged instance deployed as an example of the Rootstock EVM mainnet, offers multicollateral support for collateralizing rhUSD, which offers significant advantages:
- Capital Efficiency: Utilizing multiple assets (rBTC, RIF, USDRIF, ETHs) as collateral allows for more efficient use of capital, enabling users to leverage a broader asset base.
- Rehypothecation: Assets used as collateral can be rehypothecated, meaning they can be used simultaneously in multiple financial operations, enhancing liquidity.
- Ecosystem: Promotes interoperability within the Rootstock DeFi ecosystem, increasing the utility of various tokens.
- 
Additionally, relying solely on Bitcoin as collateral exposes the system to Bitcoin's price volatility. This can be mitigated with stablecoins or more stable assets in the multicollateral pool for all rh synthetics.
- Liquidation Risks: Sharp declines in Bitcoin's price can trigger collateral liquidations, destabilizing the system.
- Over-Collateralization: Users may need to provide excessive collateral to safeguard against volatility, reducing capital efficiency.
- Risk Diversification: The volatility of Bitcoin can be offset by the stablecoins, by default decreasing risk compared to a purely BTC collateralized CDP protocol.
- Stability: A diversified collateral pool enhances the stability of the synthetic stablecoin and decreasing the risk of liquidation for debt positions, maintaining its peg more effectively.

### Stabilizers
Stabilizers are multiple modules in the Rhizome protocol that strengthen the peg price for minted rh synthetic assets. For instance, each synthetic can have it's own Peg Stability Modules (PSM) based on the MakerDAO DAI-USDC PSM with various customizations to the swap fee. In the case of rhUSD, the alternative asset to rhUSD would be rUSDT, the fiat stablecoin with the largest dominance on Rootstock at 34.44%. Additionally, as utilized by MakerDAO and Inverse, the amount of synthetics can be controlled by governance or an administrator address through increasing and decreasing the liquidity of mintable synthetics.

In these deployed contracts, only a US-dollar pegged synthetic, rhUSD, has been deployed, but any synthetic can be deployed as long as there is a secure oracle for the asset on Rootstock EVM. In the case for rhUSD, the price is hardcoded at 1.
# Deployed Rootstock Contracts - Mainnet

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
