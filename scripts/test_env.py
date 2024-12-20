from brownie import HelloWorld, network, config
from .common import account, log, log_cost, check_gas

def deploy():
    check_gas()
    hello_world = HelloWorld.deploy(
        "Welcome to EPFL",
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify")
    )
    log(f"Contract has been deployed successfully to : {hello_world.address}")
    log_cost(hello_world.tx)
    return hello_world

def msg(addr):
    hello_world = HelloWorld.at(addr)
    return hello_world.getMessage()

def main():
    contract = deploy()
    print("\n---\n")
    log(f"HelloWorld has the following message: {msg(contract.address)}")
