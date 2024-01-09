from brownie import HelloWorld, network, config, accounts
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
    hello_world = HelloWorld.deploy(
        "Welcome to EPFL",
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify")
    )
    log(f"contract has been deployed successfully to : {hello_world.address}")
    return hello_world

def msg(addr):
    hello_world = HelloWorld.at(addr)
    return hello_world.getMessage()

def main():
    contract = deploy()
    print("\n---\n")
    log(f"HelloWorld has the following message: {msg(contract.address)}")
