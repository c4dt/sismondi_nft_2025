from brownie import LegendNFT, network, config, accounts


def deploy_contract():
    account = accounts[0]
    legend_contract = LegendNFT.deploy({"from" : account})
    print("contract has been deployed successfully to :", legend_contract.address)

    return legend_contract

def main():
    deploy_contract()
