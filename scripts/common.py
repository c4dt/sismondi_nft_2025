from brownie import network, config, accounts, chain

import logging
logging.basicConfig(filename='operations.log', encoding='utf-8', level=logging.INFO)

if network.show_active() == "development":
    account = accounts[0]
else:
    account = accounts.add(config["wallets"]["from_key"])
    priority = 5_000_000_000
    network.priority_fee(priority)
    network.max_fee(chain.base_fee + priority)

def log_cost(tx_receipt):
    gas_used = tx_receipt.gas_used
    gas_price = tx_receipt.gas_price
    eth_spent = gas_used * gas_price / (10**18)
    log(f"Cost was {eth_spent:.4f} SepoliaETH")

def log(txt):
    print(txt)
    logging.info(txt)

