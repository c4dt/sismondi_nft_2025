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

def deploy():
    sismondi_contract = SismondiNFT.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify")
    )
    log(f"contract has been deployed successfully to : {sismondi_contract.address}")
    return sismondi_contract

def mint(addr):
    sismondi_contract = SismondiNFT.at(addr)
    nft = sismondi_contract.makeSismondiNFT({'from': account})
    nft_id = nft.events['NewSismondiNFTMinted']['tokenId']
    log(f"A new NFT with id {nft_id} has been successfully created in block {nft.block_number} with transaction {nft.txid}")
    return nft

def main():
    contract = deploy()
    print("\n---\n")
    nft = mint(contract.address)
    print("\n---\n")
    nft = mint(contract.address)
