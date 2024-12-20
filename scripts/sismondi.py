from brownie import SismondiNFT, network, config
from .common import account, log, log_cost, check_gas

import sys
def deploy(nowait=False):
    check_gas(nowait)
    sismondi_contract = SismondiNFT.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify")
    )
    log(f"contract has been deployed successfully to : {sismondi_contract.address}")
    log_cost(sismondi_contract.tx)
    return sismondi_contract

def mint(addr, nowait = False):
    check_gas(nowait)
    sismondi_contract = SismondiNFT.at(addr)
    nft = sismondi_contract.makeSismondiNFT({'from': account})
    nft_id = nft.events['NewSismondiNFTMinted']['tokenId']
    log(f"A new NFT with id {nft_id} has been successfully created in block {nft.block_number} with transaction {nft.txid}")
    log_cost(nft)
    return nft

def deploy_mint(nowait = False):
    contract = deploy(nowait)
    print("\n---\n")
    nft = mint(contract.address, nowait)
    print("\n---\n")
    nft = mint(contract.address, nowait)

def main():
    print("Please choose one of the following actions:")
    print("deploy - a new contract. Add --network development to deploy on local development network")
    print("mint #contractid - mints a new NFT. It prints the id of the NFT")
    sys.exit(1)
