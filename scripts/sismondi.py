from brownie import SismondiNFT, network, config, accounts, chain

import logging, sys
logging.basicConfig(filename='operations.log', encoding='utf-8', level=logging.INFO)

if network.show_active() == "development":
    account = accounts[0]
else:
    account = accounts.add(config["wallets"]["from_key"])

def log(txt):
    print(txt)
    logging.info(txt)

def fast_transaction():
    priority = 5_000_000_000
    network.priority_fee(priority)
    network.max_fee(chain.base_fee + priority)

def deploy():
    fast_transaction()
    sismondi_contract = SismondiNFT.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify")
    )
    log(f"contract has been deployed successfully to : {sismondi_contract.address}")
    return sismondi_contract

def mint(addr):
    fast_transaction()
    sismondi_contract = SismondiNFT.at(addr)
    nft = sismondi_contract.makeSismondiNFT({'from': account})
    nft_id = nft.events['NewSismondiNFTMinted']['tokenId']
    log(f"A new NFT with id {nft_id} has been successfully created in block {nft.block_number} with transaction {nft.txid}")
    return nft

def deploy_mint():
    contract = deploy()
    print("\n---\n")
    nft = mint(contract.address)
    log(f"{nft.events}")
    print("\n---\n")
    nft = mint(contract.address)
    log(f"{nft.events}")

def main():
    print("Please choose one of the following actions:")
    print("deploy - a new contract. Add --network development to deploy on local development network")
    print("mint #contractid - mints a new NFT. It prints the id of the NFT")
    sys.exit(1)
